//
//  EVECalls.h
//  EVEApi Beta
//
//  Created by Johnathan Richter on 2/22/14.
//  Copyright (c) 2014 D-Squared Productions. All rights reserved.
//

#import "EVEObject.h"

@interface EVECalls : EVEObject

@property (strong) NSArray *calls;

-(void)setRelationshipsWithCall:(NSString *)callElement;

@end
