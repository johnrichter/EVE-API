//
//  EVECallGroups.h
//  EVEApi Beta
//
//  Created by Johnathan Richter on 2/22/14.
//  Copyright (c) 2014 D-Squared Productions. All rights reserved.
//

#import "EVEObject.h"

@interface EVECallGroups : EVEObject

@property (strong) NSArray *callGroups;

-(void)setRelationshipsWithCallGroup:(NSString *)callGroupElement;

@end
