//
//  EVECorporation.m
//  EveAPI
//
//  Created by Johnathan Richter on 11/29/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import "EVECorporation.h"

@interface EVECorporation ()

@end

@implementation EVECorporation

#pragma mark - Instance Methods

-(EVECorporation *)init
{
   self = [super init];
   if (self)
   {
      // Initialize XML Variables
      self.corporationId = @0;
      self.allianceJoinDate = [NSDate new];
   }
   
   return self;
}

-(void)configureObjectDescriptor
{
   [self.objectDescriptor setObjectClass:[self class]];
   [self.objectDescriptor setObjectAttributeProperties:@{@"corporationID":@"corporationId",
                                                         @"startDate":@"allianceJoinDate"}];
}

-(NSString *)description
{
   return [NSString stringWithFormat:@"Corporation ID: %@ | Alliance Join Date: %@",
                                     self.corporationId, self.allianceJoinDate];
}

#pragma mark - Private Instance Methods

#pragma mark - KVC Attribute and To-One Compliance Methods

-(void)setNilValueForKey:(NSString *)key
{
   if([key isEqualToString:@"corporationId"])
   {
      self.corporationId = @0;
   }
   else if([key isEqualToString:@"allianceJoinDate"])
   {
      self.allianceJoinDate = [NSDate new];
   }
}

@end
