//
//  ObjectBuilder.h
//  EveAPI
//
//  Created by Johnathan Richter on 2/3/14.
//  Copyright (c) 2014 Johnathan Richter. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XMLKit.h"
#import "RKValueTransformers.h"

@interface XKObjectBuilder : NSObject

// Holds copy of the callers XML Data
@property (strong) NSData *xmlData;

// Storage for the XKXMLSerialized XML map
@property (strong) NSDictionary *xmlMap;

// Holds a copy of all descriptors from the caller
@property (strong) NSArray *objectDescriptors;

// Holds the elementName -> @[ObjectDescriptor] list
@property (strong) NSDictionary *elementNameToDescriptorMap;

// Storage for fully built objects {@"ClassName":@[Built, Objects]}
@property (strong) NSMutableDictionary *builtObjects;

// Caller's 'operation succeeded' block
@property (copy) XKSuccessBlock successBlock;

// Caller's 'operation failed' block
@property (copy) XKFailureBlock failureBlock;

-(instancetype)initWithData:(NSData *)data
          ObjectDescriptors:(NSArray *)objectDescriptors
                    Success:(XKSuccessBlock)successBlock
                    Failure:(XKFailureBlock)failureBlock;

-(void)buildObjects;

@end
