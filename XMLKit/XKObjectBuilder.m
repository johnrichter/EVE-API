//
//  ObjectBuilder.m
//  EveAPI
//
//  Created by Johnathan Richter on 2/3/14.
//  Copyright (c) 2014 Johnathan Richter. All rights reserved.
//

#import "XKObjectBuilder.h"
#import "XMLKitErrors.h"
#import "XKObjectDescriptor.h"
#import "XKXMLSerialization.h"

@interface XKObjectBuilder ()

#pragma mark - XML-to-Object Conversion Properties
// Storage for the XKXMLSerialized XML element maps
@property (strong) NSArray *xmlElementMaps;

// Holds the elementName -> @[ObjectDescriptor] list
@property (strong) NSDictionary *elementNameToDescriptorMap;

// Storage for fully built objects {@"ClassName":@[Built, Objects]}
@property (strong) NSMutableDictionary *builtObjects;

// Value transformer to handle objective-c type conversions
@property (strong) RKCompoundValueTransformer *valueTransformer;

#pragma mark - Instance Methods

-(void)initializeValueTransformer;

#pragma mark - Descriptor Processing Methods

-(void)verifyObjectDescriptors:(NSArray *)descriptors;
-(NSDictionary *)generateElementNameToDescriptorMapUsingDescriptors:(NSArray *)descriptors;
-(XKObjectDescriptor *)findDescriptorMatchToElementName:(NSString *)elementName
                                             Attributes:(NSDictionary *)elementAttributes
                                     UsingDescriptorMap:(NSDictionary *)descriptorMap;

#pragma mark - Object Creation Methods

-(id)createObjectFromElement:(NSDictionary *)element
             UsingDescriptor:(XKObjectDescriptor *)descriptor;
-(void)setObject:(id)object Value:(id)value ForKey:(NSString *)key;

#pragma mark - XML Traversing Methods

-(void)processXmlElementMaps;
-(void)traverseNextElementGroup:(NSArray *)elementGroup;
-(void)processObject:(id)object
 RelationDescriptors:(NSArray *)descriptors
UsingElementChildren:(NSArray *)elementChildren;

#pragma mark - Utility Functions

-(void)saveBuiltObject:(id)object;

@end

@implementation XKObjectBuilder

#pragma mark - Initialization Routines

-(instancetype)initWithData:(NSData *)data
          ObjectDescriptors:(NSArray *)objectDescriptors
                    Success:(XKSuccessBlock)successBlock
                    Failure:(XKFailureBlock)failureBlock
{
   self = [super init];
   if (self)
   {
      self.xmlData = data;
      self.xmlElementMaps = @[];
      self.objectDescriptors = objectDescriptors;
      self.builtObjects = [NSMutableDictionary new];
      self.elementNameToDescriptorMap =
         [self generateElementNameToDescriptorMapUsingDescriptors:objectDescriptors];
      
      // If called with a nil value, the program will crash
      self.successBlock = successBlock;
      self.failureBlock = failureBlock;
      
      [self initializeValueTransformer];
   }
   
   return self;
}

-(void)initializeValueTransformer
{
   NSDateFormatter *customFormat1 = [NSDateFormatter new];
   [customFormat1 setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
   [customFormat1 setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:0]];
   
   self.valueTransformer =
   [RKCompoundValueTransformer compoundValueTransformerWithValueTransformers:
    @[[RKValueTransformer identityValueTransformer],
      [RKValueTransformer stringToURLValueTransformer],
      [RKValueTransformer decimalNumberToNumberValueTransformer],
      [RKValueTransformer decimalNumberToStringValueTransformer],
      [RKValueTransformer numberToStringValueTransformer],
      [RKValueTransformer arrayToOrderedSetValueTransformer],
      [RKValueTransformer arrayToSetValueTransformer],
      [RKValueTransformer nullValueTransformer],
      [RKValueTransformer keyedArchivingValueTransformer],
      [RKValueTransformer stringValueTransformer],
      [RKValueTransformer objectToCollectionValueTransformer],
      [RKValueTransformer stringValueTransformer],
      [RKValueTransformer keyOfDictionaryValueTransformer],
      [RKValueTransformer mutableValueTransformer],
      customFormat1,
      [RKValueTransformer iso8601TimestampToDateValueTransformer],
      [RKValueTransformer timeIntervalSince1970ToDateValueTransformer]]];
   
   NSArray *defaultDateFormatStrings = @[ @"MM/dd/yyyy", @"yyyy-MM-dd" ];
   for (NSString *dateFormatString in defaultDateFormatStrings)
   {
      NSDateFormatter *dateFormatter = [NSDateFormatter new];
      dateFormatter.dateFormat = dateFormatString;
      dateFormatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US_POSIX"];
      dateFormatter.timeZone = [NSTimeZone timeZoneWithAbbreviation:@"UTC"];
      [self.valueTransformer addValueTransformer:dateFormatter];
   }
   
//   RKValueTransformer *coreDataStringTransformer = [RKBlockValueTransformer
//      valueTransformerWithValidationBlock:^BOOL(__unsafe_unretained Class sourceClass,
//                                                __unsafe_unretained Class destinationClass)
//      {
//         // We transform an `NSString` into another `NSString`
//         return ([sourceClass isSubclassOfClass:[NSString class]] &&
//                 [destinationClass isSubclassOfClass:[NSString class]]);
//      }
//      transformationBlock:^BOOL(id inputValue,
//                                __autoreleasing id *outputValue,
//                                Class outputValueClass,
//                                NSError *__autoreleasing *error)
//      {
//         // Validate the input and output
//         RKValueTransformerTestInputValueIsKindOfClass(inputValue,
//                                                       [NSString class],
//                                                       error);
//       
//         RKValueTransformerTestOutputValueClassIsSubclassOfClass(outputValueClass,
//                                                                 [NSString class],
//                                                                 error);
//       
//         // Perform the transformation
//         [(*(NSString *)outputValue) setString:[inputValue stringValue]];
//         
//         return YES;
//      }];
//   
//   [self.valueTransformer addValueTransformer:coreDataStringTransformer];
}

