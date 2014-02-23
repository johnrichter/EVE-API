//
//  EVEAccountStatus.m
//  EveAPI
//
//  Created by Johnathan Richter on 10/3/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import "EVEAccountStatus.h"
#import "EVEAccountExpirationDate.h"
#import "EVEAccountCreationDate.h"
#import "EVEAccountLogonCount.h"
#import "EVEAccountTotalMinutesPlayed.h"

@implementation EVEAccountStatus

-(instancetype)initWithEveKeyId:(NSString *)keyId VCode:(NSString *)vCode
{
   self = [super init];
   if (self)
   {
      // Common API Properties
      self.commonName = @"Account Status";
      [self.url appendString:@"account/AccountStatus.xml.aspx"];
      [self.urlParameters addEntriesFromDictionary:@{@"keyID":keyId,
                                                     @"vCode":vCode}];
      self.cakAccessMask = @33554432;
      self.cacheStyle = kShortCache;
      
      // Built Object Properties
      self.paidUntil = [NSDate new];
      self.creationDate = [NSDate new];
      self.logonCount = [NSNumber new];
      self.minutesLoggedIn = [NSNumber new];
      
      // Instance Properties
      self.keyId = keyId;
      self.vCode = vCode;
   }
   
   return self;
}

/*
 * Subclass must call this parent class function
 */
-(void)configureObjectDescriptors
{
   [super configureObjectDescriptors];
   
   XKObjectDescriptor *paidUntil = [[EVEAccountExpirationDate new] objectDescriptor];
   [paidUntil setElementName:@"paidUntil"];
   
   XKObjectDescriptor *creationDate = [[EVEAccountCreationDate new] objectDescriptor];
   [creationDate setElementName:@"createDate"];
   
   XKObjectDescriptor *loginCount = [[EVEAccountLogonCount new] objectDescriptor];
   [loginCount setElementName:@"logonCount"];
   
   XKObjectDescriptor *minutesLoggedIn = [[EVEAccountTotalMinutesPlayed new] objectDescriptor];
   [minutesLoggedIn setElementName:@"logonMinutes"];
   
   //
   // Add the EVECharacter blueprint to our list
   //
   
   [self.objectDescriptors addObjectsFromArray:@[paidUntil, creationDate,
                                                 loginCount, minutesLoggedIn]];
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
      if (NSClassFromString(objectClass) == [EVEAccountExpirationDate class])
      {
         for (EVEAccountExpirationDate *expirationDate in builtObjects[objectClass])
         {
            self.paidUntil = [expirationDate date];;
         }
      }
      else if (NSClassFromString(objectClass) == [EVEAccountCreationDate class])
      {
         for (EVEAccountCreationDate *creationDate in builtObjects[objectClass])
         {
            self.creationDate = [creationDate date];
         }
      }
      else if (NSClassFromString(objectClass) == [EVEAccountLogonCount class])
      {
         for (EVEAccountLogonCount *logonCount in builtObjects[objectClass])
         {
            self.logonCount = [logonCount number];
         }
      }
      else if (NSClassFromString(objectClass) == [EVEAccountTotalMinutesPlayed class])
      {
         for (EVEAccountTotalMinutesPlayed *minutesPlayed in builtObjects[objectClass])
         {
            self.minutesLoggedIn = [minutesPlayed number];
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
                           @"Paid Until: %@\n"
                           @"Date Created: %@\n"
                           @"Total Logins: %@\n"
                           @"Total Minutes Logged In: %@\n",
                           self.commonName,
                           self.apiVersion,
                           self.url,
                           self.cakAccessMask,
                           self.lastQueried,
                           self.cachedUntil,
                           [EVEApiObject cacheStyleToString:self.cacheStyle],
                           self.apiError,
                           self.paidUntil,
                           self.creationDate,
                           self.logonCount,
                           self.minutesLoggedIn];
   
   return [NSString stringWithString:str];
}

@end
