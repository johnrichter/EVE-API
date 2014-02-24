//
//  EVEWalletBalance.m
//  EveAPI
//
//  Created by Johnathan Richter on 10/13/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import "EVEWalletBalance.h"

@interface EVEWalletBalance ()

@end

@implementation EVEWalletBalance

#pragma mark - Instance Methods

-(instancetype)init
{
   self = [super init];
   if (self)
   {
      // Initialize properties
      self.walletId = @0;
      self.walletKey = @0;
      self.walletBalance = @0;
   }
   
   return self;
}

-(void)configureObjectDescriptor
{
   [self.objectDescriptor setObjectClass:[self class]];
   [self.objectDescriptor setObjectValueProperty:@"walletBalance"];
   [self.objectDescriptor setObjectAttributeProperties:@{@"accountID":@"walletId",
                                                         @"accountKey":@"walletKey",
                                                         @"balance":@"walletBalance"}];
}

-(NSString *)description
{
   return [NSString stringWithFormat:@"Wallet Id: %@ | Key: %@ | Balance: %@",
                                     self.walletId,
                                     self.walletKey,
                                     self.walletBalance];
}

#pragma mark - KVC Attribute and To-One Compliance Methods

-(void)setNilValueForKey:(NSString *)key
{
   if([key isEqualToString:@"walletId"])
   {
      self.walletId = @0;
   }
   else if([key isEqualToString:@"walletKey"])
   {
      self.walletKey = @0;
   }
   else if([key isEqualToString:@"walletBalance"])
   {
      self.walletBalance = @0;
   }
}

#pragma mark - Private Instance Methods

@end
