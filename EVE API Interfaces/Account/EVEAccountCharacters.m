//
//  EVEAccountCharacters.m
//  EveAPI
//
//  Created by Johnathan Richter on 10/3/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import "EVEAccountCharacters.h"

@implementation EVEAccountCharacters

-(EVEAccountCharacters *)initWithEveKeyId:(NSString *)keyId VCode:(NSString *)vCode
{
   self = [super init];
   if (self)
   {
      // Common API Properties
      self.commonName = @"Characters";
      [self.url appendString:@"account/Characters.xml.aspx"];
      [self.uriParameters addEntriesFromDictionary:@{@"keyID":keyId,
                                                     @"vCode":vCode}];
      self.cakAccessMask = @0;
      self.cacheStyle = kShortCache;
      
      // Built Object Properties
      self.characters = [NSMutableArray new];
      
      // Instance Properties
      self.keyId = keyId;
      self.vCode = vCode;
      
      // Object Building Properties
      [self configureObjectBuilders];
   }
   
   return self;
}

-(void)configureObjectBuilders
{
   XKObjectDescriptor *character = [[EVECharacter new] objectDescriptor];
   [character setXmlKeypath:@"eveapi.result.rowset.row"];
   
   // Add the EVECharacter blueprint to our list
   [self.objectDescriptors addObject:character];
   
   // Configure our RequestOperation with URI and Arguements
   [self.requestOperation setADelegate:self];
   [self.requestOperation setUrl:self.uri
                  WithArguements:self.uriParameters
                      Blueprints:self.objectDescriptors];
}

#pragma mark - RequestOperationProtocolMethods
-(void)requestOperationSucceededWithObjects:(NSDictionary *)builtObjects
                                      Error:(NSError *)error
{
   // Call our base classes protocol function
   [super requestOperationSucceededWithObjects:objects];
   
   for (id object in objects)
   {
      if ([object class] == [EVECharacter class])
      {
         [self.characters addObject:object];
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
   NSMutableString *str = [NSMutableString stringWithFormat:
      @"%@ - Version %@\n\n"
      @"URI:\t\t\t\t\t\t%@\n"
      @"Legacy API Enabled:\t\t\t%s\n"
      @"Legacy API Restriction:\t\t%@\n"
      @"CAK Access Mask Required:\t%@\n"
      @"Date Last Queried:\t\t\t%@\n"
      @"Cached Until:\t\t\t\t%@\n"
      @"Cache Style:\t\t\t\t%@\n"
      @"API Error:\t\t\t\t\t%@\n\n",
      self.commonName,
      self.apiVersion,
      self.uri,
      self.isLegacyApiKeyEnabled ? "Yes":"No",
      [EVEApiObject legacyApiRestrictionToString:self.legacyApiRestriction],
      self.cakAccessMask,
      self.lastQueried,
      self.cachedUntil,
      [EVEApiObject cacheStyleToString:self.cacheStyle],
      self.apiError];
   
   for (id object in self.characters)
   {
      [str appendFormat:@"%@\n", object];
   }
   
   return str;
}

@end
