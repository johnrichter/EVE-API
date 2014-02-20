//
//  XMLKitErrors.h
//  EveAPI
//
//  Created by Johnathan Richter on 2/8/14.
//  Copyright (c) 2014 Johnathan Richter. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSString *const XKErrorDomain;

NS_ENUM(NSInteger, XKObjectBuilderErrors)
{
   kXKObjectBuilderErrorMissingParameters       = -1000,
   kXKObjectBuilderErrorXMLDataNotFound         = -1001,
   kXKObjectBuilderErrorImproperXMLMapStructure = -1002,
   kXKObjectBuilderErrorNonUniqueDescriptorList = -1003
};

NS_ENUM(NSInteger, XKURLRequestOperationErrors)
{
   kXKURLRequestOperationErrorMissingObjectDescriptors  = -1100,
   kXKURLRequestOperationErrorInvalidURL                = -1101,
   kXKURLRequestOperationErrorURLEncode                 = -1102
};
