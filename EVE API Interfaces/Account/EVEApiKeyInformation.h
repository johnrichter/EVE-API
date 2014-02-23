//
//  EVEApiKeyInformation.h
//  EveAPI
//
//  Created by Johnathan Richter on 10/2/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EVEApiObject.h"

@interface EVEApiKeyInformation : EVEApiObject

#pragma mark - XML Properties
@property (strong) NSNumber *keyAccessMask;
@property (strong) NSDate *keyExpirationDate;
@property (strong) NSString *keyType;
@property (strong) NSArray *characters;

#pragma mark - Instance Properties
@property (strong) NSString *keyId;
@property (strong) NSString *vCode;

#pragma mark - Instance Methods
-(instancetype)initWithEveKeyId:(NSString *)keyId VCode:(NSString *)vCode;

@end
