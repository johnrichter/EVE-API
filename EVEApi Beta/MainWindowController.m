//
//  MainWindowController.m
//  EveAPI
//
//  Created by Johnathan Richter on 10/13/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import "MainWindowController.h"

@interface MainWindowController ()

@end

@implementation MainWindowController

- (id)initWithWindow:(NSWindow *)window
{
   self = [super initWithWindow:window];
   if (self)
   {
      // Character APIs
//      [[NSNotificationCenter defaultCenter] addObserver:self
//                                             selector:@selector(EVEApiKeyInformationDidLoad:)
//                                                 name:NSStringFromClass([EVEApiKeyInformation class])
//                                               object:nil];

      [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(EVEAccountStatusDidLoad:)
                                                 name:NSStringFromClass([EVEAccountStatus class])
                                               object:nil];

      [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(EVEAccountCharactersDidLoad:)
                                                 name:NSStringFromClass([EVEAccountCharacters class])
                                               object:nil];

//      [[NSNotificationCenter defaultCenter] addObserver:self
//                                             selector:@selector(EVEAccountBalanceDidLoad:)
//                                                 name:NSStringFromClass([EVEAccountBalance class])
//                                               object:nil];
//
//      [[NSNotificationCenter defaultCenter] addObserver:self
//                                               selector:@selector(EVEAssetListDidLoad:)
//                                                   name:NSStringFromClass([EVEAssetList class])
//                                                 object:nil];
//      
//      [[NSNotificationCenter defaultCenter] addObserver:self
//                                               selector:@selector(EVEUpcomingCalendarEventsDidLoad:)
//                                                   name:NSStringFromClass([EVEUpcomingCalendarEvents class])
//                                                 object:nil];
//      
//      [[NSNotificationCenter defaultCenter] addObserver:self
//                                               selector:@selector(EVECalendarEventAttendeesDidLoad:)
//                                                   name:NSStringFromClass([EVECalendarEventAttendees class])
//                                                 object:nil];
//      
//      [[NSNotificationCenter defaultCenter] addObserver:self
//                                               selector:@selector(EVECharacterSheetDidLoad:)
//                                                   name:NSStringFromClass([EVECharacterSheet class])
//                                                 object:nil];
//      
//      [[NSNotificationCenter defaultCenter] addObserver:self
//                                               selector:@selector(EVEContactListDidLoad:)
//                                                   name:NSStringFromClass([EVEContactList class])
//                                                 object:nil];
//      
//      [[NSNotificationCenter defaultCenter] addObserver:self
//                                               selector:@selector(EVEContactNotificationsDidLoad:)
//                                                   name:NSStringFromClass([EVEContactNotifications class])
//                                                 object:nil];
//      
//      [[NSNotificationCenter defaultCenter] addObserver:self
//                                               selector:@selector(EVEContractsDidLoad:)
//                                                   name:NSStringFromClass([EVEContracts class])
//                                                 object:nil];
//      
//      [[NSNotificationCenter defaultCenter] addObserver:self
//                                               selector:@selector(EVEContractItemsDidLoad:)
//                                                   name:NSStringFromClass([EVEContractItems class])
//                                                 object:nil];
//      
//      [[NSNotificationCenter defaultCenter] addObserver:self
//                                               selector:@selector(EVEContractBidsDidLoad:)
//                                                   name:NSStringFromClass([EVEContractBids class])
//                                                 object:nil];
//      
//      [[NSNotificationCenter defaultCenter] addObserver:self
//                                               selector:@selector(EVEFactionalWarfareStatsDidLoad:)
//                                                   name:NSStringFromClass([EVEFactionalWarfareStats class])
//                                                 object:nil];
//      
//      [[NSNotificationCenter defaultCenter] addObserver:self
//                                               selector:@selector(EVEIndustryJobsDidLoad:)
//                                                   name:NSStringFromClass([EVEIndustryJobs class])
//                                                 object:nil];
//      
//      [[NSNotificationCenter defaultCenter] addObserver:self
//                                               selector:@selector(EVEKillLogDidLoad:)
//                                                   name:NSStringFromClass([EVEKillLog class])
//                                                 object:nil];
//      
//      [[NSNotificationCenter defaultCenter] addObserver:self
//                                               selector:@selector(EVELocationsDidLoad:)
//                                                   name:NSStringFromClass([EVELocations class])
//                                                 object:nil];
//      
//      [[NSNotificationCenter defaultCenter] addObserver:self
//                                               selector:@selector(EVEMailBodiesDidLoad:)
//                                                   name:NSStringFromClass([EVEMailBodies class])
//                                                 object:nil];
//      
//      [[NSNotificationCenter defaultCenter] addObserver:self
//                                               selector:@selector(EVEMailMessagesDidLoad:)
//                                                   name:NSStringFromClass([EVEMailMessages class])
//                                                 object:nil];
//      
//      [[NSNotificationCenter defaultCenter] addObserver:self
//                                               selector:@selector(EVEMailingListsDidLoad:)
//                                                   name:NSStringFromClass([EVEMailingLists class])
//                                                 object:nil];
//      
//      [[NSNotificationCenter defaultCenter] addObserver:self
//                                               selector:@selector(EVEMarketOrdersDidLoad:)
//                                                   name:NSStringFromClass([EVEMarketOrders class])
//                                                 object:nil];
//      
//      [[NSNotificationCenter defaultCenter] addObserver:self
//                                               selector:@selector(EVEMedalsDidLoad:)
//                                                   name:NSStringFromClass([EVEMedals class])
//                                                 object:nil];
//      
//      [[NSNotificationCenter defaultCenter] addObserver:self
//                                               selector:@selector(EVENotificationsDidLoad:)
//                                                   name:NSStringFromClass([EVENotifications class])
//                                                 object:nil];
//      
//      [[NSNotificationCenter defaultCenter] addObserver:self
//                                               selector:@selector(EVENotificationTextsDidLoad:)
//                                                   name:NSStringFromClass([EVENotificationTexts class])
//                                                 object:nil];
//      
//      [[NSNotificationCenter defaultCenter] addObserver:self
//                                               selector:@selector(EVEResearchDidLoad:)
//                                                   name:NSStringFromClass([EVEResearch class])
//                                                 object:nil];
//      
//      [[NSNotificationCenter defaultCenter] addObserver:self
//                                               selector:@selector(EVESkillInTrainingDidLoad:)
//                                                   name:NSStringFromClass([EVESkillInTraining class])
//                                                 object:nil];
//      
//      [[NSNotificationCenter defaultCenter] addObserver:self
//                                               selector:@selector(EVESkillQueueDidLoad:)
//                                                   name:NSStringFromClass([EVESkillQueue class])
//                                                 object:nil];
//      
//      [[NSNotificationCenter defaultCenter] addObserver:self
//                                               selector:@selector(EVEStandingsDidLoad:)
//                                                   name:NSStringFromClass([EVEStandings class])
//                                                 object:nil];
//      
//      [[NSNotificationCenter defaultCenter] addObserver:self
//                                               selector:@selector(EVEWalletJournalDidLoad:)
//                                                   name:NSStringFromClass([EVEWalletJournal class])
//                                                 object:nil];
//      
//      [[NSNotificationCenter defaultCenter] addObserver:self
//                                               selector:@selector(EVEWalletTransactionsDidLoad:)
//                                                   name:NSStringFromClass([EVEWalletTransactions class])
//                                                 object:nil];
//      
//      // Character/Corporation APIs
//      
//      // Corporation APIs
//      
//      // EVE Global APIs
//      [[NSNotificationCenter defaultCenter] addObserver:self
//                                               selector:@selector(EVEAllianceListDidLoad:)
//                                                   name:NSStringFromClass([EVEAllianceList class])
//                                                 object:nil];
//      
//      [[NSNotificationCenter defaultCenter] addObserver:self
//                                               selector:@selector(EVECharacterNameToIdDidLoad:)
//                                                   name:NSStringFromClass([EVECharacterNameToId class])
//                                                 object:nil];
//      
//      [[NSNotificationCenter defaultCenter] addObserver:self
//                                               selector:@selector(EVECharacterIdToNameDidLoad:)
//                                                   name:NSStringFromClass([EVECharacterIdToName class])
//                                                 object:nil];
//      
//      [[NSNotificationCenter defaultCenter] addObserver:self
//                                               selector:@selector(EVECharacterInfoDidLoad:)
//                                                   name:NSStringFromClass([EVECharacterInfo class])
//                                                 object:nil];
//      
//      [[NSNotificationCenter defaultCenter] addObserver:self
//                                               selector:@selector(EVEConquerableStationListDidLoad:)
//                                                   name:NSStringFromClass([EVEConquerableStationList class])
//                                                 object:nil];
//      
//      [[NSNotificationCenter defaultCenter] addObserver:self
//                                               selector:@selector(EVEFactionalWarfareGlobalStatsDidLoad:)
//                                                   name:NSStringFromClass([EVEFactionalWarfareGlobalStats class])
//                                                 object:nil];
//      
//      [[NSNotificationCenter defaultCenter] addObserver:self
//                                               selector:@selector(EVEFactionalWarfareTopStatsDidLoad:)
//                                                   name:NSStringFromClass([EVEFactionalWarfareTopStats class])
//                                                 object:nil];
//      
//      [[NSNotificationCenter defaultCenter] addObserver:self
//                                               selector:@selector(EVESkillTreeDidLoad:)
//                                                   name:NSStringFromClass([EVESkillTree class])
//                                                 object:nil];
//      
//      [[NSNotificationCenter defaultCenter] addObserver:self
//                                               selector:@selector(EVEReferenceTypesDidLoad:)
//                                                   name:NSStringFromClass([EVEReferenceTypes class])
//                                                 object:nil];
//      
//      [[NSNotificationCenter defaultCenter] addObserver:self
//                                               selector:@selector(EVETypeNameDidLoad:)
//                                                   name:NSStringFromClass([EVETypeName class])
//                                                 object:nil];
//      
//      // Map APIs
//      [[NSNotificationCenter defaultCenter] addObserver:self
//                                               selector:@selector(EVESovereigntyDidLoad:)
//                                                   name:NSStringFromClass([EVESovereignty class])
//                                                 object:nil];
//      
//      [[NSNotificationCenter defaultCenter] addObserver:self
//                                               selector:@selector(EVEKillsDidLoad:)
//                                                   name:NSStringFromClass([EVEKills class])
//                                                 object:nil];
//      
//      [[NSNotificationCenter defaultCenter] addObserver:self
//                                               selector:@selector(EVEJumpsDidLoad:)
//                                                   name:NSStringFromClass([EVEJumps class])
//                                                 object:nil];
//      
//      [[NSNotificationCenter defaultCenter] addObserver:self
//                                               selector:@selector(EVEFactionalWarfareSystemsDidLoad:)
//                                                   name:NSStringFromClass([EVEFactionalWarfareSystems class])
//                                                 object:nil];
//      
//      // Server APIs
//      [[NSNotificationCenter defaultCenter] addObserver:self
//                                               selector:@selector(EVEServerStatusDidLoad:)
//                                                   name:NSStringFromClass([EVEServerStatus class])
//                                                 object:nil];
//      
//      [[NSNotificationCenter defaultCenter] addObserver:self
//                                               selector:@selector(EVECallListDidLoad:)
//                                                   name:NSStringFromClass([EVECallList class])
//                                                 object:nil];
   }
   
   return self;
}

