//
//  EVEAlliances.m
//  EVEApi Beta
//
//  Created by Johnathan Richter on 2/22/14.
//  Copyright (c) 2014 D-Squared Productions. All rights reserved.
//

#import "EVEAlliances.h"
#import "EVEAlliance.h"

@implementation EVEAlliances

-(instancetype)init
{
   self = [super init];
   if (self)
   {
      // Initialize XML Variables
      self.alliances = @[];
   }
   
   return self;
}

-(void)setRelationshipsWithAlliance:(NSString *)allianceElement
                       Corporations:(NSString *)corporationsElement
             CorporationsParameters:(NSDictionary *)corporationsAttributes
                        Corporation:(NSString *)corporationElement;
{
   EVEAlliance *alliance = [EVEAlliance new];
   [alliance.objectDescriptor setElementName:allianceElement];
   [alliance.objectDescriptor setRelationshipObjectProperty:@"alliances"];
   [alliance setRelationshipsWithCorporations:corporationsElement
                        CorporationParameters:corporationsAttributes
                                  Corporation:corporationElement];
   
   [self.objectDescriptor setObjectRelationships:@[alliance.objectDescriptor]];
}

-(void)configureObjectDescriptor
{
   [self.objectDescriptor setObjectClass:[self class]];
}

-(NSString *)description
{
   NSMutableString *str = [NSMutableString new];
   
   for (EVEAlliance *alliance in self.alliances)
   {
      [str appendFormat:@"%@\n", alliance];
   }
   
   return [NSString stringWithString:str];
}

#pragma mark - Private Instance Methods

#pragma mark - KVC Attribute and To-One Compliance Methods

-(void)setNilValueForKey:(NSString *)key
{
   if([key isEqualToString:@"alliances"])
   {
      self.alliances = @[];
   }
}


@end
