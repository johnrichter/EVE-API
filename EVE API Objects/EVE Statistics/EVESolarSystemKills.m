//
//  EVESolarSystemKills.m
//  EveAPI
//
//  Created by Johnathan Richter on 11/17/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import "EVESolarSystemKills.h"

@interface EVESolarSystemKills ()

@end

@implementation EVESolarSystemKills

#pragma mark - Instance Methods

-(EVESolarSystemKills *)init
{
   self = [super init];
   if (self)
   {
      // Initialize XML Variables
      self.solarSystemId = @0;
      self.shipKills = @0;
      self.factionKills = @0;
      self.podKills = @0;
   }
   
   return self;
}

-(void)configureObjectDescriptor
{
   [self.objectDescriptor setObjectClass:[self class]];
   [self.objectDescriptor setObjectAttributeProperties:@{@"solarSystemID":@"solarSystemId",
                                                         @"shipKills":@"shipKills",
                                                         @"factionKills":@"factionKills",
                                                         @"podKills":@"podKills"}];
}

-(NSString *)description
{
   return [NSString stringWithFormat:@"Solar System ID: %@ | Ship Kills: %@ | "
                                     @"Faction Kills %@ | Pod Kills: %@",
                                     self.solarSystemId, self.shipKills,
                                     self.factionKills, self.podKills];
}

#pragma mark - Private Instance Methods

#pragma mark - KVC Attribute and To-One Compliance Methods

-(void)setNilValueForKey:(NSString *)key
{
   if([key isEqualToString:@"solarSystemId"])
   {
      self.solarSystemId = @0;
   }
   else if([key isEqualToString:@"shipKills"])
   {
      self.shipKills = @0;
   }
   else if([key isEqualToString:@"factionKills"])
   {
      self.factionKills = @0;
   }
   else if([key isEqualToString:@"podKills"])
   {
      self.podKills = @0;
   }
}

@end
