//
//  XKURLRequestOperation.h
//  EveAPI
//
//  Created by Johnathan Richter on 2/14/14.
//  Copyright (c) 2014 Johnathan Richter. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XMLKit.h"

@interface XKURLRequestOperation : NSOperation <NSURLConnectionDelegate>

@property (strong) NSString *url;
@property (strong) NSDictionary *parameters;
@property (strong) NSArray *objectDescriptors;
@property (strong) XKSuccessBlock successBlock;
@property (strong) XKFailureBlock failureBlock;

-(instancetype)init;

-(instancetype)initWithURL:(NSString *)url
                Parameters:(NSDictionary *)parameters
         ObjectDescriptors:(NSArray *)objectDescriptors
                   UsePOST:(BOOL)usePost
                   Success:(XKSuccessBlock)successBlock
                   Failure:(XKFailureBlock)failureBlock;

+(instancetype)requestWithURL:(NSString *)url
                   Parameters:(NSDictionary *)parameters
            ObjectDescriptors:(NSArray *)objectDescriptors
                      UsePOST:(BOOL)usePost
                      Success:(XKSuccessBlock)successBlock
                      Failure:(XKFailureBlock)failureBlock;

-(void)startRequest;

@end