- (void)windowDidLoad
{
   [super windowDidLoad];
    
   // Implement this method to handle any initialization after your window controller's
   // window has been loaded from its nib file.

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wunused-variable"

   NSString *legacyUserId = @"8695857";
   NSString *legacyLimitedKey = @"F0AD3EC9275C4FE38A90F191FA2B223AF66C79FAF2CF45828340EC5D0E62220E";
   NSString *legacyFullKey = @"7D345E16FC2441309723B9B51768CB0F2DDF9A5D43A74CBFAB7567299F5A306C";
   
   NSString *keyId = @"2696384";
   NSString *vCode = @"4fVh21rc3MtNvraRk4CwtGiuZc6zmMY0JYIxEayjmzH4hkqTVzdyRrDLvDEBEZlk";
   NSString *corpKeyId = @"2594606";
   NSString *corpVCode = @"nei3DTwGZuKmuN8k37ZbwiQB3IuRzuhclmHnTbfKwKMsPMrPb18S3oM6Vq5aurZH";
   NSNumber *minosId = @91779534;
   NSNumber *minosEvent = @0;
   NSNumber *minosContractId = @74186293;
   NSArray *minosItems = @[@1010763044490, @1010755814428];
   NSArray *minosMailIds = @[@1234567, @9876543, @326802133, @330432459];
   NSArray *minosNotificationIds = @[@1234567, @9876543, @440205911, @440203872];
   NSNumber *minosWalletId = @1000;
   
   NSString *mdeKeyId = @"734499";
   NSString *mdeVCode = @"rnKgT0CsBodEiQXJsxVXE60taTXwyxTLgCuIDv2Vo22HIRTeNWhOX0RCj4TMcI68";
   NSNumber *mdeId = @153571845;
   
   NSNumber *agentShadeId = @92323562;
   
   NSMutableArray *typeIds = [NSMutableArray new];
   for (unsigned int num = 0; num < 1000; ++num)
   {
      NSNumber *number = [NSNumber numberWithUnsignedInt:num];
      [typeIds addObject:[number stringValue]];
   }
   
#pragma clang diagnostic pop
   
   // ------------------------------------------------------------------------------------
   // Character APIs
//   self.apiKeyInfo = [[EVEApiKeyInformation alloc] initWithEveKeyId:keyId VCode:vCode];
//   
//   //[self.apiKeyInfo queryTheApi];
   
   self.accountStatus = [[EVEAccountStatus alloc] initWithEveKeyId:keyId VCode:vCode];
   [self.accountStatus performRequest];
   
   self.accountCharacters = [[EVEAccountCharacters alloc] initWithEveKeyId:keyId
                                                                     VCode:vCode];
   //[self.accountCharacters performRequest];
   
//   self.accountBalance = [[EVEAccountBalance alloc] initWithEveKeyId:keyId
//                                                               VCode:vCode
//                                                         CharacterId:minosId];
//   //[self.accountBalance queryTheApi];
//   
//   self.assetList = [[EVEAssetList alloc] initWithEveKeyId:keyId
//                                                     VCode:vCode
//                                               CharacterId:minosId];
//   //[self.assetList queryTheApi];
//   
//   self.upcomingEvents = [[EVEUpcomingCalendarEvents alloc] initWithEveKeyId:legacyUserId
//                                                                       VCode:legacyFullKey
//                                                                 CharacterId:minosId];
//   //[self.upcomingEvents queryTheApi];
//   
//   self.eventAttendees = [[EVECalendarEventAttendees alloc] initWithEveKeyId:legacyUserId
//                                                                       VCode:legacyFullKey
//                                                                 CharacterId:minosId
//                                                                     eventID:@0];
//   //[self.eventAttendees queryTheApi];
//   
//   self.characterSheet = [[EVECharacterSheet alloc] initWithEveKeyId:keyId
//                                                               VCode:vCode
//                                                         CharacterId:minosId];
//   //[self.characterSheet queryTheApi];
//   
//   self.contactList = [[EVEContactList alloc] initWithEveKeyId:keyId
//                                                         VCode:vCode
//                                                   CharacterId:minosId];
//   //[self.contactList queryTheApi];
//   
//   self.contactNotifications = [[EVEContactNotifications alloc] initWithEveKeyId:keyId
//                                                                           VCode:vCode
//                                                                     CharacterId:minosId];
//   //[self.contactNotifications queryTheApi];
//   
//   self.characterContracts = [[EVEContracts alloc] initWithEveKeyId:keyId
//                                                              VCode:vCode
//                                                        CharacterId:minosId];
//   //[self.characterContracts queryTheApi];
//   
//   self.contractItems = [[EVEContractItems alloc] initWithEveKeyId:keyId
//                                                             VCode:vCode
//                                                       CharacterId:minosId
//                                                        ContractId:minosContractId];
//   //[self.contractItems queryTheApi];
//   
//   self.contractBids = [[EVEContractBids alloc] initWithEveKeyId:keyId
//                                                           VCode:vCode
//                                                     CharacterId:minosId];
//   //[self.contractBids queryTheApi];
//   
//   self.factionalWarfareStats = [[EVEFactionalWarfareStats alloc] initWithEveKeyId:keyId
//                                                                             VCode:vCode
//                                                                       CharacterId:minosId];
//   //[self.factionalWarfareStats queryTheApi];
//   
//   self.industryJobs = [[EVEIndustryJobs alloc] initWithEveKeyId:keyId
//                                                           VCode:vCode
//                                                     CharacterId:minosId];
//   //[self.industryJobs queryTheApi];
//   
//   self.killLog = [[EVEKillLog alloc] initWithEveKeyId:@"2761762"
//                                                 VCode:@"qXUt2hPC8s8EcU8by43ffDmCUoooTa1gRbxV6h8fXJQeLfs1IztWUH7cTLXOGlrP"
//                                           CharacterId:minosId];
//   //[self.killLog queryTheApi];
//   
//   self.locations = [[EVELocations alloc] initWithEveKeyId:keyId
//                                                     VCode:vCode
//                                               CharacterId:minosId
//                                                   ItemIds:minosItems];
//   //[self.locations queryTheApi];
//   
//   self.mailBodies = [[EVEMailBodies alloc] initWithEveKeyId:keyId
//                                                       VCode:vCode
//                                                 CharacterId:minosId
//                                                     MailIds:minosMailIds];
//   //[self.mailBodies queryTheApi];
//   
//   self.mailMessages = [[EVEMailMessages alloc] initWithEveKeyId:keyId
//                                                           VCode:vCode
//                                                     CharacterId:minosId];
//   //[self.mailMessages queryTheApi];
//   
//   self.mailingLists = [[EVEMailingLists alloc] initWithEveKeyId:keyId
//                                                           VCode:vCode
//                                                     CharacterId:minosId];
//   //[self.mailingLists queryTheApi];
//   
//   self.marketOrders = [[EVEMarketOrders alloc] initWithEveKeyId:keyId
//                                                           VCode:vCode
//                                                     CharacterId:minosId
//                                                         OrderId:nil];
//   //[self.marketOrders queryTheApi];
//   
//   self.medals = [[EVEMedals alloc] initWithEveKeyId:keyId
//                                               VCode:vCode
//                                         CharacterId:minosId];
//   //[self.medals queryTheApi];
//   
//   self.notifications = [[EVENotifications alloc] initWithEveKeyId:keyId
//                                                             VCode:vCode
//                                                       CharacterId:minosId];
//   //[self.notifications queryTheApi];
//   
//   self.notificationTexts = [[EVENotificationTexts alloc] initWithEveKeyId:keyId
//                                                                     VCode:vCode
//                                                               CharacterId:minosId
//                                                           NotificationIds:minosNotificationIds];
//   //[self.notificationTexts queryTheApi];
//   
//   self.research = [[EVEResearch alloc] initWithEveKeyId:keyId
//                                                   VCode:vCode
//                                             CharacterId:minosId];
//   //[self.research queryTheApi];
//   
//   self.skillInTraining = [[EVESkillInTraining alloc] initWithEveKeyId:keyId
//                                                                 VCode:vCode
//                                                           CharacterId:minosId];
//   //[self.skillInTraining queryTheApi];
//   
//   self.skillQueue = [[EVESkillQueue alloc] initWithEveKeyId:mdeKeyId
//                                                       VCode:mdeVCode
//                                                 CharacterId:mdeId];
//   //[self.skillQueue queryTheApi];
//   
//   self.standings = [[EVEStandings alloc] initWithEveKeyId:keyId
//                                                     VCode:vCode
//                                               CharacterId:minosId];
//   //[self.standings queryTheApi];
//   
//   self.walletJournal = [[EVEWalletJournal alloc] initWithEveKeyId:corpKeyId
//                                                             VCode:corpVCode
//                                                       CharacterId:minosId
//                                                          WalletId:@1004];
//   //[self.walletJournal queryTheApi];
//   
//   self.walletTransactions = [[EVEWalletTransactions alloc] initWithEveKeyId:corpKeyId
//                                                                       VCode:corpVCode
//                                                                 CharacterId:minosId
//                                                                    WalletId:@1004];
//   //[self.walletTransactions queryTheApi];
//   
//   // ------------------------------------------------------------------------------------
//   // Character/Corporation APIs
//   
//   // ------------------------------------------------------------------------------------
//   // Corporation APIs
//   
//   // ------------------------------------------------------------------------------------
//   // EVE Global APIs
//   self.allianceList = [EVEAllianceList new];
//   //[self.allianceList queryTheApi];
//   
//   self.charNameToId = [[EVECharacterNameToId alloc] initWithNames:@[@"Minos%20Daedalus",
//                                                                     @"Master%20DarkEnforcer"]];
//   //[self.charNameToId queryTheApi];
//   
//   self.charIdToName = [[EVECharacterIdToName alloc] initWithIds:@[@91779534,
//                                                                   @153571845]];
//   //[self.charIdToName queryTheApi];
//   
//   //self.characterInfo = [[EVECharacterInfo alloc] initWithCharacterId:minosId];
//   self.characterInfo = [[EVECharacterInfo alloc] initWithEveKeyId:keyId
//                                                             VCode:vCode
//                                                       CharacterId:minosId];
//   //[self.characterInfo queryTheApi];
//   
//   self.conquerableStations = [EVEConquerableStationList new];
//   //[self.conquerableStations queryTheApi];
//   
//   self.factionWarGlobalStats = [EVEFactionalWarfareGlobalStats new];
//   //[self.factionWarGlobalStats queryTheApi];
//   
//   self.factionWarTopStats = [EVEFactionalWarfareTopStats new];
//   //[self.factionWarTopStats queryTheApi];
//   
//   self.skillTree = [EVESkillTree new];
//   [self.skillTree queryTheApi];
//   
//   self.typeName = [[EVETypeName alloc] initWithIds:typeIds];
//   //[self.typeName queryTheApi];
//   
//   self.refTypes = [EVEReferenceTypes new];
//   //[self.refTypes queryTheApi];
//   
//   // ------------------------------------------------------------------------------------
//   // Map APIs
//   
//   self.sovereignty = [EVESovereignty new];
//   //[self.sovereignty queryTheApi];
//   
//   self.kills = [EVEKills new];
//   //[self.kills queryTheApi];
//   
//   self.jumps = [EVEJumps new];
//   //[self.jumps queryTheApi];
//   
//   self.facWarSystems = [EVEFactionalWarfareSystems new];
//   //[self.facWarSystems queryTheApi];
//   
//   // ------------------------------------------------------------------------------------
//   // Server APIs
//   
//   self.callList = [EVECallList new];
//   //[self.callList queryTheApi];
//   
//   self.serverStatus = [EVEServerStatus new];
//   //[self.serverStatus queryTheApi];
}

