//
//  EVEApi.m
//  EveAPI
//
//  Created by Johnathan Richter on 10/3/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import "EVEApiObject.h"
#import "EVEApi.h"

@interface EVEApiObject ()

-(void)initializeSuccessAndFailureBlocks;

@end

@implementation EVEApiObject

-(EVEApiObject *)init
{
   self = [super init];
   if (self)
   {
      // Common API Properties
      self.commonName = @"";
      self.url = [NSMutableString stringWithString:@"https://api.eveonline.com/"];
      self.urlParameters = [NSMutableDictionary new];
      self.cakAccessMask = @0;
      self.cacheStyle = kLongCache;
      
      // Built Object Properties
      self.apiVersion = @0;
      self.lastQueried = [EVEDate new];
      self.cachedUntil = [EVEDate new];
      self.apiError = [EVEError new];
      
      // Object Building Properties
      self.objectDescriptors = [NSMutableArray new];
      
      [self initializeSuccessAndFailureBlocks];
      [self configureObjectDescriptors];
   }
   
   return self;
}

-(void)initializeSuccessAndFailureBlocks
{
   typeof(self) __weak weakSelf = self;
   
   self.successBlock = ^(NSDictionary *builtObjects, NSError *error)
   {
      [weakSelf requestOperationSucceededWithObjects:builtObjects Error:error];
   };
   
   self.failureBlock = ^(NSError *error)
   {
      [weakSelf requestOperationFailedWithError:error];
   };
}

/*
 * Subclass must call this parent class function
 */
-(void)configureObjectDescriptors
{
   //
   // Set up EVEApi object blueprint and relationships
   //
   
   EVEApi *eveapi = [EVEApi new];
   [eveapi.objectDescriptor setElementName:@"eveapi"];
   [eveapi setRelationshipsWithLastQueried:@"currentTime"
                               CachedUntil:@"cachedUntil"
                                  ApiError:@"error"];
   //
   // Add all of our object blueprints to our object
   //
   
   [self.objectDescriptors addObject:eveapi.objectDescriptor];
}

-(void)performRequest
{
   //
   // Configure our RequestOperation with URI and Arguements
   //
   
   self.requestOperation = [XKURLRequestOperation new];

   [self.requestOperation setUrl:[self.url copy]];
   [self.requestOperation setParameters:[self.urlParameters copy]];
   [self.requestOperation setObjectDescriptors:self.objectDescriptors];
   [self.requestOperation setSuccessBlock:self.successBlock];
   [self.requestOperation setFailureBlock:self.failureBlock];
   
   //
   // Request the data from the API URL
   //
   
   [self.requestOperation startRequest];
}

/*
 * Subclass must call this parent class function
 */
-(void)requestOperationSucceededWithObjects:(NSDictionary *)builtObjects
                                      Error:(NSError *)error
{
   if (error && error.code != 0)
   {
      NSLog(@"Non-terminal error while building objects.\nCode: %ld\nDescription: %@",
            (long)error.code, error.description);
   }
   
   for (id objectClass in builtObjects)
   {
      if (NSClassFromString(objectClass) == [EVEApi class])
      {
         for (EVEApi *eveApi in builtObjects[objectClass])
         {
            self.apiVersion = eveApi.apiVersion;
            self.lastQueried = eveApi.lastQueried;
            self.cachedUntil = eveApi.cachedUntil;
            self.apiError = eveApi.apiError;
         }
         
         // Break out of the loop for efficiency since we only are looking for one object
         break;
      }
   }
}

/*
 * Subclass must call this parent class function
 */
-(void)requestOperationFailedWithError:(NSError *)error
{
   NSLog(@"Error occurred while building objects.\nCode: %ld\nDescription: %@",
         (long)error.code, error.description);
}

#pragma mark - Helper Methods for Printing

+(NSString *)cacheStyleToString:(EVECacheStyle)style
{
   switch (style)
   {
      case kShortCache:
         return @"Short Cache";
         
      case kModifiedShortCache:
         return @"Modified Short Cache";
         
      case kLongCache:
         return @"Long Cache";
         
      default:
         return @"Invalid Cache Style";
   }
}

@end
