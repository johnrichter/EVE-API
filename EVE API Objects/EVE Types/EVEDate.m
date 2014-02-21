//
//  EVEDate.m
//  EveAPI
//
//  Created by Johnathan Richter on 10/4/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import "EVEDate.h"

@implementation EVEDate

#pragma mark - Instance Methods

-(EVEDate *)init
{
   self = [super init];
   if (self)
   {
      self.date = [[NSDate alloc] init];
   }
   
   return self;
}

-(void)configureObjectDescriptor
{
   [self.objectDescriptor setObjectClass:[self class]];
   [self.objectDescriptor setObjectValueProperty:@"date"];
}

-(NSString *)description
{
   return [NSString stringWithFormat:@"%@", self.date];
}

@end
