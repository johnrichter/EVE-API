//
//  EVEDate.h
//  EveAPI
//
//  Created by Johnathan Richter on 10/4/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EVEObject.h"

@interface EVEDate : EVEObject

#pragma mark - XML Properties

@property (strong) NSDate *date;

@end
