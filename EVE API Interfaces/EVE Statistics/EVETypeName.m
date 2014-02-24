//
//  EVETypeName.m
//  EveAPI
//
//  Created by Johnathan Richter on 10/3/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import "EVETypeName.h"
#import "EVEType.h"

@interface EVETypeName ()

@property unsigned int maxEntriesPerCall;
@property (strong) NSMutableArray *idsToQuery;

-(BOOL)didQueryMoreIds;
-(NSString *)createNextIdBatchToQuery;

@end

@implementation EVETypeName

#pragma mark - Instance Methods

-(instancetype)initWithIds:(NSArray *)ids
{
   self = [super init];
   if (self)
   {
      // Common API Properties
      self.commonName = @"Type ID to Name";
      [self.url appendString:@"eve/TypeName.xml.aspx"];
      
      self.cakAccessMask = @0;
      self.cacheStyle = kModifiedShortCache;
      
      // Built Object Properties
      self.types = @[];
      
      // Instance Properties
      self.maxEntriesPerCall = 250;
      self.ids = [ids copy];
      self.idsToQuery = [NSMutableArray new];
      for (NSNumber *typeId in self.ids)
      {
         [self.idsToQuery addObject:[typeId stringValue]];
      }
      
      // URL Parameters Setup
      [self.urlParameters addEntriesFromDictionary:@{@"ids":[self createNextIdBatchToQuery]}];
   }
   
   return self;
}

-(NSString *)createNextIdBatchToQuery
{
   //
   // Restrict each request to the max entries allowed per API call.
   //
   
   NSMutableArray *nextIdBatchToQuery = [NSMutableArray new];
   if ([self.idsToQuery count] > self.maxEntriesPerCall)
   {
      for (unsigned int index = 0; index < self.maxEntriesPerCall; ++index)
      {
         [nextIdBatchToQuery addObject:self.idsToQuery[index]];
      }
   }
   else
   {
      [nextIdBatchToQuery addObjectsFromArray:self.idsToQuery];
   }
   
   // Remove the next batch from our idsToQuery list
   [self.idsToQuery removeObjectsInArray:nextIdBatchToQuery];
   
   // Return a string of all typeIds separated by a comma
   return [nextIdBatchToQuery componentsJoinedByString:@","];
}

-(BOOL)didQueryMoreIds
{
   // if there are objects in the 'idsToQuery' array then we are not finished
   if ([self.idsToQuery count] == 0)
   {
      return NO;
   }
   
   self.urlParameters[@"ids"] = [self createNextIdBatchToQuery];
   
#ifdef DEBUG
   NSLog(@"Retrieving more type names.");
#endif
   
   // Asynchronously fetch the next batch of type names
   [self performRequest];
   
   return YES;
}

/*
 * Subclass must call this parent class function
 */
-(void)configureObjectDescriptors
{
   [super configureObjectDescriptors];
   
   //
   // Configure all of the object descriptors required to process this API
   //
   
   XKObjectDescriptor *type = [[EVEType new] objectDescriptor];
   [type setElementName:@"row"];
   
   //
   // Add the descriptors to our collection
   //
   
   [self.objectDescriptors addObjectsFromArray:@[type]];
}

/*
 * Subclass must call this parent class function
 */
-(void)requestOperationSucceededWithObjects:(NSDictionary *)builtObjects
                                      Error:(NSError *)error
{
   // Call our base class function to handle any inherited built objects
   [super requestOperationSucceededWithObjects:builtObjects Error:error];
   
   for (NSString *objectClass in builtObjects)
   {
      if (NSClassFromString(objectClass) == [EVEType class])
      {
         NSMutableArray *types = [NSMutableArray arrayWithArray:self.types];
         for (EVEType *type in builtObjects[objectClass])
         {
            [types addObject:type];
         }
         self.types = [NSArray arrayWithArray:types];
      }
   }
   
   if (![self didQueryMoreIds])
   {
      [[NSNotificationCenter defaultCenter] postNotificationName:NSStringFromClass([self class])
                                                          object:nil
                                                        userInfo:nil];
   }
}

/*
 * Subclass must call this parent class function
 */
-(void)requestOperationFailedWithError:(NSError *)error;
{
   [super requestOperationFailedWithError:error];
   
   [[NSNotificationCenter defaultCenter] postNotificationName:NSStringFromClass([self class])
                                                       object:nil
                                                     userInfo:@{@"error":error}];
}

-(NSString *)description
{
   NSMutableString *str = [NSMutableString stringWithFormat:
                           @"%@ - Version %@\n\n"
                           @"URL:\t\t\t\t\t\t%@\n"
                           @"CAK Access Mask Required:\t%@\n"
                           @"Date Last Queried:\t\t\t%@\n"
                           @"Cached Until:\t\t\t\t%@\n"
                           @"Cache Style:\t\t\t\t%@\n"
                           @"API Error:\t\t\t\t\t%@\n\n",
                           self.commonName,
                           self.apiVersion,
                           self.url,
                           self.cakAccessMask,
                           self.lastQueried,
                           self.cachedUntil,
                           [EVEApiObject cacheStyleToString:self.cacheStyle],
                           self.apiError];
   
   for (EVEType *type in self.types)
   {
      [str appendFormat:@"%@\n", type];
   }
   
   return [NSString stringWithString:str];
}

@end
