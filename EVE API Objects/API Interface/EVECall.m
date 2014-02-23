//
//  EVECall.m
//  EveAPI
//
//  Created by Johnathan Richter on 11/3/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import "EVECall.h"

@interface EVECall ()

@end

@implementation EVECall

#pragma mark - Instance Methods

-(instancetype)init
{
   self = [super init];
   if (self)
   {
      // Initialize XML Variables
      self.accessMask = @0;
      self.type = @"";
      self.name = @"";
      self.groupId = @0;
      self.callDescription = @"";
   }
   
   return self;
}

-(void)configureObjectDescriptor
{
   [self.objectDescriptor setObjectClass:[self class]];
   [self.objectDescriptor setObjectAttributeProperties:@{@"accessMask":@"accessMask",
                                                         @"type":@"type",
                                                         @"name":@"name",
                                                         @"groupID":@"groupId",
                                                         @"description":@"callDescription"}];
}

-(NSString *)description
{
   return [NSString stringWithFormat:@"Call Type: %@ | Name: %@ | Group ID: %@ | "
                                     @"Access Mask: %@ | Description: %@",
                                     self.type, self.name, self.groupId, self.accessMask,
                                     self.callDescription];
}

#pragma mark - Private Instance Methods

#pragma mark - KVC Attribute and To-One Compliance Methods

-(void)setNilValueForKey:(NSString *)key
{
   if([key isEqualToString:@"accessMask"])
   {
      self.accessMask = @0;
   }
   else if([key isEqualToString:@"type"])
   {
      self.type = @"";
   }
   else if([key isEqualToString:@"name"])
   {
      self.name = @"";
   }
   else  if([key isEqualToString:@"groupId"])
   {
      self.groupId = @0;
   }
   else if([key isEqualToString:@"callDescription"])
   {
      self.callDescription = @"";
   }
}

@end
