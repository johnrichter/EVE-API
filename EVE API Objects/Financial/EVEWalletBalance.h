//
//  EVEWalletBalance.h
//  EveAPI
//
//  Created by Johnathan Richter on 10/13/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import "EVEObject.h"

@interface EVEWalletBalance : EVEObject

#pragma mark - XML Value

#pragma mark - XML Attributes
@property (strong) NSNumber *walletId;
@property (strong) NSNumber *walletKey;
@property (strong) NSNumber *walletBalance;

#pragma mark - XML Relationships

#pragma mark - Instance Properties

#pragma mark - Instance Methods

@end
