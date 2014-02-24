//
//  EVECharacterInfo.m
//  EveAPI
//
//  Created by Johnathan Richter on 10/3/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import "EVECharacterInfo.h"

#import "EVECharacterId.h"
#import "EVECharacterName.h"
#import "EVERace.h"
#import "EVEBloodLine.h"
#import "EVEWalletBalance.h"
#import "EVECloneSkillPoints.h"
#import "EVESkillInTraningEnds.h"
#import "EVEShipName.h"
#import "EVEShipTypeId.h"
#import "EVEShipTypeName.h"
#import "EVECorporationId.h"
#import "EVECorporationName.h"
#import "EVECorporationJoinDate.h"
#import "EVEAllianceId.h"
#import "EVEAllianceName.h"
#import "EVEAllianceJoinDate.h"
#import "EVELastKnownLocation.h"
#import "EVESecurityStatus.h"
#import "EVEEmploymentHistoryRecord.h"

@interface EVECharacterInfo ()

@end

@implementation EVECharacterInfo

#pragma mark - Instance Methods

-(instancetype)initWithCharacterId:(NSNumber *)characterId
{
   self = [super init];
   if (self)
   {
      // Common API Properties
      self.commonName = @"Character Info";
      [self.url appendString:@"eve/CharacterInfo.xml.aspx"];
      [self.urlParameters addEntriesFromDictionary:@{@"characterID":[characterId stringValue]}];
      
      self.cakAccessMask = @0;
      self.cacheStyle = kShortCache;
      
      // Built Object Properties
      self.characterId = @0;
      self.characterName = @"";
      self.race = @"";
      self.bloodline = @"";
      self.walletBalance = @0;
      self.skillpoints = @0;
      self.skillInTraningEndDate = [NSDate new];
      self.shipName = @"";
      self.shipTypeId = @0;
      self.shipTypeName = @"";
      self.corporationId = @0;
      self.corporationName = @"";
      self.corporationJoinDate = [NSDate new];
      self.allianceId = @0;
      self.allianceName = @"";
      self.allianceJoinDate = [NSDate new];
      self.lastKnownLocation = @"";
      self.securityStatus = @0;
      self.employmentHistory = @[];
      
      // Instance Properties
      self.keyId = @"";
      self.vCode = @"";
      self.charId = characterId;
   }
   
   return self;
}

