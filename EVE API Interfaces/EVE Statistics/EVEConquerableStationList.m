//
//  EVEConquerableStationList.m
//  EveAPI
//
//  Created by Johnathan Richter on 10/3/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import "EVEConquerableStationList.h"
#import "EVEConquerableStation.h"

@interface EVEConquerableStationList ()

@end

@implementation EVEConquerableStationList

#pragma mark - Instance Methods

-(instancetype)init;
{
   self = [super init];
   if (self)
   {
      // Common API Properties
      self.commonName = @"Conquerable Stations";
      [self.url appendString:@"eve/ConquerableStationList.xml.aspx"];

      self.cakAccessMask = @0;
      self.cacheStyle = kModifiedShortCache;
      
      // Built Object Properties
      self.conquerableStations = @[];
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
   
   XKObjectDescriptor *station = [[EVEConquerableStation new] objectDescriptor];
   [station setElementName:@"row"];
   
   //
   // Add the descriptors to our collection
   //
   
   [self.objectDescriptors addObjectsFromArray:@[station]];
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
      if (NSClassFromString(objectClass) == [EVEConquerableStation class])
      {
         NSMutableArray *conquerableStations = [NSMutableArray new];
         for (EVEConquerableStation *conqerableStation in builtObjects[objectClass])
         {
            [conquerableStations addObject:conqerableStation];
         }
         self.conquerableStations = [NSArray arrayWithArray:conquerableStations];
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
                           @"API Error:\t\t\t\t\t%@\n\n",
                           self.commonName,
                           self.apiVersion,
                           self.url,
                           self.cakAccessMask,
                           self.lastQueried,
                           self.cachedUntil,
                           [EVEApiObject cacheStyleToString:self.cacheStyle],
                           self.apiError];
   
   for (EVEConquerableStation *conquerableStation in self.conquerableStations)
   {
      [str appendFormat:@"%@\n", conquerableStation];
   }
   
   return [NSString stringWithString:str];
}

@end
