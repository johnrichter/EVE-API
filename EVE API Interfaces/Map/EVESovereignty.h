//
//  EVESovereignty.h
//  EveAPI
//
//  Created by Johnathan Richter on 10/3/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import "EVEApiObject.h"
#import "EVEDate.h"

@interface EVESovereignty : EVEApiObject

#pragma mark - XML Properties
@property (strong) NSArray *systemSovereignties;
@property (strong) NSDate *dataFromDate;

#pragma mark - Instance Properties

#pragma mark - Instance Methods

@end
