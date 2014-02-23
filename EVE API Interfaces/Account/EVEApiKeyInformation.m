//
//  EVEApiKeyInformation.m
//  EveAPI
//
//  Created by Johnathan Richter on 10/2/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import "EVEApiKeyInformation.h"
#import "EVEApiKey.h"
#import "EVECharacter.h"

@implementation EVEApiKeyInformation

-(EVEApiKeyInformation *)initWithEveKeyId:(NSString *)keyId VCode:(NSString *)vCode
{
   self = [super init];
   if (self)
   {
      // Common API Properties
      self.commonName = @"API Key Information";
      [self.url appendString:@"account/APIKeyInfo.xml.aspx"];
      [self.urlParameters addEntriesFromDictionary:@{@"keyID":keyId,
                                                     @"vCode":vCode}];
      self.cacheStyle = kShortCache;
      
      // Built Object Properties
      self.keyAccessMask = @0;
      self.keyExpirationDate = [NSDate new];
      self.keyType = @"";
      self.characters = @[];
      
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
   
   XKObjectDescriptor *apiKey = [[EVEApiKey new] objectDescriptor];
   [apiKey setElementName:@"key"];
   
   XKObjectDescriptor *character = [[EVECharacter new] objectDescriptor];
   [character setElementName:@"row"];
    
   // Add the descriptors to our list
   [self.objectDescriptors addObjectsFromArray:@[apiKey, character]];
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
      if (NSClassFromString(objectClass) == [EVEApiKey class])
      {
         for (EVEApiKey *apiKey in builtObjects[objectClass])
         {
            self.keyAccessMask = apiKey.accessMask;
            self.keyExpirationDate = apiKey.expirationDate;
            self.keyType = apiKey.keyType;
         }
      }
      else if (NSClassFromString(objectClass) == [EVECharacter class])
      {
         NSMutableArray *characterArray = [NSMutableArray new];
         for (EVECharacter *character in builtObjects[objectClass])
         {
            [characterArray addObject:character];
         }
         self.characters = [NSArray arrayWithArray:characterArray];
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
      @"API Key Access Mask: %@\n"
      @"API Key Expiration Date: %@\n"
      @"API Key Type: %@\n\n",
      self.commonName,
      self.apiVersion,
      self.url,
      self.cakAccessMask,
      self.lastQueried,
      self.cachedUntil,
      [EVEApiObject cacheStyleToString:self.cacheStyle],
      self.apiError,
      self.keyAccessMask,
      self.keyExpirationDate,
      self.keyType];
   
   for (EVECharacter *character in self.characters)
   {
      [str appendFormat:@"%@\n", character];
   }
   
   return str;
}

@end
