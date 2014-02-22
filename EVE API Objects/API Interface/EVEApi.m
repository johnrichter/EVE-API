//
//  EVEApi.m
//  EveAPI
//
//  Created by Johnathan Richter on 10/4/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import "EVEApi.h"

@implementation EVEApi

-(instancetype)init
{
   self = [super init];
   if (self)
   {
      // XML Properties
      self.lastQueried = [EVEDate new];
      self.cachedUntil = [EVEDate new];
      self.apiError = [EVEError new];
      self.apiVersion = @0;
   }
   
   return self;
}

-(void)configureObjectDescriptor
{
   // Configure the main blueprint for our api object
   [self.objectDescriptor setObjectClass:[self class]];
   [self.objectDescriptor setObjectAttributeProperties:@{@"version":@"apiVersion"}];
}

-(void)setRelationshipsWithLastQueried:(NSString *)lastQueriedElement
                           CachedUntil:(NSString *)cachedUntilElement
                              ApiError:(NSString *)apiErrorElement
{
   XKObjectDescriptor *lastQueried = [[EVEDate new] objectDescriptor];
   [lastQueried setElementName:lastQueriedElement];
   [lastQueried setRelationshipObjectProperty:@"lastQueried"];
   
   XKObjectDescriptor *cachedUntil = [[EVEDate new] objectDescriptor];
   [cachedUntil setElementName:cachedUntilElement];
   [cachedUntil setRelationshipObjectProperty:@"cachedUntil"];
   
   XKObjectDescriptor *apiError = [[EVEError new] objectDescriptor];
   [apiError setElementName:apiErrorElement];
   [apiError setRelationshipObjectProperty:@"apiError"];
   
   [self.objectDescriptor setObjectRelationships:@[lastQueried, cachedUntil, apiError]];
}

@end
