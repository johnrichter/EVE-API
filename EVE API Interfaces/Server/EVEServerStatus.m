//
//  EVEServerStatus.m
//  EveAPI
//
//  Created by Johnathan Richter on 10/3/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import "EVEServerStatus.h"
#import "EVEApiObject.h"

@interface EVEServerStatus ()

@end

@implementation EVEServerStatus

#pragma mark - Instance Methods

-(instancetype)init;
{
   self = [super init];
   if (self)
   {
      // Common API Properties
      self.commonName = @"Server Status";
      [self.url appendString:@"server/ServerStatus.xml.aspx"];

      self.cakAccessMask = @0;
      self.cacheStyle = kShortCache;
      
      // Built Object Properties
      self.isServerOnline = NO;
      self.playersOnline = @0;
   }
   
   return self;
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
   
   XKObjectDescriptor *serverState = [[EVEServerState new] objectDescriptor];
   [serverState setElementName:@"serverOpen"];
   
   XKObjectDescriptor *playersOnline = [[EVEPlayersOnline new] objectDescriptor];
   [playersOnline setElementName:@"onlinePlayers"];
   
   //
   // Add the descriptors to our collection
   //
   
   [self.objectDescriptors addObjectsFromArray:@[serverState, playersOnline]];
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
      if (NSClassFromString(objectClass) == [EVEServerState class])
      {
         for (EVEServerState *serverState in builtObjects[objectClass])
         {
            self.isServerOnline = serverState.isOnline;
         }
      }
      else if (NSClassFromString(objectClass) == [EVEPlayersOnline class])
      {
         for (EVEPlayersOnline *playersOnline in builtObjects[objectClass])
         {
            self.playersOnline = playersOnline.playerCount;
         }
      }
   }
   
   [[NSNotificationCenter defaultCenter] postNotificationName:NSStringFromClass([self class])
                                                       object:nil
                                                     userInfo:nil];
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
                           @"API Error:\t\t\t\t\t%@\n\n"
                           @"Is Server Online: %s\n"
                           @"Players Online: %@\n",
                           self.commonName,
                           self.apiVersion,
                           self.url,
                           self.cakAccessMask,
                           self.lastQueried,
                           self.cachedUntil,
                           [EVEApiObject cacheStyleToString:self.cacheStyle],
                           self.apiError,
                           self.isServerOnline ? "Yes":"No",
                           self.playersOnline];
   
   return [NSString stringWithString:str];
}

@end
