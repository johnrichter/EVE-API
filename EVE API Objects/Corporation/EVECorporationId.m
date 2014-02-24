//
//  EVECorporationId.m
//  EveAPI
//
//  Created by Johnathan Richter on 10/15/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import "EVECorporationId.h"

@interface EVECorporationId ()

@end

@implementation EVECorporationId

#pragma mark - Instance Methods

-(instancetype)init
{
   self = [super init];
   if (self)
   {
      // Initialize Instance Variables
      self.corporationId = @0;
   }
   
   return self;
}

-(void)configureObjectDescriptor
{
   [self.objectDescriptor setObjectClass:[self class]];
   [self.objectDescriptor setObjectValueProperty:@"corporationId"];
}

-(NSString *)description
{
   return [NSString stringWithFormat:@"%@", self.corporationId];
}

#pragma mark - Private Instance Methods

#pragma mark - KVC Attribute and To-One Compliance Methods

-(void)setNilValueForKey:(NSString *)key
{
   if([key isEqualToString:@"corporationId"])
   {
      self.corporationId = @0;
   }
}

@end
