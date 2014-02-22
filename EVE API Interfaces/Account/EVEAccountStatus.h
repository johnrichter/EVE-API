//
//  EVEAccountStatus.h
//  EveAPI
//
//  Created by Johnathan Richter on 10/3/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EVEApiObject.h"

@interface EVEAccountStatus : EVEApiObject

#pragma mark - XML Properties

// The date until which the account is currently subscribed
@property (strong) NSDate *paidUntil;

// The date the account was created
@property (strong) NSDate *creationDate;

// The number of times you logged into CCP's services.
// # game logons + # forum logons + # EVEGate logons
@property (strong) NSNumber *logonCount;

// The amount of time you actually spent logged on in the game
@property (strong) NSNumber *minutesLoggedIn;

#pragma mark - Instance Properties
@property (strong) NSString *keyId;
@property (strong) NSString *vCode;

#pragma mark - Instance Methods
-(instancetype)initWithEveKeyId:(NSString *)keyId VCode:(NSString *)vCode;

@end
