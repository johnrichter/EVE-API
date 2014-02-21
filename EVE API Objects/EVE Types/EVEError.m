//
//  EVEError.m
//  EveAPI
//
//  Created by Johnathan Richter on 10/19/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import "EVEError.h"

@interface EVEError ()

@end

@implementation EVEError

#pragma mark - Instance Methods

-(EVEError *)init
{
   self = [super init];
   if (self)
   {
      // Initialize XML Variables
      self.code = @0;
      self.details = @"";
   }
   
   return self;
}

-(void)configureObjectDescriptor
{
   [self.objectDescriptor setObjectClass:[self class]];
   [self.objectDescriptor setObjectValueProperty:@"details"];
   [self.objectDescriptor setObjectAttributeProperties:@{@"code":@"code"}];
}

-(NSString *)description
{
   return [NSString stringWithFormat:@"Code %@ | Details: %@",
                                     self.code, self.details];
}

#pragma mark - Private Instance Methods

#pragma mark - KVC Attribute and To-One Compliance Methods

-(void)setNilValueForKey:(NSString *)key
{
   if([key isEqualToString:@"code"])
   {
      self.code = @0;
   }
   else if([key isEqualToString:@"details"])
   {
      self.details = @"";
   }
}

@end
