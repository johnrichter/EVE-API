//
//  EVECallGroups.m
//  EVEApi Beta
//
//  Created by Johnathan Richter on 2/22/14.
//  Copyright (c) 2014 D-Squared Productions. All rights reserved.
//

#import "EVECallGroups.h"
#import "EVECallGroup.h"

@implementation EVECallGroups

-(instancetype)init
{
   self = [super init];
   if (self)
   {
      // Initialize XML Variables
      self.callGroups = @[];
   }
   
   return self;
}

-(void)setRelationshipsWithCallGroup:(NSString *)callGroupElement
{
   XKObjectDescriptor *callGroup = [[EVECallGroup new] objectDescriptor];
   [callGroup setElementName:callGroupElement];
   [callGroup setRelationshipObjectProperty:@"callGroups"];
   
   [self.objectDescriptor setObjectRelationships:@[callGroup]];
}

-(void)configureObjectDescriptor
{
   [self.objectDescriptor setObjectClass:[self class]];
}

-(NSString *)description
{
   NSMutableString *str = [NSMutableString new];
   
   for (EVECallGroup *callGroup in self.callGroups)
   {
      [str appendFormat:@"%@\n", callGroup];
   }
   
   return [NSString stringWithString:str];
}

#pragma mark - Private Instance Methods

#pragma mark - KVC Attribute and To-One Compliance Methods

-(void)setNilValueForKey:(NSString *)key
{
   if([key isEqualToString:@"callGroups"])
   {
      self.callGroups = @[];
   }
}


@end
