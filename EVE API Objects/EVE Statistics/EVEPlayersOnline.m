//
//  EVEPlayersOnline.m
//  EveAPI
//
//  Created by Johnathan Richter on 11/3/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import "EVEPlayersOnline.h"

@interface EVEPlayersOnline ()

@end

@implementation EVEPlayersOnline

#pragma mark - Instance Methods

-(instancetype)init
{
   self = [super init];
   if (self)
   {
      // Initialize XML Variables
      self.playerCount = @0;
   }
   
   return self;
}

-(void)configureObjectDescriptor
{
   [self.objectDescriptor setObjectClass:[self class]];
   [self.objectDescriptor setObjectValueProperty:@"playerCount"];
}

-(NSString *)description
{
   return [NSString stringWithFormat:@"Number of players online: %@", self.playerCount];
}

#pragma mark - Private Instance Methods

#pragma mark - KVC Attribute and To-One Compliance Methods

-(void)setNilValueForKey:(NSString *)key
{
   if([key isEqualToString:@"playerCount"])
   {
      self.playerCount = @0;
   }
}

@end