#pragma mark - Public Methods

-(void)buildObjects
{
   //
   // Check all prerequisites
   //
   
   if (!self.successBlock || !self.failureBlock)
   {
      NSLog(@"XKSuccessBlock or XKFailureBlock not given to XMLKit. Exiting...");
      return;
   }
   
   if (!self.objectDescriptors || !self.xmlData || [self.xmlData length] == 0)
   {
      NSDictionary *userInfo =
      @{NSLocalizedDescriptionKey:
           NSLocalizedString(@"The XML data or Object Descriptor list not found.", nil)};
      
      NSError *error = [NSError errorWithDomain:XKErrorDomain
                                           code:kXKObjectBuilderErrorMissingParameters
                                       userInfo:userInfo];
      self.failureBlock(error);
   }
   
   NSError *xmlSerializeError = nil;
   self.xmlElementMaps =
      [XKXMLSerialization XMLCollectionFromData:self.xmlData Error:&xmlSerializeError];
   
   if (xmlSerializeError)
   {
      self.failureBlock(xmlSerializeError);
   }
   
   if (!self.xmlElementMaps || [self.xmlElementMaps count] == 0)
   {
      NSDictionary *userInfo =
         @{NSLocalizedDescriptionKey:
              NSLocalizedString(@"XML not found in request data.", nil)};
      
      NSError *error = [NSError errorWithDomain:XKErrorDomain
                                           code:kXKObjectBuilderErrorXMLDataNotFound
                                       userInfo:userInfo];
      self.failureBlock(error);
   }
   
   // Having more than one root element is acceptable in XML however, it is currently restricted
   if ([self.xmlElementMaps count] > 1)
   {
      NSDictionary *userInfo =
         @{NSLocalizedDescriptionKey:
              NSLocalizedString(@"The XML map contained more than one root element.", nil)};
      
      NSError *error = [NSError errorWithDomain:XKErrorDomain
                                           code:kXKObjectBuilderErrorImproperXMLMapStructure
                                       userInfo:userInfo];
      self.failureBlock(error);
   }
   
   //
   // Verify that all object descriptors are unique
   //
   
   [self verifyObjectDescriptors:self.objectDescriptors];
   
   //
   // Convert the XML Map into Objects
   //
   
   [self processXmlElementMaps];
   
   //
   // All XML elements have been processed, report the success
   //
   
   self.successBlock([NSDictionary dictionaryWithDictionary:self.builtObjects], nil);
}

#pragma mark - Descriptor Processing Methods
-(void)verifyObjectDescriptors:(NSArray *)descriptors
{
   //
   // Compare the element names and attributes to determine object descriptor uniqueness
   //
   for (XKObjectDescriptor *descriptor1 in descriptors)
   {
      for (XKObjectDescriptor *descriptor2 in descriptors)
      {
         // The object pointers are the same, skip this comparison.
         if (descriptor1 == descriptor2)
         {
            continue;
         }
         else if ([descriptor1.elementName isEqualToString:descriptor2.elementName] &&
                  [descriptor1.elementAttributes isEqualToDictionary:descriptor2.elementAttributes])
         {
            NSString *errorDescription =
               [NSString stringWithFormat:@"Duplicate descriptors found in descriptor list "
                                          @"or %@'s relationship descriptor list",
                                          NSStringFromClass(descriptor1.class)];
            NSDictionary *userInfo =
               @{NSLocalizedDescriptionKey:NSLocalizedString(errorDescription, nil)};
            
            NSError *error = [NSError errorWithDomain:XKErrorDomain
                                                 code:kXKObjectBuilderErrorNonUniqueDescriptorList
                                             userInfo:userInfo];
            self.failureBlock(error);
         }
      }
      
      // Verify the descriptors relationship descriptors
      [self verifyObjectDescriptors:descriptor1.objectRelationships];
   }
}

