//
//  EVESolarSystemFactionWarfareStatus.m
//  EveAPI
//
//  Created by Johnathan Richter on 11/17/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import "EVESolarSystemFactionWarfareStatus.h"

@interface EVESolarSystemFactionWarfareStatus ()

@end

@implementation EVESolarSystemFactionWarfareStatus

#pragma mark - Instance Methods

-(EVESolarSystemFactionWarfareStatus *)init
{
   self = [super init];
   if (self)
   {
      // Initialize XML Variables
      self.solarSystemName = @"";
      self.solarSystemId = @0;
      self.occupyingFactionId = @0;
      self.occupyingFactionName = @"";
      self.owningFactionId = @0;
      self.owningFactionName = @"";
      self.contested = NO;
   }
   
   return self;
}

-(void)configureObjectDescriptor
{
   [self.objectDescriptor setObjectClass:[self class]];
   [self.objectDescriptor setObjectAttributeProperties:
      @{@"solarSystemID":@"solarSystemId",
        @"solarSystemName":@"solarSystemName",
        @"occupyingFactionID":@"occupyingFactionId",
        @"occupyingFactionName":@"occupyingFactionName",
        @"owningFactionID":@"owningFactionId",
        @"owningFactionName":@"owningFactionName",
        @"contested":@"contested"}];
}

-(NSString *)description
{
   return [NSString stringWithFormat:@"Solar System { ID: %@, Name: %@ } | "
                                     @"Occupying Faction { ID: %@, Name: %@ } | "
                                     @"Owning Faction { ID: %@, Name: %@ } | "
                                     @"Contested: %s",
                                     self.solarSystemId, self.solarSystemName,
                                     self.occupyingFactionId, self.occupyingFactionName,
                                     self.owningFactionId, self.owningFactionName,
                                     self.contested ? "Yes":"No"];
}

#pragma mark - Private Instance Methods

#pragma mark - KVC Attribute and To-One Compliance Methods

-(void)setNilValueForKey:(NSString *)key
{
   if([key isEqualToString:@"solarSystemId"])
   {
      self.solarSystemId = @0;
   }
   else if([key isEqualToString:@"solarSystemName"])
   {
      self.solarSystemName = @"";
   }
   else if([key isEqualToString:@"occupyingFactionId"])
   {
      self.occupyingFactionId = @0;
   }
   else if([key isEqualToString:@"occupyingFactionName"])
   {
      self.occupyingFactionName = @"";
   }
   else if([key isEqualToString:@"owningFactionId"])
   {
      self.owningFactionId = @0;
   }
   else if([key isEqualToString:@"owningFactionName"])
   {
      self.owningFactionName = @"";
   }
   else if([key isEqualToString:@"contested"])
   {
      self.contested = NO;
   }
}

@end
