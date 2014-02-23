//
//  EVECallGroup.h
//  EveAPI
//
//  Created by Johnathan Richter on 11/3/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import "EVEObject.h"

@interface EVECallGroup : EVEObject

#pragma mark - XML Value

#pragma mark - XML Attributes
@property (strong) NSNumber *groupId;
@property (strong) NSString *name;
@property (strong) NSString *groupDescription;

#pragma mark - XML Relationships

#pragma mark - Instance Properties

#pragma mark - Instance Methods

@end
