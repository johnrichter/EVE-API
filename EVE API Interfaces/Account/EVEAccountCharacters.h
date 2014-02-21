//
//  EVEAccountCharacters.h
//  EveAPI
//
//  Created by Johnathan Richter on 10/3/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EVEApiObject.h"
#import "EVECharacter.h"

@interface EVEAccountCharacters : EVEApiObject

#pragma mark - XML Properties

@property (strong) NSMutableArray *characters;

#pragma mark - Instance Properties
@property (strong) NSString *keyId;
@property (strong) NSString *vCode;

#pragma mark - Instance Methods
-(EVEAccountCharacters *)initWithEveKeyId:(NSString *)keyId VCode:(NSString *)vCode;
-(void)queryTheApi;

@end
