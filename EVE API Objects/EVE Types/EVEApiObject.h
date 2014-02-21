//
//  EVEApi.h
//  EveAPI
//
//  Created by Johnathan Richter on 10/3/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EVEDate.h"
#import "EVEError.h"
#import "XMLKit.h"
#import "XKURLRequestOperation.h"

typedef NS_ENUM(NSUInteger, EVECacheStyle)
{
   kShortCache,
   kModifiedShortCache,
   kLongCache
};

@interface EVEApiObject : NSObject

#pragma mark - Common API Properties
@property (strong) NSString *commonName;
@property (strong) NSMutableString *url;
@property (strong) NSMutableDictionary *uriParameters;
@property (strong) NSNumber *cakAccessMask;
@property enum EVECacheStyle cacheStyle;

#pragma mark - Built Object Properties
@property (strong) NSNumber *apiVersion;
@property (strong) EVEDate *lastQueried;
@property (strong) EVEDate *cachedUntil;
@property (strong) EVEError *apiError;

#pragma mark - Object Building Properties
@property (strong) XKSuccessBlock successBlock;
@property (strong) XKFailureBlock failureBlock;
@property (strong) XKURLRequestOperation *requestOperation;
@property (strong) NSMutableArray *objectDescriptors;

-(void)configureObjectBuilder;

-(void)requestOperationSucceededWithObjects:(NSDictionary *)builtObjects
                                      Error:(NSError *)error;

-(void)requestOperationFailedWithError:(NSError *)error;

#pragma mark - Helper Methods for Printing
+(NSString *)cacheStyleToString:(EVECacheStyle)style;

@end
