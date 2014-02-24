//
//  EVECharacter.m
//  EveAPI
//
//  Created by Johnathan Richter on 9/21/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import "EVECharacter.h"

@implementation EVECharacter

-(instancetype)init;
{
   self = [super init];
   if (self)
   {
      self.characterId = @0;
      self.characterName = @"";
      self.corporationId = @0;
      self.corporationName = @"";
   }

   return self;
}

-(void)configureObjectDescriptor
{
   [self.objectDescriptor setObjectClass:[self class]];
   [self.objectDescriptor setObjectAttributeProperties:@{@"characterID":@"characterId",
                                                         @"characterName":@"characterName",
                                                         @"corporationID":@"corporationId",
                                                         @"corporationName":@"corporationName",
                                                         // Certain API's use this element name
                                                         @"name":@"characterName"}];
}

-(NSString *)description
{
   return [NSString stringWithFormat:@"Character ID: %@ | Name: %@ | "
                                     @"Corporation { ID: %@, Name: %@ }",
                                     self.characterId, self.characterName,
                                     self.corporationId, self.corporationName];
}

#pragma mark - KVC Attribute and To-One Compliance Methods

- (void) setNilValueForKey:(NSString *)key
{
   if([key isEqualToString:@"characterId"])
   {
      self.characterId = @0;
   }
   else if([key isEqualToString:@"characterName"])
   {
      self.characterName = @"";
   }
   else if([key isEqualToString:@"corporationId"])
   {
      self.corporationId = @0;
   }
   else if([key isEqualToString:@"corporationName"])
   {
      self.corporationName = @"";
   }
}

#pragma mark - KVC Indexed To-Many Compliance Methods

/**
 * No indexed To-Many relationships in this object.
 */

#pragma mark - KVC Unordered To-Many Compliance Methods

/**
 * No ordered To-Many relationships in this object.
 */

@end
