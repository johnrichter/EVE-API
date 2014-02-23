//
//  EVECorporations.m
//  EVEApi Beta
//
//  Created by Johnathan Richter on 2/22/14.
//  Copyright (c) 2014 D-Squared Productions. All rights reserved.
//

#import "EVECorporations.h"
#import "EVECorporation.h"

@implementation EVECorporations

-(instancetype)init
{
   self = [super init];
   if (self)
   {
      // Initialize XML Variables
      self.corporations = @[];
   }
   
   return self;
}

-(void)setRelationshipsWithCorporation:(NSString *)corporationElement
{
   XKObjectDescriptor *corporation = [[EVECorporation new] objectDescriptor];
   [corporation setElementName:corporationElement];
   [corporation setRelationshipObjectProperty:@"corporations"];
   
   [self.objectDescriptor setObjectRelationships:@[corporation]];
}

-(void)configureObjectDescriptor
{
   [self.objectDescriptor setObjectClass:[self class]];
}

-(NSString *)description
{
   NSMutableString *str = [NSMutableString new];
   
   for (EVECorporation *corporation in self.corporations)
   {
      [str appendFormat:@"%@\n", corporation];
   }
   
   return [NSString stringWithString:str];
}

#pragma mark - Private Instance Methods

#pragma mark - KVC Attribute and To-One Compliance Methods

-(void)setNilValueForKey:(NSString *)key
{
   if([key isEqualToString:@"corporations"])
   {
      self.corporations = @[];
   }
}

@end
