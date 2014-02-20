//
//  XKObjectDescriptor.m
//  EveAPI
//
//  Created by Johnathan Richter on 2/7/14.
//  Copyright (c) 2014 Johnathan Richter. All rights reserved.
//

#import "XKObjectDescriptor.h"

@implementation XKObjectDescriptor

#pragma mark - Instance and Class Initialization Routines

-(instancetype)init
{
   self = [super init];
   if (self)
   {
      self.objectClass = nil;
      self.objectValueProperty = @"";
      self.objectAttributeProperties = @{};
      self.objectRelationships = @[];
      self.relationshipObjectProperty = @"";
      self.elementName = @"";
      self.elementAttributes = @{};
   }
   
   return self;
}

-(instancetype)initWithClass:(Class)aClass
                 ElementName:(NSString *)elementName
           ElementAttributes:(NSDictionary *)elementAttributes
               ValueProperty:(NSString *)valueProperty
         AttributeProperties:(NSDictionary *)attributeProperties
        RelationshipProperty:(NSString *)relationshipProperty
         ObjectRelationships:(NSArray *)objectRelationships
{
   self = [super init];
   if (self)
   {
      if (aClass) self.objectClass = aClass;
      else self.objectClass = nil;
      
      if (elementName) self.elementName = elementName;
      else self.elementName = @"";
      
      if (elementAttributes) self.elementAttributes = elementAttributes;
      else self.elementAttributes = @{};
      
      if (valueProperty) self.objectValueProperty = valueProperty;
      else self.objectValueProperty = @"";
      
      if (attributeProperties) self.objectAttributeProperties = attributeProperties;
      else self.objectAttributeProperties = @{};
      
      if (relationshipProperty) self.relationshipObjectProperty = relationshipProperty;
      else self.relationshipObjectProperty = @"";
      
      if (objectRelationships) self.objectRelationships = objectRelationships;
      else self.objectRelationships = @[];
   }
   
   return self;
}

+(instancetype)descriptorWithClass:(Class)aClass
                       ElementName:(NSString *)elementName
                 ElementAttributes:(NSDictionary *)elementAttributes
                     ValueProperty:(NSString *)valueProperty
               AttributeProperties:(NSDictionary *)attributeProperties
              RelationshipProperty:(NSString *)relationshipProperty
               ObjectRelationships:(NSArray *)objectRelationships
{
   XKObjectDescriptor *newInstance =
      [[XKObjectDescriptor alloc] initWithClass:aClass
                                    ElementName:elementName
                              ElementAttributes:elementAttributes
                                  ValueProperty:valueProperty
                            AttributeProperties:attributeProperties
                           RelationshipProperty:relationshipProperty
                            ObjectRelationships:objectRelationships];
   return newInstance;
}

#pragma mark - Instance Methods

-(BOOL)hasObjectValueProperty
{
   return [self.objectValueProperty length] > 0 ? YES : NO;
}

-(void)addObjectAttributeProperties:(NSDictionary *)properties
{
   NSMutableDictionary *newAttributes = [self.objectAttributeProperties mutableCopy];
   [newAttributes addEntriesFromDictionary:properties];
   self.objectAttributeProperties = [NSDictionary dictionaryWithDictionary:newAttributes];
}

-(void)addObjectRelationships:(NSArray *)relationships;
{
   NSMutableArray *newRelations = [self.objectRelationships mutableCopy];
   [newRelations addObjectsFromArray:relationships];
   self.objectRelationships = [NSArray arrayWithArray:newRelations];
}

-(BOOL)isEqualToObjectDescriptor:(XKObjectDescriptor *)other
{
   if (self == other) return YES;
   
   return
      self.objectClass == other.objectClass &&
      [self.objectValueProperty isEqual:other.objectValueProperty] &&
      [self.objectAttributeProperties isEqual:other.objectAttributeProperties] &&
      [self.objectRelationships isEqual:other.objectRelationships] &&
      [self.relationshipObjectProperty isEqual:other.relationshipObjectProperty] &&
      [self.elementName isEqual:other.elementName] &&
      [self.elementAttributes isEqual:other.elementAttributes];
}

#pragma mark - NSObject Overridden Methods

-(BOOL)isEqual:(id)object
{
   if (self == object)
   {
      return YES;
   }
   else if (!object || ![object isKindOfClass:[XKObjectDescriptor class]])
   {
      return NO;
   }
   
   XKObjectDescriptor *otherDescriptor = (XKObjectDescriptor *)object;
   
   return [self isEqualToObjectDescriptor:otherDescriptor];
}

-(NSUInteger)hash
{
   return [self.objectClass hash] ^ [self.objectValueProperty hash] ^
          [self.objectAttributeProperties hash] ^ [self.objectRelationships hash] ^
          [self.relationshipObjectProperty hash] ^ [self.elementName hash] ^
          [self.elementAttributes hash];
}

#pragma mark - NSCopying Protocol Methods

-(id)copyWithZone:(NSZone *)zone
{
   XKObjectDescriptor *objectCopy = [[XKObjectDescriptor allocWithZone:zone] init];
   
   // Copy over all instance variables from self to objectCopy. Use deep copies for all
   // strong pointers, shallow copies for weak
   [objectCopy setObjectClass:[self.objectClass copy]];
   [objectCopy setObjectValueProperty:[self.objectValueProperty copy]];
   [objectCopy setObjectAttributeProperties:[self.objectAttributeProperties copy]];
   [objectCopy setObjectRelationships:[self.objectRelationships copy]];
   [objectCopy setRelationshipObjectProperty:[self.relationshipObjectProperty copy]];
   [objectCopy setElementName:[self.elementName copy]];
   [objectCopy setElementAttributes:[self.elementAttributes copy]];
   
   return objectCopy;
}

@end
