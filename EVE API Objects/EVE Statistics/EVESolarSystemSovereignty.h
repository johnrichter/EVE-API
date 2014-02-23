//
//  EVESolarSystemSovereignty.h
//  EveAPI
//
//  Created by Johnathan Richter on 11/17/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import "EVEObject.h"

@interface EVESolarSystemSovereignty : EVEObject

#pragma mark - XML Value

#pragma mark - XML Attributes
@property (strong) NSString *solarSystemName;
@property (strong) NSNumber *solarSystemId;
@property (strong) NSNumber *corporationId;
@property (strong) NSNumber *allianceId;
@property (strong) NSNumber *factionId;

#pragma mark - XML Relationships

#pragma mark - Instance Properties

#pragma mark - Instance Methods

@end
