//
//  XKXMLSerialization.m
//  EveAPI
//
//  Created by Johnathan Richter on 2/13/14.
//  Copyright (c) 2014 Johnathan Richter. All rights reserved.
//

#import "XKXMLSerialization.h"

@interface XKXMLSerialization ()

-(NSDictionary *)immutableCopyOfXmlElement:(NSDictionary *)element;

@end

@implementation XKXMLSerialization

-(instancetype)init
{
   self = [super init];
   if (self)
   {
      self.currentTopLevelElement = nil;
      self.currentElement = nil;
      self.elementToParentMap = [NSMutableDictionary new];
      self.xmlElements = [NSMutableArray new];
   }
   
   return self;
}

#pragma mark - Class Routines

+(NSArray *)XMLCollectionFromData:(NSData *)data Error:(NSError *__autoreleasing *)error
{
   XKXMLSerialization *newInstance = [XKXMLSerialization new];
   
   NSXMLParser *xmlParser = [[NSXMLParser alloc] initWithData:data];
   [xmlParser setDelegate:newInstance];
   [xmlParser setShouldProcessNamespaces:NO];
   [xmlParser setShouldReportNamespacePrefixes:NO];
   [xmlParser setShouldResolveExternalEntities:NO];
   
   BOOL parseSuccess = [xmlParser parse];
   if (!parseSuccess && error)
   {
      *error = [xmlParser parserError];
   }
   
   return [newInstance immutableCopyOfElements];
}

+(NSArray *)XMLCollectionFromFile:(NSURL *)pathToFile Error:(NSError *__autoreleasing *)error
{
   XKXMLSerialization *newInstance = [XKXMLSerialization new];
   
   NSXMLParser *xmlParser = [[NSXMLParser alloc] initWithContentsOfURL:pathToFile];
   [xmlParser setDelegate:newInstance];
   [xmlParser setShouldProcessNamespaces:NO];
   [xmlParser setShouldReportNamespacePrefixes:NO];
   [xmlParser setShouldResolveExternalEntities:NO];
   
   BOOL parseSuccess = [xmlParser parse];
   if (!parseSuccess && error)
   {
      *error = [xmlParser parserError];
   }
   
   return [newInstance immutableCopyOfElements];

}

-(NSArray *)immutableCopyOfElements
{
   //
   // Create immutable copies of all elements mapped in xmlElements
   //
   
   NSMutableArray *immutableElements = [NSMutableArray new];
   
   for (NSMutableDictionary *element in self.xmlElements)
   {
      [immutableElements addObject:[self immutableCopyOfXmlElement:element]];
   }
   
   return [NSArray arrayWithArray:immutableElements];
}

-(NSDictionary *)immutableCopyOfXmlElement:(NSDictionary *)element
{
   NSMutableArray *immutableChildren = [NSMutableArray new];
   
   if ([element[@"children"] count] > 0)
   {
      for (NSDictionary *child in element[@"children"])
      {
         [immutableChildren addObject:[self immutableCopyOfXmlElement:child]];
      }
   }
   
   return @{@"name":element[@"name"],
            @"attributes":element[@"attributes"],
            @"value":element[@"value"],
            @"children":[NSArray arrayWithArray:immutableChildren]};
}

#pragma mark - NSXMLParserDelegate Protocol Methods

/*
 *
 */
-(void)parserDidStartDocument:(NSXMLParser *)parser
{
#ifdef DEBUG
   NSLog(@"Started parsing document");
#endif
}

/*
 *
 */
-(void)parserDidEndDocument:(NSXMLParser *)parser
{
#ifdef DEBUG
   NSLog(@"Ended parsing document");
#endif
}

/*
 * Sent by the parser when it encounters the start tag for a specific element
 */
-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName
                                       namespaceURI:(NSString *)namespaceURI
                                      qualifiedName:(NSString *)qName
                                         attributes:(NSDictionary *)attributeDict
{
   if (elementName && [elementName length] > 0)
   {
      NSMutableDictionary *newElement = [NSMutableDictionary dictionaryWithDictionary:
                                         @{@"name":elementName,
                                           @"attributes":attributeDict,
                                           @"value":@"",
                                           @"children":[NSMutableArray new]}];
      
      NSValue *newParentKey = [NSValue valueWithNonretainedObject:newElement];
      
      // This is a top level element
      if (!self.currentTopLevelElement)
      {
         self.currentTopLevelElement = newElement;
      }
      else if (self.currentElement == nil) // We have more than one root
      {
         [parser abortParsing];
      }
      else // This is a child object
      {
         [self.currentElement[@"children"] addObject:newElement];
      }
      
      //
      // Update our element pointers.
      //
      
      // If current element has not been set, we are processing the root (it has no parent)
      if (self.currentElement)
      {
         self.elementToParentMap[newParentKey] = self.currentElement;
      }

      self.currentElement = newElement;
   }
   else
   {
      [parser abortParsing];
   }
}

/*
 * Sent by the parser when it encounters an end tag for a specific element
 */
-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName
                                     namespaceURI:(NSString *)namespaceURI
                                    qualifiedName:(NSString *)qName
{
   //
   // Update our element pointers
   //
   
   // Set the currentElement to its parent
   NSValue *currentParentKey = [NSValue valueWithNonretainedObject:self.currentElement];
   self.currentElement = self.elementToParentMap[currentParentKey];
   
   // If the currentElement did not have a parent we have processed the entire top level
   // element.  Add it to our list and reset the topLevelElement pointer and
   // elementToParentMap.
   if (!self.currentElement)
   {
      [self.xmlElements addObject:self.currentTopLevelElement];
      self.currentTopLevelElement = nil;
      
      [self.elementToParentMap removeAllObjects];
   }
}