-(instancetype)initWithEveKeyId:(NSString *)keyId
                          VCode:(NSString *)vCode
                    CharacterId:(NSNumber *)characterId
{
   self = [super init];
   if (self)
   {
      // Common API Properties
      self.commonName = @"Character Info";
      [self.url appendString:@"eve/CharacterInfo.xml.aspx"];
      [self.urlParameters addEntriesFromDictionary:@{@"keyID":keyId,
                                                     @"vCode":vCode,
                                                     @"characterID":[characterId stringValue]}];
      self.cakAccessMask = @16777216; // Public --> @8388608
      self.cacheStyle = kShortCache;
      
      // Built Object Properties
      self.characterId = @0;
      self.characterName = @"";
      self.race = @"";
      self.bloodline = @"";
      self.walletBalance = @0;
      self.skillpoints = @0;
      self.skillInTraningEndDate = [NSDate new];
      self.shipName = @"";
      self.shipTypeId = @0;
      self.shipTypeName = @"";
      self.corporationId = @0;
      self.corporationName = @"";
      self.corporationJoinDate = [NSDate new];
      self.allianceId = @0;
      self.allianceName = @"";
      self.allianceJoinDate = [NSDate new];
      self.lastKnownLocation = @"";
      self.securityStatus = @0;
      self.employmentHistory = @[];
      
      // Instance Properties
      self.keyId = keyId;
      self.vCode = vCode;
      self.characterId = characterId;
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
   
   XKObjectDescriptor *charId = [[EVECharacterId new] objectDescriptor];
   [charId setElementName:@"characterID"];
   
   XKObjectDescriptor *charName = [[EVECharacterName new] objectDescriptor];
   [charName setElementName:@"characterName"];
   
   XKObjectDescriptor *race = [[EVERace new] objectDescriptor];
   [race setElementName:@"race"];
   
   XKObjectDescriptor *bloodline = [[EVEBloodLine new] objectDescriptor];
   [bloodline setElementName:@"bloodline"];
   
   XKObjectDescriptor *walletBalance = [[EVEWalletBalance new] objectDescriptor];
   [walletBalance setElementName:@"accountBalance"];
   
   XKObjectDescriptor *skillpoints = [[EVECloneSkillPoints new] objectDescriptor];
   [skillpoints setElementName:@"skillPoints"];
   
   XKObjectDescriptor *skillEndDate = [[EVESkillInTraningEnds new] objectDescriptor];
   [skillEndDate setElementName:@"nextTrainingEnds"];
   
   XKObjectDescriptor *shipName = [[EVEShipName new] objectDescriptor];
   [shipName setElementName:@"shipName"];
   
   XKObjectDescriptor *shipTypeId = [[EVEShipTypeId new] objectDescriptor];
   [shipTypeId setElementName:@"shipTypeID"];
   
   XKObjectDescriptor *shipTypeName = [[EVEShipTypeName new] objectDescriptor];
   [shipTypeName setElementName:@"shipTypeName"];
   
   XKObjectDescriptor *corpId = [[EVECorporationId new] objectDescriptor];
   [corpId setElementName:@"corporationID"];
   
   XKObjectDescriptor *corpName = [[EVECorporationName new] objectDescriptor];
   [corpName setElementName:@"corporation"];
   
   XKObjectDescriptor *corpJoinDate = [[EVECorporationJoinDate new] objectDescriptor];
   [corpJoinDate setElementName:@"corporationDate"];
   
   XKObjectDescriptor *allianceId = [[EVEAllianceId new] objectDescriptor];
   [allianceId setElementName:@"allianceID"];
   
   XKObjectDescriptor *allianceName = [[EVEAllianceName new] objectDescriptor];
   [allianceName setElementName:@"alliance"];
   
   XKObjectDescriptor *allianceJoinDate = [[EVEAllianceJoinDate new] objectDescriptor];
   [allianceJoinDate setElementName:@"allianceDate"];
   
   XKObjectDescriptor *lastKnownLocation = [[EVELastKnownLocation new] objectDescriptor];
   [lastKnownLocation setElementName:@"lastKnownLocation"];
   
   XKObjectDescriptor *securityStatus = [[EVESecurityStatus new] objectDescriptor];
   [securityStatus setElementName:@"securityStatus"];
   
   XKObjectDescriptor *employmentRecord = [[EVEEmploymentHistoryRecord new] objectDescriptor];
   [employmentRecord setElementName:@"row"];
   // employment history relationship?!
   
   //
   // Add the descriptors to our collection
   //
   
   [self.objectDescriptors addObjectsFromArray:@[charId, charName, race, bloodline,
                                                 walletBalance, skillpoints, skillEndDate,
                                                 shipName, shipTypeId, shipTypeName,
                                                 corpId, corpName, corpJoinDate,
                                                 allianceId, allianceName, allianceJoinDate,
                                                 lastKnownLocation, securityStatus,
                                                 employmentRecord]];
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
      if (NSClassFromString(objectClass) == [EVECharacterId class])
      {
         for (EVECharacterId *charId in builtObjects[objectClass])
         {
            self.characterId = charId.characterId;
         }
      }
      else if (NSClassFromString(objectClass) == [EVECharacterName class])
      {
         for (EVECharacterName *charName in builtObjects[objectClass])
         {
            self.characterName = charName.name;
         }
      }
      else if (NSClassFromString(objectClass) == [EVERace class])
      {
         for (EVERace *race in builtObjects[objectClass])
         {
            self.race = race.race;
         }
      }
      else if (NSClassFromString(objectClass) == [EVEBloodLine class])
      {
         for (EVEBloodLine *bloodline in builtObjects[objectClass])
         {
            self.bloodline = bloodline.bloodLine;
         }
      }
      else if (NSClassFromString(objectClass) == [EVEWalletBalance class])
      {
         for (EVEWalletBalance *walletBalance in builtObjects[objectClass])
         {
            self.walletBalance = walletBalance.walletBalance;
         }
      }
      else if (NSClassFromString(objectClass) == [EVECloneSkillPoints class])
      {
         for (EVECloneSkillPoints *skillpoints in builtObjects[objectClass])
         {
            self.skillpoints = skillpoints.skillPoints;
         }
      }
      else if (NSClassFromString(objectClass) == [EVESkillInTraningEnds class])
      {
         for (EVESkillInTraningEnds *skillTrainingEnds in builtObjects[objectClass])
         {
            self.skillInTraningEndDate = skillTrainingEnds.date;
         }
      }
      else if (NSClassFromString(objectClass) == [EVEShipName class])
      {
         for (EVEShipName *shipName in builtObjects[objectClass])
         {
            self.shipName = shipName.string;
         }
      }
      else if (NSClassFromString(objectClass) == [EVEShipTypeId class])
      {
         for (EVEShipTypeId *shipTypeId in builtObjects[objectClass])
         {
            self.shipTypeId = shipTypeId.number;
         }
      }
      else if (NSClassFromString(objectClass) == [EVEShipTypeName class])
      {
         for (EVEShipTypeName *shipTypeName in builtObjects[objectClass])
         {
            self.shipTypeName = shipTypeName.string;
         }
      }
      else if (NSClassFromString(objectClass) == [EVECorporationId class])
      {
         for (EVECorporationId *corpId in builtObjects[objectClass])
         {
            self.corporationId = corpId.corporationId;
         }
      }
      else if (NSClassFromString(objectClass) == [EVECorporationName class])
      {
         for (EVECorporationName *corpName in builtObjects[objectClass])
         {
            self.corporationName = corpName.name;
         }
      }
      else if (NSClassFromString(objectClass) == [EVECorporationJoinDate class])
      {
         for (EVECorporationJoinDate *corpJoinDate in builtObjects[objectClass])
         {
            self.corporationJoinDate = corpJoinDate.date;
         }
      }
      else if (NSClassFromString(objectClass) == [EVEAllianceId class])
      {
         for (EVEAllianceId *allianceId in builtObjects[objectClass])
         {
            self.allianceId = allianceId.allianceId;
         }
      }
      else if (NSClassFromString(objectClass) == [EVEAllianceName class])
      {
         for (EVEAllianceName *allianceName in builtObjects[objectClass])
         {
            self.allianceName = allianceName.name;
         }
      }
      else if (NSClassFromString(objectClass) == [EVEAllianceJoinDate class])
      {
         for (EVEAllianceJoinDate *allianceJoinDate in builtObjects[objectClass])
         {
            self.allianceJoinDate = allianceJoinDate.date;
         }
      }
      else if (NSClassFromString(objectClass) == [EVELastKnownLocation class])
      {
         for (EVELastKnownLocation *lastKnownLocation in builtObjects[objectClass])
         {
            self.lastKnownLocation = lastKnownLocation.string;
         }
      }
      else if (NSClassFromString(objectClass) == [EVESecurityStatus class])
      {
         for (EVESecurityStatus *securityStatus in builtObjects[objectClass])
         {
            self.securityStatus = securityStatus.number;
         }
      }
      else if (NSClassFromString(objectClass) == [EVEEmploymentHistoryRecord class])
      {
         NSMutableOrderedSet *records = [NSMutableOrderedSet new];
         for (EVEEmploymentHistoryRecord *record in builtObjects[objectClass])
         {
            [records addObject:record];
         }
         
         // Sort the employment history properly
         NSSortDescriptor *sortDesc = [[NSSortDescriptor alloc] initWithKey:@"joinDate"
                                                                  ascending:NO];
         
         self.employmentHistory = [records sortedArrayUsingDescriptors:@[sortDesc]];
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
                           @"API Error:\t\t\t\t\t%@\n\n",
                           self.commonName,
                           self.apiVersion,
                           self.url,
                           self.cakAccessMask,
                           self.lastQueried,
                           self.cachedUntil,
                           [EVEApiObject cacheStyleToString:self.cacheStyle],
                           self.apiError];
   
   [str appendFormat:@"Character ID: %@\n"
                     @"Character Name: %@\n"
                     @"Race: %@\n"
                     @"Bloodline: %@\n"
                     @"Wallet Balance: %@\n"
                     @"Skillpoints: %@\n"
                     @"Current Skill Finish Date: %@\n"
                     @"Ship Name: %@\n"
                     @"Ship Type ID: %@\n"
                     @"Ship Type Name: %@\n"
                     @"Corporation ID: %@\n"
                     @"Corporation Name: %@\n"
                     @"Corporation Join Date: %@\n"
                     @"Alliance ID: %@\n"
                     @"Alliance Name: %@\n"
                     @"Alliance Join Date: %@\n"
                     @"Last Known Location: %@\n"
                     @"Security Status: %@\n",
                     self.characterId, self.characterName, self.race, self.bloodline,
                     self.walletBalance, self.skillpoints, self.skillInTraningEndDate,
                     self.shipName, self.shipTypeId, self.shipTypeName,
                     self.corporationId, self.corporationName, self.corporationJoinDate,
                     self.allianceId, self.allianceName, self.allianceJoinDate,
                     self.lastKnownLocation, self.securityStatus];
   
   for (EVEEmploymentHistoryRecord *record in self.employmentHistory)
   {
      [str appendFormat:@"%@\n", record];
   }
   
   return [NSString stringWithString:str];
}

@end
