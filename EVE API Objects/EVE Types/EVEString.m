//
//  EVEString.m
//  EveAPI
//
//  Created by Johnathan Richter on 10/15/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import "EVEString.h"

@interface EVEString ()

@end

@implementation EVEString

#pragma mark - Instance Methods

-(EVEString *)init
{
   self = [super init];
   if (self)
   {
      // Initialize Instance Variables
      self.string = @"";
   }
   
   return self;
}

-(void)configureObjectDescriptor
{
   [self.objectDescriptor setObjectClass:[self class]];
   [self.objectDescriptor setObjectValueProperty:@"string"];
}

-(NSString *)description
{
   return [NSString stringWithFormat:@"%@", self.string];
}

#pragma mark - Private Instance Methods

#pragma mark - KVC Attribute and To-One Compliance Methods

-(void)setNilValueForKey:(NSString *)key
{
   if([key isEqualToString:@"string"])
   {
      self.string = @"";
   }
}

@end
