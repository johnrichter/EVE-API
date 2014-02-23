//
//  EVEAlliances.h
//  EVEApi Beta
//
//  Created by Johnathan Richter on 2/22/14.
//  Copyright (c) 2014 D-Squared Productions. All rights reserved.
//

#import "EVEObject.h"

@interface EVEAlliances : EVEObject

@property (strong) NSArray *alliances;

-(void)setRelationshipsWithAlliance:(NSString *)allianceElement
                       Corporations:(NSString *)corporationsElement
             CorporationsParameters:(NSDictionary *)corporationsAttributes
                        Corporation:(NSString *)corporationElement;

@end
