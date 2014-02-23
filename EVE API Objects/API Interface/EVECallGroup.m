//
//  EVECallGroup.m
//  EveAPI
//
//  Created by Johnathan Richter on 11/3/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import "EVECallGroup.h"

@interface EVECallGroup ()

@end

@implementation EVECallGroup

#pragma mark - Instance Methods

-(instancetype)init
{
   self = [super init];
   if (self)
   {
      // Initialize XML Variables
      self.groupId = @0;
      self.name = @"";
      self.groupDescription = @"";
   }
   
   return self;
}

-(void)configureObjectDescriptor
{
   [self.objectDescriptor setObjectClass:[self class]];
   [self.objectDescriptor setObjectAttributeProperties:@{@"groupID":@"groupId",
                                                         @"name":@"name",
                                                         @"description":@"groupDescription"}];
}

-(NSString *)description
{
   return [NSString stringWithFormat:@"Call Group %@ | Name: %@ | Description: %@",
                                       self.groupId, self.name, self.groupDescription];
}

#pragma mark - Private Instance Methods

#pragma mark - KVC Attribute and To-One Compliance Methods

-(void)setNilValueForKey:(NSString *)key
{
   if([key isEqualToString:@"groupId"])
   {
      self.groupId = @0;
   }
   else if([key isEqualToString:@"name"])
   {
      self.name = @"";
   }
   else if([key isEqualToString:@"groupDescription"])
   {
      self.groupDescription = @"";
   }
}

@end
