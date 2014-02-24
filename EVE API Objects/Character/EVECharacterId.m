//
//  EVECharacterId.m
//  EveAPI
//
//  Created by Johnathan Richter on 10/15/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import "EVECharacterId.h"

@interface EVECharacterId ()

@end

@implementation EVECharacterId

#pragma mark - Instance Methods

-(instancetype)init
{
   self = [super init];
   if (self)
   {
      // Initialize XML Variables
      self.characterId = @0;
   }
   
   return self;
}

-(void)configureObjectDescriptor
{
   [self.objectDescriptor setObjectClass:[self class]];
   [self.objectDescriptor setObjectValueProperty:@"characterId"];
}

-(NSString *)description
{
   return [NSString stringWithFormat:@"%@", self.characterId];
}

#pragma mark - Private Instance Methods

#pragma mark - KVC Attribute and To-One Compliance Methods

-(void)setNilValueForKey:(NSString *)key
{
   if([key isEqualToString:@"characterId"])
   {
      self.characterId = @0;
   }
}

@end
