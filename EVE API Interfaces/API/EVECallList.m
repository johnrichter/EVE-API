//
//  EVECallList.m
//  EveAPI
//
//  Created by Johnathan Richter on 10/3/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import "EVECallList.h"
#import "EVECall.h"
#import "EVECalls.h"
#import "EVECallGroup.h"
#import "EVECallGroups.h"

@interface EVECallList ()

@end

@implementation EVECallList

#pragma mark - Instance Methods

-(instancetype)init
{
   self = [super init];
   if (self)
   {
      // Common API Properties
      self.commonName = @"Call List";
      [self.url appendString:@"api/calllist.xml.aspx"];
      
      self.cakAccessMask = @0;
      self.cacheStyle = kModifiedShortCache;
      
      // Built Object Properties
      self.calls = @[];
      self.callGroups = @[];
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
   
   EVECalls *calls = [EVECalls new];
   [calls.objectDescriptor setElementName:@"rowset"];
   [calls.objectDescriptor setElementAttributes:@{@"name":@"calls"}];
   [calls setRelationshipsWithCall:@"row"];
   
   EVECallGroups *callGroups = [EVECallGroups new];
   [callGroups.objectDescriptor setElementName:@"rowset"];
   [callGroups.objectDescriptor setElementAttributes:@{@"name":@"callGroups"}];
   [callGroups setRelationshipsWithCallGroup:@"row"];
   
   //
   // Add the descriptors to our collection
   //
   
   [self.objectDescriptors addObjectsFromArray:@[calls.objectDescriptor,
                                                 callGroups.objectDescriptor]];
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
      if (NSClassFromString(objectClass) == [EVECallGroups class])
      {
         NSMutableArray *groups = [NSMutableArray new];
         for (EVECallGroups *callGroups in builtObjects[objectClass])
         {
            [groups addObjectsFromArray:[callGroups callGroups]];
         }
         self.callGroups = [NSArray arrayWithArray:groups];
      }
      else if (NSClassFromString(objectClass) == [EVECalls class])
      {
         NSMutableArray *callList = [NSMutableArray new];
         for (EVECalls *calls in builtObjects[objectClass])
         {
            [callList addObjectsFromArray:[calls calls]];
         }
         self.calls = [NSArray arrayWithArray:callList];
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
   
   for (EVECallGroup *callGroup in self.callGroups)
   {
      [str appendFormat:@"%@\n", callGroup];
   }
   
   for (EVECall *call in self.calls)
   {
      [str appendFormat:@"%@\n", call];
   }
   
   return [NSString stringWithString:str];
}

@end
