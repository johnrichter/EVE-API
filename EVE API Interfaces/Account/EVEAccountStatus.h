//
//  EVEAccountStatus.h
//  EveAPI
//
//  Created by Johnathan Richter on 10/3/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EVEApiObject.h"
#import "EVEAccountExpirationDate.h"
#import "EVEAccountCreationDate.h"
#import "EVEAccountLogonCount.h"
#import "EVEAccountTotalMinutesPlayed.h"

@interface EVEAccountStatus : EVEApiObject

#pragma mark - XML Properties

// The date until which the account is currently subscribed
@property (strong) EVEAccountExpirationDate *paidUntil;

// The date the account was created
@property (strong) EVEDate *creationDate;

// The number of times you logged into CCP's services.
// # game logons + # forum logons + # EVEGate logons
@property (strong) EVEAccountLogonCount *logonCount;

// The amount of time you actually spent logged on in the game
@property (strong) EVEAccountTotalMinutesPlayed *minutesLoggedIn;

#pragma mark - Instance Properties
@property (strong) NSString *keyId;
@property (strong) NSString *vCode;

#pragma mark - Instance Methods
-(EVEAccountStatus *)initWithEveKeyId:(NSString *)keyId VCode:(NSString *)vCode;
-(void)queryTheApi;

#pragma mark - EVEApiProtool Methods
-(void)configureObjectBuilders;

#pragma mark - RequestOperationProtocolMethods
-(void)requestOperationSucceededWithObjects:(NSArray *)objects;
-(void)requestOperationFailedWithError:(NSError *)error;


@end
