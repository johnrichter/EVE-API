//
//  XKObjectDescriptor.h
//  EveAPI
//
//  Created by Johnathan Richter on 2/7/14.
//  Copyright (c) 2014 Johnathan Richter. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XMLKit.h"

@interface XKObjectDescriptor : NSObject <NSCopying>

@property (strong) Class objectClass;

#pragma mark - Properties used during object creation

@property (strong) NSString *objectValueProperty;

// This property contains the @"xmlAttributeName" : @"objectAttributeName" mapping
@property (strong) NSDictionary *objectAttributeProperties;

// Contains a list of XKObjectDescriptors that describe the objects relationships
@property (strong) NSArray *objectRelationships;

// Contains the object key to assign relationship objects to if being used as a relatiion descriptor
@property (strong) NSString *relationshipObjectProperty;

#pragma mark - Properties used during XML matching

@property (strong) NSString *elementName;
@property (strong) NSDictionary *elementAttributes;

#pragma mark - Initialization Routines

-(instancetype)init;
-(instancetype)initWithClass:(Class)aClass
                 ElementName:(NSString *)elementName
           ElementAttributes:(NSDictionary *)elementAttributes
               ValueProperty:(NSString *)valueProperty
         AttributeProperties:(NSDictionary *)attributeProperties
        RelationshipProperty:(NSString *)relationshipProperty
         ObjectRelationships:(NSArray *)objectRelationships;

-(BOOL)hasObjectValueProperty;
-(void)addObjectAttributeProperties:(NSDictionary *)properties;
-(void)addObjectRelationships:(NSArray *)relationships;

+(instancetype)descriptorWithClass:(Class)aClass
                       ElementName:(NSString *)elementName
                 ElementAttributes:(NSDictionary *)elementAttributes
                     ValueProperty:(NSString *)valueProperty
               AttributeProperties:(NSDictionary *)attributeProperties
              RelationshipProperty:(NSString *)relationshipProperty
               ObjectRelationships:(NSArray *)objectRelationships;

#pragma mark - NSObject Overridden Methods

-(BOOL)isEqual:(id)object;
-(BOOL)isEqualToObjectDescriptor:(XKObjectDescriptor *)other;
-(NSUInteger)hash;

#pragma mark - NSCopying Protocol Methods

-(id)copyWithZone:(NSZone *)zone;

@end