-(NSDictionary *)generateElementNameToDescriptorMapUsingDescriptors:(NSArray *)descriptors
{
   NSMutableDictionary *nameToDescriptionMap = [NSMutableDictionary new];
   
   for (XKObjectDescriptor *descriptor in descriptors)
   {
      if (nameToDescriptionMap[descriptor.elementName])
      {
         [nameToDescriptionMap[descriptor.elementName] addObject:descriptor];
      }
      else
      {
         nameToDescriptionMap[descriptor.elementName] = [NSMutableArray arrayWithObject:descriptor];
      }
   }
   
   return [NSDictionary dictionaryWithDictionary:nameToDescriptionMap];
}

-(XKObjectDescriptor *)findDescriptorMatchToElementName:(NSString *)elementName
                                             Attributes:(NSDictionary *)elementAttributes
                                     UsingDescriptorMap:(NSDictionary *)descriptorMap
{
   //
   // If the descriptor is referenced in the descriptorMap then we have
   // an initial match.  To verify match we compare the attributes of the descriptor
   // to those in the XML element.  If the keys and values are equal we have a match.
   //
   
   XKObjectDescriptor *descriptor = nil;
   NSArray *descriptorList = descriptorMap[elementName];
   
   if (descriptorList)
   {
      for (descriptor in descriptorList)
      {
         for (NSString *attributeName in descriptor.elementAttributes)
         {
            if (![elementAttributes objectForKey:attributeName] ||
                ![elementAttributes[attributeName] isEqualToString:
                  descriptor.elementAttributes[attributeName]])
            {
               descriptor = nil;
               break;
            }
         }
         if (descriptor) break; // A match was found
      }
   }
   
   return descriptor;
}

#pragma mark - Object Creation Methods

-(id)createObjectFromElement:(NSDictionary *)element
             UsingDescriptor:(XKObjectDescriptor *)descriptor
{
   //
   // The 'element' parameter is a dictionary with keys: attributes, value, children
   //
   
   NSString *elementValue = element[@"value"];
   NSDictionary *elementAttributes = element[@"attributes"];
   NSArray *elementChildren = element[@"children"];
   
   //
   // Create the object
   //
   
   id newObject = [[descriptor objectClass] new];
   
   //
   // Set the value, if it has one and the XML has a a value
   //
   
   if ([descriptor hasObjectValueProperty])
   {
      [self setObject:newObject Value:elementValue ForKey:descriptor.objectValueProperty];
   }
   
   //
   // Set the attributes, if the XML has some
   //
   
   for (NSString *objectXmlAttribute in descriptor.objectAttributeProperties)
   {
      NSString *objectAttribute = descriptor.objectAttributeProperties[objectXmlAttribute];
      NSString *elementAttributeValue = elementAttributes[objectXmlAttribute];
      
      // Check if the XML had a match to the object's XML attributes
      if (elementAttributeValue != nil)
      {
         [self setObject:newObject Value:elementAttributeValue ForKey:objectAttribute];
      }
   }
   
   //
   // Process newObject's relationships by looking at the elementChildren
   //
   
   [self processObject:newObject
   RelationDescriptors:descriptor.objectRelationships
  UsingElementChildren:elementChildren];
   
   return newObject;
}

-(void)setObject:(id)object Value:(id)value ForKey:(NSString *)key
{
   if ([object respondsToSelector:NSSelectorFromString(key)])
   {
      // Will hold the object that matches the object's key type
      id convertedValue = nil;
      NSError *valueTransformError = nil;
      BOOL transformSuccess = NO;
      
      //
      // Loop through the destination property type's classes to convert successfully
      // This is done to get around string optimization and the use of string literals
      // when initializing objects.  The type `NSCFConstantString` cannot be assigned to.
      //
      
      Class objectPropertyClass = [[object valueForKey:key] class];
      while (!transformSuccess && objectPropertyClass != nil)
      {
         transformSuccess = [self.valueTransformer transformValue:value
                                                          toValue:&convertedValue
                                                          ofClass:objectPropertyClass
                                                            error:&valueTransformError];
         objectPropertyClass = [objectPropertyClass superclass];
      }
      
      if (transformSuccess)
      {
         [object setValue:convertedValue forKey:key];
      }
      else
      {
#ifdef DEBUG
         NSLog(@"Unable to convert value for %@ object's %@ property",
               NSStringFromClass([object class]), key);
#endif
      }
   }
}

