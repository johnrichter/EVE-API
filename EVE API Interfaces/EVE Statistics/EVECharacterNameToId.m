//
//  EVECharacterNameToId.m
//  EveAPI
//
//  Created by Johnathan Richter on 12/1/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import "EVECharacterNameToId.h"
#import "EVECharacter.h"

@interface EVECharacterNameToId ()

@property (strong) NSMutableArray *namesToQuery;
@property unsigned int maxNamesPerCall;

-(BOOL)didQueryMoreNames;
-(NSString *)createNextNameBatchToQuery;

@end

@implementation EVECharacterNameToId

#pragma mark - Instance Methods
-(instancetype)initWithNames:(NSArray *)names
{
   self = [super init];
   if (self)
   {
      // Common API Properties
      self.commonName = @"Character Name to ID";
      [self.url appendString:@"eve/CharacterID.xml.aspx"];
      
      self.cakAccessMask = @0;
      self.cacheStyle = kModifiedShortCache;
      
      // Built Object Properties
      self.characters = @[];
      
      // Instance Properties
      self.maxNamesPerCall = 250;
      self.names = [names copy];
      self.namesToQuery = [NSMutableArray arrayWithArray:self.names];
      
      // Add the batch to the URL
      [self.urlParameters addEntriesFromDictionary:@{@"names":[self createNextNameBatchToQuery]}];
   }
   
   return self;
}

-(NSString *)createNextNameBatchToQuery
{
   //
   // Restrict each request to the max entries allowed per API call.
   //
   
   NSMutableArray *nextNameBatchToQuery = [NSMutableArray new];
   if ([self.namesToQuery count] > self.maxNamesPerCall)
   {
      for (unsigned int index = 0; index < self.maxNamesPerCall; ++index)
      {
         [nextNameBatchToQuery addObject:self.namesToQuery[index]];
      }
   }
   else
   {
      [nextNameBatchToQuery addObjectsFromArray:self.namesToQuery];
   }
   
   // Remove the next batch from our idsToQuery list
   [self.namesToQuery removeObjectsInArray:nextNameBatchToQuery];
   
   // Return a string of all typeIds separated by a comma
   return [nextNameBatchToQuery componentsJoinedByString:@","];
}

-(BOOL)didQueryMoreNames
{
   if([self.namesToQuery count] == 0)
   {
      return NO;
   }
   
   self.urlParameters[@"ids"] = [self createNextNameBatchToQuery];
   
#ifdef DEBUG
   NSLog(@"Retrieving more type names.");
#endif
   
   // Asynchronously fetch the next batch of type names
   [self performRequest];
   
   return YES;
}

/*
 * Subclass must call this parent class function
 */
-(void)configureObjectDescriptors
{
   [super configureObjectDescriptors];
   
   //
   // Configure all of the object descriptors required to process this API
   //
   
   XKObjectDescriptor *character = [[EVECharacter new] objectDescriptor];
   [character setElementName:@"row"];
   
   //
   // Add the descriptors to our collection
   //
   
   [self.objectDescriptors addObjectsFromArray:@[character]];
}

/*
 * Subclass must call this parent class function
 */
-(void)requestOperationSucceededWithObjects:(NSDictionary *)builtObjects
                                      Error:(NSError *)error
{
   // Call our base class function to handle any inherited built objects
   [super requestOperationSucceededWithObjects:builtObjects Error:error];
   
   for (NSString *objectClass in builtObjects)
   {
      if (NSClassFromString(objectClass) == [EVECharacter class])
      {
         NSMutableArray *characters = [NSMutableArray new];
         for (EVECharacter *character in builtObjects[objectClass])
         {
            [characters addObject:character];
         }
         self.characters = [NSArray arrayWithArray:characters];
      }
   }
   
   // If we didn't query more names then we are done
   if (![self didQueryMoreNames])
   {
      [[NSNotificationCenter defaultCenter] postNotificationName:NSStringFromClass([self class])
                                                          object:nil
                                                        userInfo:nil];
   }
}

/*
 * Subclass must call this parent class function
 */
-(void)requestOperationFailedWithError:(NSError *)error;
{
   [super requestOperationFailedWithError:error];
   
   [[NSNotificationCenter defaultCenter] postNotificationName:NSStringFromClass([self class])
                                                       object:nil
                                                     userInfo:@{@"error":error}];
}

-(NSString *)description
{
   NSMutableString *str = [NSMutableString stringWithFormat:
                           @"%@ - Version %@\n\n"
                           @"URL:\t\t\t\t\t\t%@\n"
                           @"CAK Access Mask Required:\t%@\n"
                           @"Date Last Queried:\t\t\t%@\n"
                           @"Cached Until:\t\t\t\t%@\n"
                           @"Cache Style:\t\t\t\t%@\n"
                           @"API Error:\t\t\t\t\t%@\n\n",
                           self.commonName,
                           self.apiVersion,
                           self.url,
                           self.cakAccessMask,
                           self.lastQueried,
                           self.cachedUntil,
                           [EVEApiObject cacheStyleToString:self.cacheStyle],
                           self.apiError];
   
   for (EVECharacter *character in self.characters)
   {
      [str appendFormat:@"%@\n", character];
   }
   
   return [NSString stringWithString:str];
}

@end
