//
//  EVECharacterNameToId.h
//  EveAPI
//
//  Created by Johnathan Richter on 10/15/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import "EVEApiObject.h"

@interface EVECharacterNameToId : EVEApiObject

#pragma mark - XML Properties
@property (strong) NSArray *characters;

#pragma mark - Instance Properties
@property (strong) NSArray *names;

#pragma mark - Instance Methods
-(instancetype)initWithNames:(NSArray *)names;

@end