#pragma mark - XML Traversing Methods

-(void)processXmlElementMaps
{
   //
   // Process all elements found in the xmlElementMaps
   //
   
   for (NSDictionary *element in self.xmlElementMaps)
   {
      NSString *elementName = element[@"name"];
      NSDictionary *elementAttributes = element[@"attributes"];
      NSArray *elementChildren = element[@"children"];
      
      //
      // Check the elementName and elementAttributes to see if they match an ObjectDescriptor
      //
      
      XKObjectDescriptor *descriptor =
         [self findDescriptorMatchToElementName:elementName
                                     Attributes:elementAttributes
                             UsingDescriptorMap:self.elementNameToDescriptorMap];
      //
      // Match - build the object. Process the children.
      //
      
      if (descriptor)
      {
         id newObject = [self createObjectFromElement:element
                                      UsingDescriptor:descriptor];
         [self saveBuiltObject:newObject];
      }

      // This is a recursive function
      [self traverseNextElementGroup:elementChildren];
   }
}

-(void)traverseNextElementGroup:(NSArray *)elementGroup
{
   // This method is similar to a depth-first-search routine
   for (NSDictionary *element in elementGroup)
   {
      NSString *elementName = element[@"name"];
      NSDictionary *elementAttributes = element[@"attributes"];
      NSArray *elementChildren = element[@"children"];
      
      //
      // Check the elementName and elementAttributes to see if they match an ObjectDescriptor
      //
      
      XKObjectDescriptor *descriptor =
         [self findDescriptorMatchToElementName:elementName
                                     Attributes:elementAttributes
                             UsingDescriptorMap:self.elementNameToDescriptorMap];
      //
      // Match - build the object. Process the children.
      //
      
      if (descriptor)
      {
         id newObject = [self createObjectFromElement:element
                                      UsingDescriptor:descriptor];
         [self saveBuiltObject:newObject];
      }
      
      // This is a recursive function
      [self traverseNextElementGroup:elementChildren];
   }
}

// Potential to cause large memory usage while using descriptors as dictionary keys
-(void)processObject:(id)object
 RelationDescriptors:(NSArray *)descriptors
UsingElementChildren:(NSArray *)elementChildren
{
   //
   // Check the descriptors relationships, if it has them check the children for matches.
   // Relationships are only valid for direct decendents so only process the children.
   //
   
   NSMutableDictionary *builtRelationObjects = [NSMutableDictionary new];
   NSDictionary *relationElementNameToDescriptorMap =
      [self generateElementNameToDescriptorMapUsingDescriptors:descriptors];
   
   // Loop over all XML children and match against the descriptor's relationship descriptors.
   for (NSDictionary *child in elementChildren)
   {
      NSString *childElementName = child[@"name"];
      NSDictionary *childElementAttributes = child[@"attributes"];
      
      XKObjectDescriptor *relationDescriptor =
         [self findDescriptorMatchToElementName:childElementName
                                     Attributes:childElementAttributes
                             UsingDescriptorMap:relationElementNameToDescriptorMap];
      if (relationDescriptor)
      {
         id newRelationObject = [self createObjectFromElement:child
                                              UsingDescriptor:relationDescriptor];
         
         if (!builtRelationObjects[relationDescriptor])
         {
            builtRelationObjects[relationDescriptor] =
               [NSMutableArray arrayWithObject:newRelationObject];
         }
         else
         {
            [builtRelationObjects[relationDescriptor] addObject:newRelationObject];
         }
      }
   }
   
   //
   // Set the newObjects properties to the builtRelationObjects
   //

   for (XKObjectDescriptor *relationDescriptor in builtRelationObjects)
   {
      NSArray *objectList = builtRelationObjects[relationDescriptor];
      
      if (objectList && [objectList count] != 0)
      {
         // To-One relationship
         if ([objectList count] == 1)
         {
            [self setObject:object
                      Value:[objectList firstObject]
                     ForKey:relationDescriptor.relationshipObjectProperty];
         }
         else  // To-Many relationship
         {
            [self setObject:object
                      Value:objectList
                     ForKey:relationDescriptor.relationshipObjectProperty];
         }
      }
   }
}

#pragma mark - Utility Functions

-(void)saveBuiltObject:(id)object
{
   NSString *newObjectClass = NSStringFromClass([object class]);
   
   if (!self.builtObjects[newObjectClass])
   {
      self.builtObjects[newObjectClass] = [NSMutableArray arrayWithObject:object];
   }
   else
   {
      [self.builtObjects[newObjectClass] addObject:object];
   }
}
@end
