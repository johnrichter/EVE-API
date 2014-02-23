//
//  EVEAllianceList.m
//  EveAPI
//
//  Created by Johnathan Richter on 10/3/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import "EVEAllianceList.h"
#import "EVEAlliances.h"
#import "EVEAlliance.h"

@interface EVEAllianceList ()

@end

@implementation EVEAllianceList

#pragma mark - Instance Methods

-(instancetype)init;
{
   self = [super init];
   if (self)
   {
      // Common API Properties
      self.commonName = @"Alliance List";
      [self.url appendString:@"eve/AllianceList.xml.aspx"];
      
      self.cakAccessMask = @0;
      self.cacheStyle = kModifiedShortCache;
      
      // Built Object Properties
      self.alliances = @[];
   }
   
   return self;
}

-(NSString *)description
{
   NSMutableString *api = [NSMutableString stringWithFormat:
                           @"%@ - Version %@\n\n"
                           @"URI:\t\t\t\t\t\t%@\n"
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
   
   for (EVEAlliance *alliance in self.alliances)
   {
      [api appendFormat:@"%@\n", alliance];
   }
   
   return api;
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
   
   EVEAlliances *alliances = [EVEAlliances new];
   [alliances.objectDescriptor setElementName:@"rowset"];
   [alliances.objectDescriptor setElementAttributes:@{@"name":@"alliances"}];
   [alliances setRelationshipsWithAlliance:@"row"
                              Corporations:@"rowset"
                    CorporationsParameters:@{@"name":@"memberCorporations"}
                               Corporation:@"row"];
   //
   // Add the descriptors to our collection
   //
   
   [self.objectDescriptors addObjectsFromArray:@[alliances.objectDescriptor]];
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
      if (NSClassFromString(objectClass) == [EVEAlliances class])
      {
         NSMutableArray *allianceList = [NSMutableArray new];
         for (EVEAlliances *eveAlliances in builtObjects[objectClass])
         {
            [allianceList addObjectsFromArray:eveAlliances.alliances];
         }
         self.alliances = [allianceList copy];
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

@end