-(void)dealloc
{
   [[NSNotificationCenter defaultCenter] removeObserver:self];
}

//-(void)EVEApiKeyInformationDidLoad:(NSNotification *)notification
//{
//   NSMutableString *newStr = [NSMutableString stringWithString:@"\n"];
//   [newStr appendString:self.xmlTextView.string];
//   [newStr appendFormat:@"%@\n", self.apiKeyInfo];
//   [self.xmlTextView setString:newStr];
//}

-(void)EVEAccountStatusDidLoad:(NSNotification *)notification
{
   NSMutableString *newStr = [NSMutableString stringWithString:@"\n"];
   [newStr appendString:self.xmlTextView.string];
   [newStr appendFormat:@"%@\n", self.accountStatus];
   [self.xmlTextView setString:newStr];
}

-(void)EVEAccountCharactersDidLoad:(NSNotification *)notification
{
   NSMutableString *newStr = [NSMutableString stringWithString:@"\n"];
   [newStr appendString:self.xmlTextView.string];
   [newStr appendFormat:@"%@\n", self.accountCharacters];
   [self.xmlTextView setString:newStr];
}

//-(void)EVEAccountBalanceDidLoad:(NSNotification *)notification
//{
//   NSMutableString *newStr = [NSMutableString stringWithString:@"\n"];
//   [newStr appendString:self.xmlTextView.string];
//   [newStr appendFormat:@"%@\n", self.accountBalance];
//   [self.xmlTextView setString:newStr];
//}
//
//-(void)EVEAssetListDidLoad:(NSNotification *)notification
//{
//   NSMutableString *newStr = [NSMutableString stringWithString:@"\n"];
//   [newStr appendString:self.xmlTextView.string];
//   [newStr appendFormat:@"%@\n", self.assetList];
//   [self.xmlTextView setString:newStr];
//}
//
//-(void)EVEUpcomingCalendarEventsDidLoad:(NSNotification *)notification
//{
//   NSMutableString *newStr = [NSMutableString stringWithString:@"\n"];
//   [newStr appendString:self.xmlTextView.string];
//   [newStr appendFormat:@"%@\n", self.upcomingEvents];
//   [self.xmlTextView setString:newStr];
//}
//
//-(void)EVECalendarEventAttendeesDidLoad:(NSNotification *)notification
//{
//   NSMutableString *newStr = [NSMutableString stringWithString:@"\n"];
//   [newStr appendString:self.xmlTextView.string];
//   [newStr appendFormat:@"%@\n", self.eventAttendees];
//   [self.xmlTextView setString:newStr];
//}
//
//-(void)EVECharacterSheetDidLoad:(NSNotification *)notification
//{
//   NSMutableString *newStr = [NSMutableString stringWithString:@"\n"];
//   [newStr appendString:self.xmlTextView.string];
//   [newStr appendFormat:@"%@\n", self.characterSheet];
//   [self.xmlTextView setString:newStr];
//}
//
//-(void)EVEContactListDidLoad:(NSNotification *)notification
//{
//   NSMutableString *newStr = [NSMutableString stringWithString:@"\n"];
//   [newStr appendString:self.xmlTextView.string];
//   [newStr appendFormat:@"%@\n", self.contactList];
//   [self.xmlTextView setString:newStr];
//}
//
//-(void)EVEContactNotificationsDidLoad:(NSNotification *)notification
//{
//   NSMutableString *newStr = [NSMutableString stringWithString:@"\n"];
//   [newStr appendString:self.xmlTextView.string];
//   [newStr appendFormat:@"%@\n", self.contactNotifications];
//   [self.xmlTextView setString:newStr];
//}
//
//-(void)EVEContractsDidLoad:(NSNotification *)notification
//{
//   NSMutableString *newStr = [NSMutableString stringWithString:@"\n"];
//   [newStr appendString:self.xmlTextView.string];
//   [newStr appendFormat:@"%@\n", self.characterContracts];
//   [self.xmlTextView setString:newStr];
//}
//
//-(void)EVEContractItemsDidLoad:(NSNotification *)notification
//{
//   NSMutableString *newStr = [NSMutableString stringWithString:@"\n"];
//   [newStr appendString:self.xmlTextView.string];
//   [newStr appendFormat:@"%@\n", self.contractItems];
//   [self.xmlTextView setString:newStr];
//}
//
//-(void)EVEContractBidsDidLoad:(NSNotification *)notification
//{
//   NSMutableString *newStr = [NSMutableString stringWithString:@"\n"];
//   [newStr appendString:self.xmlTextView.string];
//   [newStr appendFormat:@"%@\n", self.contractBids];
//   [self.xmlTextView setString:newStr];
//}
//
//-(void)EVEFactionalWarfareStatsDidLoad:(NSNotification *)notification
//{
//   NSMutableString *newStr = [NSMutableString stringWithString:@"\n"];
//   [newStr appendString:self.xmlTextView.string];
//   [newStr appendFormat:@"%@\n", self.factionalWarfareStats];
//   [self.xmlTextView setString:newStr];
//}
//
//-(void)EVEIndustryJobsDidLoad:(NSNotification *)notification
//{
//   NSMutableString *newStr = [NSMutableString stringWithString:@"\n"];
//   [newStr appendString:self.xmlTextView.string];
//   [newStr appendFormat:@"%@\n", self.industryJobs];
//   [self.xmlTextView setString:newStr];
//}
//
//-(void)EVEKillLogDidLoad:(NSNotification *)notification
//{
//   NSMutableString *newStr = [NSMutableString stringWithString:@"\n"];
//   [newStr appendString:self.xmlTextView.string];
//   [newStr appendFormat:@"%@\n", self.killLog];
//   [self.xmlTextView setString:newStr];
//}
//
//-(void)EVELocationsDidLoad:(NSNotification *)notification
//{
//   NSMutableString *newStr = [NSMutableString stringWithString:@"\n"];
//   [newStr appendString:self.xmlTextView.string];
//   [newStr appendFormat:@"%@\n", self.locations];
//   [self.xmlTextView setString:newStr];
//}
//
//-(void)EVEMailBodiesDidLoad:(NSNotification *)notification
//{
//   NSMutableString *newStr = [NSMutableString stringWithString:@"\n"];
//   [newStr appendString:self.xmlTextView.string];
//   [newStr appendFormat:@"%@\n", self.mailBodies];
//   [self.xmlTextView setString:newStr];
//}
//
//-(void)EVEMailMessagesDidLoad:(NSNotification *)notification
//{
//   NSMutableString *newStr = [NSMutableString stringWithString:@"\n"];
//   [newStr appendString:self.xmlTextView.string];
//   [newStr appendFormat:@"%@\n", self.mailMessages];
//   [self.xmlTextView setString:newStr];
//}
//
//-(void)EVEMailingListsDidLoad:(NSNotification *)notification
//{
//   NSMutableString *newStr = [NSMutableString stringWithString:@"\n"];
//   [newStr appendString:self.xmlTextView.string];
//   [newStr appendFormat:@"%@\n", self.mailingLists];
//   [self.xmlTextView setString:newStr];
//}
//
//-(void)EVEMarketOrdersDidLoad:(NSNotification *)notification
//{
//   NSMutableString *newStr = [NSMutableString stringWithString:@"\n"];
//   [newStr appendString:self.xmlTextView.string];
//   [newStr appendFormat:@"%@\n", self.marketOrders];
//   [self.xmlTextView setString:newStr];
//}
//
//-(void)EVEMedalsDidLoad:(NSNotification *)notification
//{
//   NSMutableString *newStr = [NSMutableString stringWithString:@"\n"];
//   [newStr appendString:self.xmlTextView.string];
//   [newStr appendFormat:@"%@\n", self.medals];
//   [self.xmlTextView setString:newStr];
//}
//
//-(void)EVENotificationsDidLoad:(NSNotification *)notification
//{
//   NSMutableString *newStr = [NSMutableString stringWithString:@"\n"];
//   [newStr appendString:self.xmlTextView.string];
//   [newStr appendFormat:@"%@\n", self.notifications];
//   [self.xmlTextView setString:newStr];
//}
//
//-(void)EVENotificationTextsDidLoad:(NSNotification *)notification
//{
//   NSMutableString *newStr = [NSMutableString stringWithString:@"\n"];
//   [newStr appendString:self.xmlTextView.string];
//   [newStr appendFormat:@"%@\n", self.notificationTexts];
//   [self.xmlTextView setString:newStr];
//}
//
//-(void)EVEResearchDidLoad:(NSNotification *)notification
//{
//   NSMutableString *newStr = [NSMutableString stringWithString:@"\n"];
//   [newStr appendString:self.xmlTextView.string];
//   [newStr appendFormat:@"%@\n", self.research];
//   [self.xmlTextView setString:newStr];
//}
//
//-(void)EVESkillInTrainingDidLoad:(NSNotification *)notification
//{
//   NSMutableString *newStr = [NSMutableString stringWithString:@"\n"];
//   [newStr appendString:self.xmlTextView.string];
//   [newStr appendFormat:@"%@\n", self.skillInTraining];
//   [self.xmlTextView setString:newStr];
//}
//
//-(void)EVESkillQueueDidLoad:(NSNotification *)notification
//{
//   NSMutableString *newStr = [NSMutableString stringWithString:@"\n"];
//   [newStr appendString:self.xmlTextView.string];
//   [newStr appendFormat:@"%@\n", self.skillQueue];
//   [self.xmlTextView setString:newStr];
//}
//
//-(void)EVEStandingsDidLoad:(NSNotification *)notification
//{
//   NSMutableString *newStr = [NSMutableString stringWithString:@"\n"];
//   [newStr appendString:self.xmlTextView.string];
//   [newStr appendFormat:@"%@\n", self.standings];
//   [self.xmlTextView setString:newStr];
//}
//
//-(void)EVEWalletJournalDidLoad:(NSNotification *)notification
//{
//   NSMutableString *newStr = [NSMutableString stringWithString:@"\n"];
//   [newStr appendString:self.xmlTextView.string];
//   [newStr appendFormat:@"%@\n", self.walletJournal];
//   [self.xmlTextView setString:newStr];
//}
//
//-(void)EVEWalletTransactionsDidLoad:(NSNotification *)notification
//{
//   NSMutableString *newStr = [NSMutableString stringWithString:@"\n"];
//   [newStr appendString:self.xmlTextView.string];
//   [newStr appendFormat:@"%@\n", self.walletTransactions];
//   [self.xmlTextView setString:newStr];
//}
//
//// Character/Corporation APIs
//
//// Corporation APIs
//
//// EVE Global APIs
//-(void)EVEAllianceListDidLoad:(NSNotification *)notification
//{
//   NSMutableString *newStr = [NSMutableString stringWithString:@"\n"];
//   [newStr appendString:self.xmlTextView.string];
//   [newStr appendFormat:@"%@\n", self.allianceList];
//   [self.xmlTextView setString:newStr];
//}
//
//-(void)EVECharacterNameToIdDidLoad:(NSNotification *)notification
//{
//   NSMutableString *newStr = [NSMutableString stringWithString:@"\n"];
//   [newStr appendString:self.xmlTextView.string];
//   [newStr appendFormat:@"%@\n", self.charNameToId];
//   [self.xmlTextView setString:newStr];
//}
//
//-(void)EVECharacterIdToNameDidLoad:(NSNotification *)notification
//{
//   NSMutableString *newStr = [NSMutableString stringWithString:@"\n"];
//   [newStr appendString:self.xmlTextView.string];
//   [newStr appendFormat:@"%@\n", self.charIdToName];
//   [self.xmlTextView setString:newStr];
//}
//
//-(void)EVECharacterInfoDidLoad:(NSNotification *)notification
//{
//   NSMutableString *newStr = [NSMutableString stringWithString:@"\n"];
//   [newStr appendString:self.xmlTextView.string];
//   [newStr appendFormat:@"%@\n", self.characterInfo];
//   [self.xmlTextView setString:newStr];
//}
//
//-(void)EVEConquerableStationListDidLoad:(NSNotification *)notification
//{
//   NSMutableString *newStr = [NSMutableString stringWithString:@"\n"];
//   [newStr appendString:self.xmlTextView.string];
//   [newStr appendFormat:@"%@\n", self.conquerableStations];
//   [self.xmlTextView setString:newStr];
//}
//
//-(void)EVEFactionalWarfareGlobalStatsDidLoad:(NSNotification *)notification
//{
//   NSMutableString *newStr = [NSMutableString stringWithString:@"\n"];
//   [newStr appendString:self.xmlTextView.string];
//   [newStr appendFormat:@"%@\n", self.factionWarGlobalStats];
//   [self.xmlTextView setString:newStr];
//}
//
//-(void)EVEFactionalWarfareTopStatsDidLoad:(NSNotification *)notification
//{
//   NSMutableString *newStr = [NSMutableString stringWithString:@"\n"];
//   [newStr appendString:self.xmlTextView.string];
//   [newStr appendFormat:@"%@\n", self.factionWarTopStats];
//   [self.xmlTextView setString:newStr];
//}
//
//-(void)EVEReferenceTypesDidLoad:(NSNotification *)notification
//{
//   NSMutableString *newStr = [NSMutableString stringWithString:@"\n"];
//   [newStr appendString:self.xmlTextView.string];
//   [newStr appendFormat:@"%@\n", self.refTypes];
//   [self.xmlTextView setString:newStr];
//}
//
//-(void)EVESkillTreeDidLoad:(NSNotification *)notification
//{
//   NSMutableString *newStr = [NSMutableString stringWithString:@"\n"];
//   [newStr appendString:self.xmlTextView.string];
//   [newStr appendFormat:@"%@\n", self.skillTree];
//   [self.xmlTextView setString:newStr];
//}
//
//-(void)EVETypeNameDidLoad:(NSNotification *)notification
//{
//   NSMutableString *newStr = [NSMutableString stringWithString:@"\n"];
//   [newStr appendString:self.xmlTextView.string];
//   [newStr appendFormat:@"%@\n", self.typeName];
//   [self.xmlTextView setString:newStr];
//}
//
//// Map APIs
//-(void)EVESovereigntyDidLoad:(NSNotification *)notification
//{
//   NSMutableString *newStr = [NSMutableString stringWithString:@"\n"];
//   [newStr appendString:self.xmlTextView.string];
//   [newStr appendFormat:@"%@\n", self.sovereignty];
//   [self.xmlTextView setString:newStr];
//}
//
//-(void)EVEKillsDidLoad:(NSNotification *)notification
//{
//   NSMutableString *newStr = [NSMutableString stringWithString:@"\n"];
//   [newStr appendString:self.xmlTextView.string];
//   [newStr appendFormat:@"%@\n", self.kills];
//   [self.xmlTextView setString:newStr];
//}
//
//-(void)EVEJumpsDidLoad:(NSNotification *)notification
//{
//   NSMutableString *newStr = [NSMutableString stringWithString:@"\n"];
//   [newStr appendString:self.xmlTextView.string];
//   [newStr appendFormat:@"%@\n", self.jumps];
//   [self.xmlTextView setString:newStr];
//}
//
//-(void)EVEFactionalWarfareSystemsDidLoad:(NSNotification *)notification
//{
//   NSMutableString *newStr = [NSMutableString stringWithString:@"\n"];
//   [newStr appendString:self.xmlTextView.string];
//   [newStr appendFormat:@"%@\n", self.facWarSystems];
//   [self.xmlTextView setString:newStr];
//}
//
//// EVE Online APIs Server APIs
//-(void)EVECallListDidLoad:(NSNotification *)notification
//{
//   NSMutableString *newStr = [NSMutableString stringWithString:@"\n"];
//   [newStr appendString:self.xmlTextView.string];
//   [newStr appendFormat:@"%@\n", self.callList];
//   [self.xmlTextView setString:newStr];
//}
//
//-(void)EVEServerStatusDidLoad:(NSNotification *)notification
//{
//   NSMutableString *newStr = [NSMutableString stringWithString:@"\n"];
//   [newStr appendString:self.xmlTextView.string];
//   [newStr appendFormat:@"%@\n", self.serverStatus];
//   [self.xmlTextView setString:newStr];
//}

@end

/* MDE
 734499
 rnKgT0CsBodEiQXJsxVXE60taTXwyxTLgCuIDv2Vo22HIRTeNWhOX0RCj4TMcI68
 */

/* MD
 Full Access New Api
 1927220
 JVolmWFGtr6wMewZywlpRje3XmRSiI6xKQ6TbOELHEUH7j8vymuim3D62UKOlB6Y
 
 Limited Access Legacy
 8695857
 F0AD3EC9275C4FE38A90F191FA2B223AF66C79FAF2CF45828340EC5D0E62220E
 
 Full Access Legacy
 8695857
 7D345E16FC2441309723B9B51768CB0F2DDF9A5D43A74CBFAB7567299F5A306C
 
 */
