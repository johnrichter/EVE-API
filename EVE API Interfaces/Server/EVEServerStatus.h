//
//  EVEServerStatus.h
//  EveAPI
//
//  Created by Johnathan Richter on 10/3/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EVEApiObject.h"
#import "EVEServerState.h"
#import "EVEPlayersOnline.h"

@interface EVEServerStatus : EVEApiObject

#pragma mark - XML Properties
@property BOOL isServerOnline;
@property (strong) NSNumber *playersOnline;

#pragma mark - Instance Properties

#pragma mark - Instance Methods

@end
