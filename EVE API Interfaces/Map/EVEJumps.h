//
//  EVEJumps.h
//  EveAPI
//
//  Created by Johnathan Richter on 10/3/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import "EVEApiObject.h"
#import "EVEDate.h"

@interface EVEJumps : EVEApiObject

#pragma mark - XML Properties
@property (strong) NSArray *systemJumps;
@property (strong) NSDate *dataFromDate;

#pragma mark - Instance Properties

#pragma mark - Instance Methods

@end
