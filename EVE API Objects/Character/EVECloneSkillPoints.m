//
//  EVECloneSkillPoints.m
//  EveAPI
//
//  Created by Johnathan Richter on 10/15/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import "EVECloneSkillPoints.h"

@interface EVECloneSkillPoints ()

@end

@implementation EVECloneSkillPoints

#pragma mark - Instance Methods

-(instancetype)init
{
   self = [super init];
   if (self)
   {
      // Initialize XML Variables
      self.skillPoints = @0;
   }
   
   return self;
}

-(void)configureObjectDescriptor
{
   [self.objectDescriptor setObjectClass:[self class]];
   [self.objectDescriptor setObjectValueProperty:@"skillPoints"];
}

-(NSString *)description
{
   return [NSString stringWithFormat:@"%@", self.skillPoints];
}

#pragma mark - Private Instance Methods

#pragma mark - KVC Attribute and To-One Compliance Methods

-(void)setNilValueForKey:(NSString *)key
{
   if([key isEqualToString:@"skillPoints"])
   {
      self.skillPoints = @0;
   }
}

@end
