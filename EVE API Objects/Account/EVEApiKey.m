//
//  EVEKey.m
//  EveAPI
//
//  Created by Johnathan Richter on 10/1/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import "EVEApiKey.h"
#import "EVECharacter.h"

@implementation EVEApiKey

-(instancetype)init;
{
   self = [super init];
   if (self)
   {
      self.accessMask = @0;
      self.keyType = @"";
      self.expirationDate = [NSDate new];
   }
   
   return self;
}

-(void)configureObjectDescriptor
{
   [self.objectDescriptor setObjectClass:[self class]];
   [self.objectDescriptor setObjectAttributeProperties:@{@"accessMask":@"accessMask",
                                                         @"type":@"keyType",
                                                         @"expires":@"expirationDate"}];
}

-(NSString *)description
{
   NSMutableString *output = [NSMutableString stringWithFormat:
                              @"Key Type:\t\t\t%@\n"
                              @"Access Mask:\t\t%@\n"
                              @"Expiration Date:\t%@\n\n",
                              self.keyType,
                              self.accessMask,
                              self.expirationDate];
   return output;
}

#pragma mark - KVC Attribute and To-One Compliance Methods

- (void)setNilValueForKey:(NSString *)key
{
   if([key isEqualToString:@"accessMask"])
   {
      self.accessMask = @0;
   }
   else if([key isEqualToString:@"expirationDate"])
   {
      self.expirationDate = [NSDate new];
   }
   else if([key isEqualToString:@"keyType"])
   {
      self.keyType = @"";
   }
}

#pragma mark - KVC Indexed To-Many Compliance Methods

/**
 * No indexed To-Many relationships in this object.
 */

#pragma mark - KVC Unordered To-Many Compliance Methods

/**
 * No ordered To-Many relationships in this object.
 */

@end
