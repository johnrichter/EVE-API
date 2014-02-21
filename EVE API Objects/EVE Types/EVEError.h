//
//  EVEError.h
//  EveAPI
//
//  Created by Johnathan Richter on 10/19/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import "EVEObject.h"

@interface EVEError : EVEObject

#pragma mark - XML Value
@property (strong) NSString *details;

#pragma mark - XML Attributes
@property (strong) NSNumber *code;

#pragma mark - XML Relationships

#pragma mark - Instance Properties

#pragma mark - Instance Methods

@end
