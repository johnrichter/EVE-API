//
//  EVECorporations.h
//  EVEApi Beta
//
//  Created by Johnathan Richter on 2/22/14.
//  Copyright (c) 2014 D-Squared Productions. All rights reserved.
//

#import "EVEObject.h"

@interface EVECorporations : EVEObject

@property (strong) NSArray *corporations;

-(void)setRelationshipsWithCorporation:(NSString *)corporationElement;

@end
