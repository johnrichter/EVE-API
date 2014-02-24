//
//  EVESecurityStatus.m
//  EveAPI
//
//  Created by Johnathan Richter on 11/30/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import "EVESecurityStatus.h"

@implementation EVESecurityStatus

-(NSString *)description
{
   return [NSString stringWithFormat:@"%@", self.number];
}

@end
