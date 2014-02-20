//
//  XKURLRequestOperation.m
//  EveAPI
//
//  Created by Johnathan Richter on 2/14/14.
//  Copyright (c) 2014 Johnathan Richter. All rights reserved.
//

#import "XKURLRequestOperation.h"
#import "XKObjectBuilder.h"

@interface XKURLRequestOperation ()

@property BOOL requestWithPOST;
@property (strong) NSURLRequest *urlRequest;
@property (strong) NSURLConnection *urlConnection;
@property (strong) NSMutableData *receivedData;

-(NSString *)urlEncodeString:(NSString *)string;
-(void)formatURLRequest;
-(void)buildObjects;

#pragma mark - NSOperation Method Overrides

-(void)main;

@end

@implementation XKURLRequestOperation

-(instancetype)init
{
   self = [super init];
   if (self)
   {
      self.url = @"";
      self.parameters = @{};
      self.objectDescriptors = @[];
      self.successBlock = nil;
      self.failureBlock = nil;
      
      self.requestWithPOST = NO;
      self.urlRequest = nil;
      self.urlConnection = nil;
      self.receivedData = nil;
   }
   
   return self;
}

-(instancetype)initWithURL:(NSString *)url
                Parameters:(NSDictionary *)parameters
         ObjectDescriptors:(NSArray *)objectDescriptors
                   UsePOST:(BOOL)usePOST
                   Success:(XKSuccessBlock)successBlock
                   Failure:(XKFailureBlock)failureBlock
{
   self = [super init];
   if (self)
   {
      self.url = url;
      self.parameters = parameters;
      self.objectDescriptors = objectDescriptors;
      self.successBlock = successBlock;
      self.failureBlock = failureBlock;
      
      self.requestWithPOST = usePOST;
      self.urlRequest = nil;
      self.urlConnection = nil;
      self.receivedData = nil;
   }
   
   return self;
}

+(instancetype)requestWithURL:(NSString *)url
                   Parameters:(NSDictionary *)parameters
            ObjectDescriptors:(NSArray *)objectDescriptors
                      UsePOST:(BOOL)usePOST
                      Success:(XKSuccessBlock)successBlock
                      Failure:(XKFailureBlock)failureBlock
{
   XKURLRequestOperation *newInstance =
      [[XKURLRequestOperation alloc] initWithURL:url
                                      Parameters:parameters
                               ObjectDescriptors:objectDescriptors
                                         UsePOST:usePOST
                                         Success:successBlock
                                         Failure:failureBlock];
   return newInstance;
}

-(void)startRequest
{
   //
   // Check all prerequisites
   //
   
   if (!self.successBlock || !self.failureBlock)
   {
      NSLog(@"XKSuccessBlock or XKFailureBlock not given to XMLKit. Exiting...");
      return;
   }
   
   if (!self.url || [self.url length] == 0)
   {
      NSDictionary *userInfo =
      @{NSLocalizedDescriptionKey:
           NSLocalizedString(@"URL to contact missing or invalid.",
                             nil)};
      
      NSError *error = [NSError errorWithDomain:XKErrorDomain
                                           code:kXKURLRequestOperationErrorInvalidURL
                                       userInfo:userInfo];
      self.failureBlock(nil, error);
   }
   
   if (!self.parameters)
   {
      // We can have no arguments along with the URL
      self.parameters = @{};
   }
   
   if (!self.objectDescriptors || [self.objectDescriptors count] == 0)
   {
      NSDictionary *userInfo =
         @{NSLocalizedDescriptionKey:
              NSLocalizedString(@"Object descriptors were not provided to the request operation.",
                                nil)};
      
      NSError *error = [NSError errorWithDomain:XKErrorDomain
                                           code:kXKURLRequestOperationErrorMissingObjectDescriptors
                                       userInfo:userInfo];
      self.failureBlock(nil, error);
   }

   //
   // Create the NSURLRequest for GET or POST
   //
   
   [self formatURLRequest];
   
   //
   // Call the NSOperation -main method to start the non-concurrent processing
   //
   
   [self main];
}

