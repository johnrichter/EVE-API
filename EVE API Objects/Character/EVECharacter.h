//
//  EVECharacter.h
//  EveAPI
//
//  Created by Johnathan Richter on 9/21/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EVEObject.h"

@interface EVECharacter : EVEObject

@property (strong) NSNumber *characterId;
@property (strong) NSString *characterName;
@property (strong) NSNumber *corporationId;
@property (strong) NSString *corporationName;

@end
