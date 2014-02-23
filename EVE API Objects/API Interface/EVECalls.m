//
//  EVECalls.m
//  EVEApi Beta
//
//  Created by Johnathan Richter on 2/22/14.
//  Copyright (c) 2014 D-Squared Productions. All rights reserved.
//

#import "EVECalls.h"
#import "EVECall.h"

@implementation EVECalls

-(instancetype)init
{
   self = [super init];
   if (self)
   {
      // Initialize XML Variables
      self.calls = @[];
   }
   
   return self;
}

-(void)setRelationshipsWithCall:(NSString *)callElement
{
   XKObjectDescriptor *call = [[EVECall new] objectDescriptor];
   [call setElementName:callElement];
   [call setRelationshipObjectProperty:@"calls"];
   
   [self.objectDescriptor setObjectRelationships:@[call]];
}

-(void)configureObjectDescriptor
{
   [self.objectDescriptor setObjectClass:[self class]];
}

-(NSString *)description
{
   NSMutableString *str = [NSMutableString new];
   
   for (EVECall *call in self.calls)
   {
      [str appendFormat:@"%@\n", call];
   }

   return [NSString stringWithString:str];
}

#pragma mark - Private Instance Methods

#pragma mark - KVC Attribute and To-One Compliance Methods

-(void)setNilValueForKey:(NSString *)key
{
   if([key isEqualToString:@"calls"])
   {
      self.calls = @[];
   }
}

@end