/*
 * Sent by the parser when it encounters a fatal error
 */
-(void)parser:(NSXMLParser *)parser parseErrorOccurred:(NSError *)parseError
{
#ifdef DEBUG
   NSLog(@"Error occurred while parsing data.\nCode: %ld\nDescription: %@",
         (long)parseError.code, parseError.description);
#endif
}

/*
 * Sent by the parser to provide a string representing all or part of the characters of 
 * the current element. (The elements 'value')
 */
-(void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
   NSArray *nonWhiteSpaceCharacters =
      [string componentsSeparatedByCharactersInSet:[NSCharacterSet newlineCharacterSet]];
   NSString *cleanString = [nonWhiteSpaceCharacters componentsJoinedByString:@""];
   
   // If the text was not all whitespace
   if (![cleanString isEqualToString:@""])
   {
      NSString *currentValue = self.currentElement[@"value"];
      if ([currentValue length] > 0)
      {
         NSString *newValue = [NSString stringWithFormat:@"%@%@", currentValue, cleanString];
         self.currentElement[@"value"] = newValue;
      }
      else
      {
         self.currentElement[@"value"] = cleanString;
      }
   }
}

/*
 * Sent by the parser object when it encounters a comment in the XML
 */
-(void)parser:(NSXMLParser *)parser foundComment:(NSString *)comment
{
#ifdef DEBUG
   NSLog(@"Found comment in document:\n\t%@", comment);
#endif
}

/*
 * Sent by the parser when it encounters a CDATA block
 */
-(void)parser:(NSXMLParser *)parser foundCDATA:(NSData *)CDATABlock
{
   // Through this method the parser passes the contents of the block in an NSData object.
   // The CDATA block is character data that is ignored by the parser. The encoding of the
   // character data is UTF-8. To convert the data object to a string object, use the
   // NSString method initWithData:encoding:.
   
   // We treat CDATA as element string values for now
   [self parser:parser foundCharacters:[[NSString alloc] initWithData:CDATABlock
                                                             encoding:NSUTF8StringEncoding]];
}

/*
 * Reported by the parser to provide a string representing all or part of the ignorable 
 * whitespace characters of the current element
 */
-(void)parser:(NSXMLParser *)parser foundIgnorableWhitespace:(NSString *)whitespaceString
{
   // Do nothing for now
}

/*
 * Sent by the parser when it encounters a declaration of an attribute that is associated 
 * with a specific element
 */
-(void)parser:(NSXMLParser *)parser foundAttributeDeclarationWithName:(NSString *)attributeName
                                                           forElement:(NSString *)elementName
                                                                 type:(NSString *)type
                                                         defaultValue:(NSString *)defaultValue
{
#ifdef DEBUG
   NSLog(@"Found attribute declaration with "
         @"name: %@, for element: %@, with type: %@, and default value: %@",
         attributeName, elementName, type, defaultValue);
#endif
}

/*
 * Sent by the parser when it encounters a declaration of an element with a given model
 */
-(void)parser:(NSXMLParser *)parser foundElementDeclarationWithName:(NSString *)elementName
                                                              model:(NSString *)model
{
#ifdef DEBUG
   NSLog(@"Found element declaration with name: %@ and model: %@",
         elementName, model);
#endif
}

/*
 * Sent by the parser when it encounters an external entity declaration
 */
-(void)parser:(NSXMLParser *)parser foundExternalEntityDeclarationWithName:(NSString *)name
                                                                  publicID:(NSString *)publicID
                                                                  systemID:(NSString *)systemID
{
#ifdef DEBUG
   NSLog(@"Found external entity declaration with name: %@, public ID: %@, and system ID: %@",
         name, publicID, systemID);
#endif
}

/*
 * Sent by the parser when it encounters an internal entity declaration
 */
-(void)parser:(NSXMLParser *)parser foundInternalEntityDeclarationWithName:(NSString *)name
                                                                     value:(NSString *)value
{
#ifdef DEBUG
   NSLog(@"Found internal entity declaraion with name: %@ and value: %@",
         name, value);
#endif
}

/*
 * Sent by the parser when it encounters an unparsed entity declaration
 */
-(void)parser:(NSXMLParser *)parser foundUnparsedEntityDeclarationWithName:(NSString *)name
                                                                  publicID:(NSString *)publicID
                                                                  systemID:(NSString *)systemID
                                                              notationName:(NSString *)notationName
{
#ifdef DEBUG
   NSLog(@"Found unparsed entity declaration with "
         @"name: %@, publid ID: %@, system ID: %@, and notation name: %@",
         name, publicID, systemID, notationName);
#endif
}

/*
 * Sent by the parser when it encounters a notation declaration
 */
-(void)parser:(NSXMLParser *)parser foundNotationDeclarationWithName:(NSString *)name
                                                            publicID:(NSString *)publicID
                                                            systemID:(NSString *)systemID
{
#ifdef DEBUG
   NSLog(@"Found notation declaration with name: %@, public ID: %@, and system ID: %@",
         name, publicID, systemID);
#endif
}

@end
