//
//  EVEObject.m
//  EveAPI
//
//  Created by Johnathan Richter on 10/4/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import "EVEObject.h"

@implementation EVEObject

-(id)init
{
   self = [super init];
   if (self)
   {
      self.objectDescriptor = [XKObjectDescriptor new];
      [self configureObjectDescriptor];
   }
   
   return self;
}

-(void)configureObjectDescriptor
{
   [NSException raise:@"Abstraction Method"
               format:@"EVEObject subclass did not implement -configureObjectBlueprint"];
}

@end
