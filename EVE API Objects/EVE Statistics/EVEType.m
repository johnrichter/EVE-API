//
//  EVEType.m
//  EveAPI
//
//  Created by Johnathan Richter on 12/1/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import "EVEType.h"

@interface EVEType ()

@end

@implementation EVEType

#pragma mark - Instance Methods

-(instancetype)init
{
   self = [super init];
   if (self)
   {
      // Initialize XML Variables
      self.typeId = @0;
      self.typeName = @"";
   }
   
   return self;
}

-(void)configureObjectDescriptor
{
   [self.objectDescriptor setObjectClass:[self class]];
   [self.objectDescriptor setObjectAttributeProperties:@{@"typeID":@"typeId",
                                                         @"typeName":@"typeName"}];
}

-(NSString *)description
{
   return [NSString stringWithFormat:@"Type ID:%@, Name: %@", self.typeId, self.typeName];
}

#pragma mark - Private Instance Methods

#pragma mark - KVC Attribute and To-One Compliance Methods

-(void)setNilValueForKey:(NSString *)key
{
   if([key isEqualToString:@"typeId"])
   {
      self.typeId = @0;
   }
   else if([key isEqualToString:@"typeName"])
   {
      self.typeName = @"";
   }
}

@end
