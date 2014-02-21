//
//  EVENumber.m
//  EveAPI
//
//  Created by Johnathan Richter on 10/15/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import "EVENumber.h"

@interface EVENumber ()

@end

@implementation EVENumber

#pragma mark - Instance Methods

-(EVENumber *)init
{
   self = [super init];
   if (self)
   {
      // Initialize Instance Variables
      self.number = @0;
   }
   
   return self;
}

-(void)configureObjectDescriptor
{
   [self.objectDescriptor setObjectClass:[self class]];
   [self.objectDescriptor setObjectValueProperty:@"number"];
}

-(NSString *)description
{
   return [NSString stringWithFormat:@"%@", self.number];
}

#pragma mark - Private Instance Methods

#pragma mark - KVC Attribute and To-One Compliance Methods

-(void)setNilValueForKey:(NSString *)key
{
   if([key isEqualToString:@"number"])
   {
      self.number = @0;
   }
}

@end
