//
//  EVEConquerableStation.h
//  EveAPI
//
//  Created by Johnathan Richter on 11/30/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import "EVEObject.h"

@interface EVEConquerableStation : EVEObject

#pragma mark - XML Value

#pragma mark - XML Attributes
@property (strong) NSNumber *stationId;
@property (strong) NSString *stationName;
@property (strong) NSNumber *stationTypeId;
@property (strong) NSNumber *solarSystemId;
@property (strong) NSNumber *corporationId;
@property (strong) NSString *corporationName;

#pragma mark - XML Relationships

#pragma mark - Instance Properties

#pragma mark - Instance Methods

@end
