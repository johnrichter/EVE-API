//
//  EVEAccountCharacters.m
//  EveAPI
//
//  Created by Johnathan Richter on 10/3/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import "EVEAccountCharacters.h"

@implementation EVEAccountCharacters

-(instancetype)initWithEveKeyId:(NSString *)keyId VCode:(NSString *)vCode
{
   self = [super init];
   if (self)
   {
      // Common API Properties
      self.commonName = @"Characters";
      [self.url appendString:@"account/Characters.xml.aspx"];
      [self.urlParameters addEntriesFromDictionary:@{@"keyID":keyId,
                                                     @"vCode":vCode}];
      self.cakAccessMask = @0;
      self.cacheStyle = kShortCache;
      
      // Built Object Properties
      self.characters = [NSMutableArray new];
      
      // Instance Properties
      self.keyId = keyId;
      self.vCode = vCode;
   }
   
   return self;
}

-(void)configureObjectDescriptors
{
   [super configureObjectDescriptors];
   
   XKObjectDescriptor *character = [[EVECharacter new] objectDescriptor];
   [character setElementName:@"row"];
   
   //
   // Add the EVECharacter blueprint to our list
   //
   
   [self.objectDescriptors addObject:character];
}

-(void)requestOperationSucceededWithObjects:(NSDictionary *)builtObjects
                                      Error:(NSError *)error
{
   // Call our base class function to handle any inherited built objects
   [super requestOperationSucceededWithObjects:builtObjects Error:error];
   
   for (NSString *objectClass in builtObjects)
   {
      if (NSClassFromString(objectClass) == [EVECharacter class])
      {
         for (EVECharacter *character in builtObjects[objectClass])
         {
            [self.characters addObject:character];
         }
         
         // Break out of the loop since we only are looking for one type of object
         break;
      }
   }
   
   [[NSNotificationCenter defaultCenter] postNotificationName:NSStringFromClass([self class])
                                                       object:nil
                                                     userInfo:nil];
}

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
   
   for (id object in self.characters)
   {
      [str appendFormat:@"%@\n", object];
   }
   
   return str;
}

@end
