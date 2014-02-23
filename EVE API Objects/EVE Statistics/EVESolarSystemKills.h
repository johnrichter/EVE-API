//
//  EVESolarSystemKills.h
//  EveAPI
//
//  Created by Johnathan Richter on 11/17/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import "EVEObject.h"

@interface EVESolarSystemKills : EVEObject

#pragma mark - XML Value

#pragma mark - XML Attributes
@property (strong) NSNumber *solarSystemId;
@property (strong) NSNumber *shipKills;
@property (strong) NSNumber *factionKills;
@property (strong) NSNumber *podKills;

#pragma mark - XML Relationships

#pragma mark - Instance Properties

#pragma mark - Instance Methods

@end
