//
//  EVEAlliance.m
//  EveAPI
//
//  Created by Johnathan Richter on 11/29/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import "EVEAlliance.h"
#import "EVECorporations.h"

@interface EVEAlliance ()

@end

@implementation EVEAlliance;

#pragma mark - Instance Methods

-(EVEAlliance *)init
{
   self = [super init];
   if (self)
   {
      // Initialize XML Variables
      self.name = @"";
      self.shortName = @"";
      self.allianceId = @0;
      self.executorCorpId = @0;
      self.memberCount = @0;
      self.creationDate = [NSDate new];
      self.memberCorporations = @[];
   }
   
   return self;
}

-(void)configureObjectDescriptor
{
   [self.objectDescriptor setObjectClass:[self class]];
   [self.objectDescriptor setObjectAttributeProperties:@{@"name":@"name",
                                                         @"shortName":@"shortName",
                                                         @"allianceID":@"allianceId",
                                                         @"executorCorpID":@"executorCorpId",
                                                         @"memberCount":@"memberCount",
                                                         @"startDate":@"creationDate"}];
}

-(void)setRelationshipsWithCorporations:(NSString *)corporationsElement
                  CorporationParameters:(NSDictionary *)corporationsAttributes
                            Corporation:(NSString *)corporationElement
{
   EVECorporations *corporations = [EVECorporations new];
   [corporations.objectDescriptor setElementName:corporationsElement];
   [corporations.objectDescriptor setElementAttributes:corporationsAttributes];
   [corporations.objectDescriptor setRelationshipObjectProperty:@"memberCorporations"];
   [corporations setRelationshipsWithCorporation:corporationElement];
   
   [self.objectDescriptor setObjectRelationships:@[corporations.objectDescriptor]];
}

-(NSString *)description
{
   NSMutableString *alliance = [NSMutableString stringWithFormat:
                                @"Alliance: %@ [%@] | ID: %@ | Executor ID: %@ | "
                                @"Member Count: %@ | Creation Date: %@\n",
                                self.name, self.shortName, self.allianceId,
                                self.executorCorpId, self.memberCount,
                                self.creationDate];
   
   for (EVECorporations *corporations in self.memberCorporations)
   {
      [alliance appendFormat:@"%@\n", corporations];
   }
   
   return alliance;
}

#pragma mark - Private Instance Methods

#pragma mark - KVC Attribute and To-One Compliance Methods

-(void)setNilValueForKey:(NSString *)key
{
   if([key isEqualToString:@"name"])
   {
      self.name = @"";
   }
   else if([key isEqualToString:@"shortName"])
   {
      self.shortName = @"";
   }
   else if([key isEqualToString:@"allianceId"])
   {
      self.allianceId = @0;
   }
   else if([key isEqualToString:@"executorCorpId"])
   {
      self.executorCorpId = @0;
   }
   else if([key isEqualToString:@"memberCount"])
   {
      self.memberCount = @0;
   }
   else if([key isEqualToString:@"creationDate"])
   {
      self.creationDate = [NSDate new];
   }
   else if([key isEqualToString:@"memberCorporations"])
   {
      self.memberCorporations = @[];
   }
}

@end
