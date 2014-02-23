//
//  EVECorporation.h
//  EveAPI
//
//  Created by Johnathan Richter on 11/29/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import "EVEObject.h"
#import "EVEDate.h"

@interface EVECorporation : EVEObject

#pragma mark - XML Value

#pragma mark - XML Attributes
@property (strong) NSNumber *corporationId;
@property (strong) NSDate *allianceJoinDate;

#pragma mark - XML Relationships

#pragma mark - Instance Properties

#pragma mark - Instance Methods

@end
