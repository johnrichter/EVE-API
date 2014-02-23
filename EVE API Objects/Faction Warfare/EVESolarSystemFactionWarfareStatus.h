//
//  EVESolarSystemFactionWarfareStatus.h
//  EveAPI
//
//  Created by Johnathan Richter on 11/17/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import "EVEObject.h"

@interface EVESolarSystemFactionWarfareStatus : EVEObject

#pragma mark - XML Value

#pragma mark - XML Attributes
@property (strong) NSNumber *solarSystemId;
@property (strong) NSString *solarSystemName;
@property (strong) NSNumber *occupyingFactionId;
@property (strong) NSString *occupyingFactionName;
@property (strong) NSNumber *owningFactionId;
@property (strong) NSString *owningFactionName;
@property BOOL contested;

#pragma mark - XML Relationships

#pragma mark - Instance Properties

#pragma mark - Instance Methods

@end
