//
//  EVEAllianceName.m
//  EveAPI
//
//  Created by Johnathan Richter on 10/15/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import "EVEAllianceName.h"

@interface EVEAllianceName ()

@end

@implementation EVEAllianceName

#pragma mark - Instance Methods

-(instancetype)init
{
   self = [super init];
   if (self)
   {
      // Initialize Instance Variables
      self.name = @"";
   }
   
   return self;
}

-(void)configureObjectDescriptor
{
   [self.objectDescriptor setObjectClass:[self class]];
   [self.objectDescriptor setObjectValueProperty:@"name"];
}

-(NSString *)description
{
   return [NSString stringWithFormat:@"%@", self.name];
}

#pragma mark - Private Instance Methods

#pragma mark - KVC Attribute and To-One Compliance Methods

-(void)setNilValueForKey:(NSString *)key
{
   if([key isEqualToString:@"name"])
   {
      self.name = @"";
   }
}

@end
