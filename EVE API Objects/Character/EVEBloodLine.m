//
//  EVEBloodLine.m
//  EveAPI
//
//  Created by Johnathan Richter on 10/15/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import "EVEBloodLine.h"

@interface EVEBloodLine ()

@end

@implementation EVEBloodLine

#pragma mark - Instance Methods

-(instancetype)init
{
   self = [super init];
   if (self)
   {
      // Initialize Instance Variables
      self.bloodLine = @"";
   }
   
   return self;
}

-(void)configureObjectDescriptor
{
   [self.objectDescriptor setObjectClass:[self class]];
   [self.objectDescriptor setObjectValueProperty:@"bloodLine"];
}

-(NSString *)description
{
   return [NSString stringWithFormat:@"%@", self.bloodLine];
}

#pragma mark - Private Instance Methods

#pragma mark - KVC Attribute and To-One Compliance Methods

-(void)setNilValueForKey:(NSString *)key
{
   if([key isEqualToString:@"bloodLine"])
   {
      self.bloodLine = @"";
   }
}

@end
