//
//  EVEEmploymentHistory.m
//  EveAPI
//
//  Created by Johnathan Richter on 11/30/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import "EVEEmploymentHistoryRecord.h"

@interface EVEEmploymentHistoryRecord ()

@end

@implementation EVEEmploymentHistoryRecord

#pragma mark - Instance Methods

-(instancetype)init
{
   self = [super init];
   if (self)
   {
      // Initialize XML Variables
      self.recordId = @0;
      self.corporationId = @0;
      self.joinDate = [EVEDate new];
   }
   
   return self;
}

-(void)configureObjectDescriptor
{
   [self.objectDescriptor setObjectClass:[self class]];
   [self.objectDescriptor setObjectAttributeProperties:@{@"recordID":@"recordId",
                                                         @"corporationID":@"corporationId",
                                                         @"startDate":@"joinDate"}];
}

-(NSString *)description
{
   return [NSString stringWithFormat:@"Employment Record for Corporation ID: %@ | "
                                     @"Join Date: %@",
                                     self.corporationId, self.joinDate];
}

#pragma mark - Private Instance Methods

#pragma mark - KVC Attribute and To-One Compliance Methods

-(void)setNilValueForKey:(NSString *)key
{
   if([key isEqualToString:@"recordId"])
   {
      self.recordId = @0;
   }
   else if([key isEqualToString:@"corporationId"])
   {
      self.corporationId = @0;
   }
   else if([key isEqualToString:@"joinDate"])
   {
      self.joinDate = [EVEDate new];
   }
}

@end
