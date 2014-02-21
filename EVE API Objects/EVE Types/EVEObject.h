//
//  EVEObject.h
//  EveAPI
//
//  Created by Johnathan Richter on 10/4/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XKObjectDescriptor.h"

@interface EVEObject : NSObject

@property (strong) XKObjectDescriptor *objectDescriptor;

/*
 * Pure abstract method - Will throw exception if not overridden
 */
-(void)configureObjectDescriptor;

@end
