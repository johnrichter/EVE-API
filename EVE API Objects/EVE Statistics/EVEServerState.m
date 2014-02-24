//
//  EVEServerState.m
//  EveAPI
//
//  Created by Johnathan Richter on 11/3/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import "EVEServerState.h"

@interface EVEServerState ()

@end

@implementation EVEServerState

#pragma mark - Instance Methods

-(instancetype)init
{
   self = [super init];
   if (self)
   {
      // Initialize XML Variables
      self.isOnline = NO;
   }
   
   return self;
}

-(void)configureObjectDescriptor
{
   [self.objectDescriptor setObjectClass:[self class]];
   [self.objectDescriptor setObjectValueProperty:@"isOnline"];
}

-(NSString *)description
{
   return [NSString stringWithFormat:@"Server Is Online: %s", self.isOnline ? "Yes":"No"];
}

#pragma mark - Private Instance Methods

#pragma mark - KVC Attribute and To-One Compliance Methods

-(void)setNilValueForKey:(NSString *)key
{
   if([key isEqualToString:@"isOnline"])
   {
      self.isOnline = NO;
   }
}

@end
