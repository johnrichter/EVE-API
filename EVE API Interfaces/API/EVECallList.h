//
//  EVECallList.h
//  EveAPI
//
//  Created by Johnathan Richter on 10/3/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EVEApiObject.h"

@interface EVECallList : EVEApiObject

#pragma mark - XML Properties
@property (strong) NSArray *callGroups;
@property (strong) NSArray *calls;

#pragma mark - Instance Properties

#pragma mark - Instance Methods

@end
