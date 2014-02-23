//
//  EVECall.h
//  EveAPI
//
//  Created by Johnathan Richter on 11/3/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import "EVEObject.h"

@interface EVECall : EVEObject

#pragma mark - XML Value

#pragma mark - XML Attributes
@property (strong) NSNumber *accessMask;
@property (strong) NSString *type;
@property (strong) NSString *name;
@property (strong) NSNumber *groupId;
@property (strong) NSString *callDescription;

#pragma mark - XML Relationships

#pragma mark - Instance Properties

#pragma mark - Instance Methods

@end
