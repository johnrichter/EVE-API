//
//  EVETypeName.h
//  EveAPI
//
//  Created by Johnathan Richter on 10/3/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import "EVEApiObject.h"

@interface EVETypeName : EVEApiObject

#pragma mark - XML Properties
@property (strong) NSArray *types;

#pragma mark - Instance Properties
@property (strong) NSArray *ids;

#pragma mark - Instance Methods
-(instancetype)initWithIds:(NSArray *)ids;

@end