-(void)formatURLRequest
{
   NSMutableURLRequest *urlRequest =
      [NSMutableURLRequest requestWithURL:[NSURL URLWithString:[self urlEncodeString:self.url]]
                              cachePolicy:NSURLRequestReloadIgnoringLocalCacheData
                          timeoutInterval:60.0];
   
   NSMutableString *parameterString = [NSMutableString new];
   NSArray *parameterVariables = [self.parameters allKeys];
   
   for (NSString *variable in parameterVariables)
   {
      // Pointer compare here is acceptable, we are looking for the exact same object
      if (variable == [parameterVariables firstObject])
      {
         [parameterString appendFormat:@"?%@=%@", variable, self.parameters[variable]];
      }
      else
      {
         [parameterString appendFormat:@"&%@=%@", variable, self.parameters[variable]];
      }
   }
   
   NSString *encodedParameters = [self urlEncodeString:parameterString];
   
   if (self.requestWithPOST)
   {
      [urlRequest setHTTPMethod:@"POST"];
      [urlRequest setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
      [urlRequest setHTTPBody:[encodedParameters dataUsingEncoding:NSASCIIStringEncoding]];
   }
   else
   {
      [urlRequest setURL:[NSURL URLWithString:encodedParameters]];
   }
}

-(NSString *)urlEncodeString:(NSString *)string
{
   NSString *encoded =
      (NSString *)CFBridgingRelease(
         CFURLCreateStringByAddingPercentEscapes(NULL,
                                                 (CFStringRef)string,
                                                 NULL,
                                                 (CFStringRef)@"!*'();:@&=+$,/?%#[]",
                                                 kCFStringEncodingUTF8));
   if (!encoded || [encoded length] == 0)
   {
      NSDictionary *userInfo =
         @{NSLocalizedDescriptionKey:
              NSLocalizedString(@"Object descriptors were not provided to the request operation.",
                                nil)};
      
      NSError *error = [NSError errorWithDomain:XKErrorDomain
                                           code:kXKURLRequestOperationErrorURLEncode
                                       userInfo:userInfo];
      self.failureBlock(nil, error);
   }
   
   return encoded;
}

-(void)buildObjects
{
   //
   // Create our XKObjectBuilder
   //
   
   XKObjectBuilder *builder = [[XKObjectBuilder alloc] initWithData:self.receivedData
                                                  ObjectDescriptors:self.objectDescriptors
                                                            Success:self.successBlock
                                                            Failure:self.failureBlock];
   [builder buildObjects];
}

#pragma mark - NSOperation Overridden Methods

-(void)main
{
   if (!self.urlConnection)
   {
      // Kick off the request
      self.receivedData = [NSMutableData data];
      self.urlConnection = [NSURLConnection connectionWithRequest:self.urlRequest
                                                         delegate:self];
   }
}

#pragma mark - NSURLConnectionDelegateMethods

- (BOOL)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
   // This method is called when the server has determined that it
   // has enough information to create the NSURLResponse.
   // It can be called multiple times, for example in the case of a
   // redirect, so each time we reset the data.
   
   [self.receivedData setLength:0];
   return YES;
}

- (void) connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
   // Append the new data to receivedData.
   [self.receivedData appendData:data];
}

-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
#ifdef XMLKITDEBUG
   // We should release the connection and data object, but with ARC we do not have to
   NSLog(@"Connection failed! Error - %@ %@",
         [error localizedDescription],
         [[error userInfo] objectForKey:NSURLErrorFailingURLStringErrorKey]);
#endif
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
#ifdef XMLKITDEBUG
   NSLog(@"Received %ld bytes of data", (unsigned long)[self.receivedData length]);
   
   //
   // Print the XML data we received for debugging purposes
   //
   
   NSString *receivedDataString =
      [[NSString alloc] initWithBytes:[self.receivedData mutableBytes]
                               length:[self.receivedData length] encoding:NSUTF8StringEncoding];
   
   NSLog(@"Received data string: %@", receivedDataString);
   
#endif
   
   [self buildObjects];
}

@end
