//
//  EVEKills.m
//  EveAPI
//
//  Created by Johnathan Richter on 10/3/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import "EVEKills.h"
#import "EVESolarSystemKills.h"

@interface EVEKills ()

@end

@implementation EVEKills

#pragma mark - Instance Methods

-(EVEKills  *)init;
{
   self = [super init];
   if (self)
   {
      // Common API Properties
      self.commonName = @"Kills";
      [self.url appendString:@"map/Kills.xml.aspx"];

      self.cakAccessMask = @0;
      self.cacheStyle = kModifiedShortCache;
      
      // Built Object Properties
      self.systemKills = [NSArray new];
      self.dataFromDate = [NSDate new];
   }
   
   return self;
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
   
   XKObjectDescriptor *systemKills = [[EVESolarSystemKills new] objectDescriptor];
   [systemKills setElementName:@"row"];
   
   XKObjectDescriptor *dataTime = [[EVEDate new] objectDescriptor];
   [dataTime setElementName:@"dataTime"];
   
   //
   // Add the descriptors to our collection
   //
   
   [self.objectDescriptors addObjectsFromArray:@[systemKills, dataTime]];
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
      if (NSClassFromString(objectClass) == [EVESolarSystemKills class])
      {
         NSMutableArray *systemKillsList = [NSMutableArray new];
         for (EVESolarSystemKills *systemKills in builtObjects[objectClass])
         {
            [systemKillsList addObject:systemKills];
         }
         self.systemKills = [NSArray arrayWithArray:systemKillsList];
      }
      else if (NSClassFromString(objectClass) == [EVEDate class])
      {
         for (EVEDate *dataFromDate in builtObjects[objectClass])
         {
            self.dataFromDate = [dataFromDate date];
         }
      }
   }
   
   [[NSNotificationCenter defaultCenter] postNotificationName:NSStringFromClass([self class])
                                                       object:nil
                                                     userInfo:nil];
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
                           @"API Error:\t\t\t\t\t%@\n\n"
                           @"Data Created On Date: %@\n\n",
                           self.commonName,
                           self.apiVersion,
                           self.url,
                           self.cakAccessMask,
                           self.lastQueried,
                           self.cachedUntil,
                           [EVEApiObject cacheStyleToString:self.cacheStyle],
                           self.apiError,
                           self.dataFromDate];
   
   for (EVESolarSystemKills *systemKills in self.systemKills)
   {
      [str appendFormat:@"%@\n", systemKills];
   }
   
   return [NSString stringWithString:str];
}

@end
