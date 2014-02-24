//
//  EVEEmploymentHistory.h
//  EveAPI
//
//  Created by Johnathan Richter on 11/30/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import "EVEObject.h"
#import "EVEDate.h"

@interface EVEEmploymentHistoryRecord : EVEObject

#pragma mark - XML Value

#pragma mark - XML Attributes
@property (strong) NSNumber *recordId;
@property (strong) NSNumber *corporationId;
@property (strong) EVEDate *joinDate;

#pragma mark - XML Relationships

#pragma mark - Instance Properties

#pragma mark - Instance Methods

@end
