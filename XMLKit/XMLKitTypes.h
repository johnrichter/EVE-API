//
//  XMLKitTypes.h
//  EveAPI
//
//  Created by Johnathan Richter on 2/17/14.
//  Copyright (c) 2014 Johnathan Richter. All rights reserved.
//

#import <Foundation/Foundation.h>

#define XMLKITDEBUG

// Code block that is called when XMLKit succeeds.
// XKSuccessBlock({@"Built Object Class Name":@[Built, objects, ...], error)
typedef void (^XKSuccessBlock)(NSDictionary *, NSError *);

// Code block that is called when XMLKit encounters an error
// XKFailureBlock({@"Built Object Class Name":@[Built, objects, ...], error)
typedef void (^XKFailureBlock)(NSDictionary *, NSError *);
