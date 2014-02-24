//
//  EVECharacterInfo.h
//  EveAPI
//
//  Created by Johnathan Richter on 10/3/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import "EVEApiObject.h"
#import "EVEDate.h"

@interface EVECharacterInfo : EVEApiObject

#pragma mark - XML Properties
@property (strong) NSNumber *characterId;
@property (strong) NSString *characterName;
@property (strong) NSString *race;
@property (strong) NSString *bloodline;
@property (strong) NSNumber *walletBalance;
@property (strong) NSNumber *skillpoints;
@property (strong) NSDate *skillInTraningEndDate;
@property (strong) NSString *shipName;
@property (strong) NSNumber *shipTypeId;
@property (strong) NSString *shipTypeName;
@property (strong) NSNumber *corporationId;
@property (strong) NSString *corporationName;
@property (strong) NSDate *corporationJoinDate;
@property (strong) NSNumber *allianceId;
@property (strong) NSString *allianceName;
@property (strong) NSDate *allianceJoinDate;
@property (strong) NSString *lastKnownLocation;
@property (strong) NSNumber *securityStatus;
@property (strong) NSArray *employmentHistory;

#pragma mark - Instance Properties
@property (strong) NSString *keyId;
@property (strong) NSString *vCode;
@property (strong) NSNumber *charId;

#pragma mark - Instance Methods
-(instancetype)initWithCharacterId:(NSNumber *)characterId;
-(instancetype)initWithEveKeyId:(NSString *)keyId
                          VCode:(NSString *)vCode
                    CharacterId:(NSNumber *)characterId;

@end
