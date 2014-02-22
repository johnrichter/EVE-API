//
//  EVEAccountStatus.m
//  EveAPI
//
//  Created by Johnathan Richter on 10/3/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import "EVEAccountStatus.h"

@implementation EVEAccountStatus

-(EVEAccountStatus *)initWithEveKeyId:(NSString *)keyId VCode:(NSString *)vCode
{
   self = [super init];
   if (self)
   {
      // Common API Properties
      self.commonName = @"Account Status";
      [self.uri appendString:@"account/AccountStatus.xml.aspx"];
      [self.uriArguments addEntriesFromDictionary:@{@"keyID":keyId,
                                                    @"vCode":vCode}];
      self.cakAccessMask = @33554432;
      self.cacheStyle = kShortCache;
      self.legacyApiRestriction = kFullAccess;
      self.isLegacyApiKeyEnabled = YES;
      
      // Built Object Properties
      self.paidUntil = [EVEAccountExpirationDate new];
      self.creationDate = [EVEAccountCreationDate new];
      self.logonCount = [EVEAccountLogonCount new];
      self.minutesLoggedIn = [EVEAccountTotalMinutesPlayed new];
      
      // Instance Properties
      self.keyId = keyId;
      self.vCode = vCode;
      
      // Object Building Properties
      [self configureObjectBuilders];
   }
   
   return self;
}

#pragma mark - EVEApiProtool Methods
-(void)configureObjectBuilders
{
   // Create the xml property blueprints
   XKObjectDescriptor *paidUntil = [[[EVEAccountExpirationDate alloc] init] objectDescriptor];
   [paidUntil setXmlKeypath:@"eveapi.result.paidUntil"];
   
   XKObjectDescriptor *creationDate = [[[EVEAccountCreationDate alloc] init] objectDescriptor];
   [creationDate setXmlKeypath:@"eveapi.result.createDate"];
   
   XKObjectDescriptor *loginCount = [[[EVEAccountLogonCount alloc] init] objectDescriptor];
   [loginCount setXmlKeypath:@"eveapi.result.logonCount"];
   
   XKObjectDescriptor *minutesLoggedIn = [[[EVEAccountTotalMinutesPlayed alloc] init] objectDescriptor];
   [minutesLoggedIn setXmlKeypath:@"eveapi.result.logonMinutes"];
   
   // Add the apiKey blueprint to our list
   [self.objectDescriptors addObjectsFromArray:@[paidUntil,  creationDate,
                                                loginCount, minutesLoggedIn]];
   
   // Configure our RequestOperation with URI and Arguements
   [self.requestOperation setUrl:self.uri
                  WithArguements:self.uriArguments
                      Blueprints:self.objectDescriptors];
}

#pragma mark - RequestOperationProtocolMethods
-(void)requestOperationSucceededWithObjects:(NSArray *)objects
{
   // Call our base classes protocol function
   [super requestOperationSucceededWithObjects:objects];
   
   for (id object in objects)
   {
      if ([object class] == [EVEAccountExpirationDate class])
      {
         self.paidUntil = object;
      }
      else if ([object class] == [EVEAccountCreationDate class])
      {
         self.creationDate= object;
      }
      else if ([object class] == [EVEAccountLogonCount class])
      {
         self.logonCount = object;
      }
      else if ([object class] == [EVEAccountTotalMinutesPlayed class])
      {
         self.minutesLoggedIn = object;
      }
   }
   
   [[NSNotificationCenter defaultCenter] postNotificationName:NSStringFromClass([self class])
                                                       object:nil
                                                     userInfo:nil];
}

-(void)requestOperationFailedWithError:(NSError *)error;
{
   [[NSNotificationCenter defaultCenter] postNotificationName:NSStringFromClass([self class])
                                                       object:nil
                                                     userInfo:@{@"error":error}];
}

-(void)queryTheApi
{
   [self.requestOperation start];
}

-(NSString *)description
{
   return [NSString stringWithFormat:
           @"%@ - Version %@\n\n"
           @"URI:\t\t\t\t\t\t%@\n"
           @"Legacy API Enabled:\t\t\t%s\n"
           @"Legacy API Restriction:\t\t%@\n"
           @"CAK Access Mask Required:\t%@\n"
           @"Date Last Queried:\t\t\t%@\n"
           @"Cached Until:\t\t\t\t%@\n"
           @"Cache Style:\t\t\t\t%@\n"
           @"API Error:\t\t\t\t\t%@\n\n"
           @"Paid Until: %@\n"
           @"Date Created: %@\n"
           @"Total Logins: %@\n"
           @"Total Minutes Logged In: %@\n",
           self.commonName,
           self.apiVersion,
           self.uri,
           self.isLegacyApiKeyEnabled ? "Yes":"No",
           [EVEApiObject legacyApiRestrictionToString:self.legacyApiRestriction],
           self.cakAccessMask,
           self.lastQueried,
           self.cachedUntil,
           [EVEApiObject cacheStyleToString:self.cacheStyle],
           self.apiError,
           self.paidUntil,
           self.creationDate,
           self.logonCount,
           self.minutesLoggedIn];
}

@end
