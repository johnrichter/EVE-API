//
//  XKXMLSerialization.h
//  EveAPI
//
//  Created by Johnathan Richter on 2/13/14.
//  Copyright (c) 2014 Johnathan Richter. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XMLKit.h"

@interface XKXMLSerialization : NSObject <NSXMLParserDelegate>

// Container for the in memory representation of the current XML document
@property (strong) NSMutableDictionary *currentTopLevelElement;

// The current XML element being processed
@property (strong) NSMutableDictionary *currentElement;

// The mapping from elements to their parent elements
@property (strong) NSMutableDictionary *elementToParentMap;

// The collection of all elements mapped
@property (strong) NSMutableArray *xmlElements;

#pragma mark - Instance Methods

-(NSArray *)immutableCopyOfElements;

#pragma mark - Class Methods

+(NSArray *)XMLCollectionFromData:(NSData *)data
                                 Error:(NSError *__autoreleasing *)error;

+(NSArray *)XMLCollectionFromFile:(NSURL *)pathToFile
                                 Error:(NSError *__autoreleasing *)error;

#pragma mark - NSXMLParserDelegate Protocol Methods

-(void)parserDidStartDocument:(NSXMLParser *)parser;

-(void)parserDidEndDocument:(NSXMLParser *)parser;

-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName
                                       namespaceURI:(NSString *)namespaceURI
                                      qualifiedName:(NSString *)qName
                                         attributes:(NSDictionary *)attributeDict;

-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName
                                     namespaceURI:(NSString *)namespaceURI
                                    qualifiedName:(NSString *)qName;

-(void)parser:(NSXMLParser *)parser parseErrorOccurred:(NSError *)parseError;

-(void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string;

-(void)parser:(NSXMLParser *)parser foundComment:(NSString *)comment;

-(void)parser:(NSXMLParser *)parser foundCDATA:(NSData *)CDATABlock;

-(void)parser:(NSXMLParser *)parser foundIgnorableWhitespace:(NSString *)whitespaceString;

-(void)parser:(NSXMLParser *)parser foundAttributeDeclarationWithName:(NSString *)attributeName
                                                           forElement:(NSString *)elementName
                                                                 type:(NSString *)type
                                                         defaultValue:(NSString *)defaultValue;

-(void)parser:(NSXMLParser *)parser foundElementDeclarationWithName:(NSString *)elementName
                                                              model:(NSString *)model;

-(void)parser:(NSXMLParser *)parser foundExternalEntityDeclarationWithName:(NSString *)name
                                                                  publicID:(NSString *)publicID
                                                                  systemID:(NSString *)systemID;

-(void)parser:(NSXMLParser *)parser foundInternalEntityDeclarationWithName:(NSString *)name
                                                                     value:(NSString *)value;

-(void)parser:(NSXMLParser *)parser foundUnparsedEntityDeclarationWithName:(NSString *)name
                                                                  publicID:(NSString *)publicID
                                                                  systemID:(NSString *)systemID
                                                              notationName:(NSString *)notationName;

-(void)parser:(NSXMLParser *)parser foundNotationDeclarationWithName:(NSString *)name
                                                            publicID:(NSString *)publicID
                                                            systemID:(NSString *)systemID;

@end
