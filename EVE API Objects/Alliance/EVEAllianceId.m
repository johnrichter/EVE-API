//
//  EVEAllianceId.m
//  EveAPI
//
//  Created by Johnathan Richter on 10/15/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import "EVEAllianceId.h"

@interface EVEAllianceId ()

@end

@implementation EVEAllianceId

#pragma mark - Instance Methods

-(instancetype)init
{
   self = [super init];
   if (self)
   {
      // Initialize XML Variables
      self.allianceId = @0;
   }
   
   return self;
}

-(void)configureObjectDescriptor
{
   [self.objectDescriptor setObjectClass:[self class]];
   [self.objectDescriptor setObjectValueProperty:@"allianceId"];
}

-(NSString *)description
{
   return [NSString stringWithFormat:@"%@", self.allianceId];
}

#pragma mark - Private Instance Methods

#pragma mark - KVC Attribute and To-One Compliance Methods

-(void)setNilValueForKey:(NSString *)key
{
   if([key isEqualToString:@"allianceId"])
   {
      self.allianceId = @0;
   }
}

@end
