//
//  EVEBool.m
//  EveAPI
//
//  Created by Johnathan Richter on 11/10/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import "EVEBool.h"

@interface EVEBool ()

@end

@implementation EVEBool

#pragma mark - Instance Methods

-(EVEBool *)init
{
   self = [super init];
   if (self)
   {
      // Initialize Instance Variables
      self.boolValue = NO;
   }
   
   return self;
}

-(void)configureObjectDescriptor
{
   [self.objectDescriptor setObjectClass:[self class]];
   [self.objectDescriptor setObjectValueProperty:@"boolValue"];
}

-(NSString *)description
{
   return [NSString stringWithFormat:@"EVEBool: %s", self.boolValue ? "Yes":"No"];
}

#pragma mark - Private Instance Methods

#pragma mark - KVC Attribute and To-One Compliance Methods

-(void)setNilValueForKey:(NSString *)key
{
   if([key isEqualToString:@"boolValue"])
   {
      self.boolValue = NO;
   }
}

@end
