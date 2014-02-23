//
//  MainWindowController.h
//  EveAPI
//
//  Created by Johnathan Richter on 10/13/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import <Cocoa/Cocoa.h>

// Account APIs
#import "EVEApiKeyInformation.h"
#import "EVEAccountStatus.h"
#import "EVEAccountCharacters.h"

// Character APIs
//#import "EVEAccountBalance.h"
//#import "EVEAssetList.h"
//#import "EVECalendarEventAttendees.h"
//#import "EVECharacterSheet.h"
//#import "EVEContactList.h"
//#import "EVEContactNotifications.h"
//#import "EVEContracts.h"
//#import "EVEContractItems.h"
//#import "EVEContractBids.h"
//#import "EVEFactionalWarfareStats.h"
//#import "EVEIndustryJobs.h"
//#import "EVEKillLog.h"
//#import "EVELocations.h"
//#import "EVEMailBodies.h"
//#import "EVEMailingLists.h"
//#import "EVEMailMessages.h"
//#import "EVEMarketOrders.h"
//#import "EVEMedals.h"
//#import "EVENotifications.h"
//#import "EVENotificationTexts.h"
//#import "EVEResearch.h"
//#import "EVESkillInTraining.h"
//#import "EVESkillQueue.h"
//#import "EVEStandings.h"
//#import "EVEUpcomingCalendarEvents.h"
//#import "EVEWalletJournal.h"
//#import "EVEWalletTransactions.h"

// Corporation APIs

// Global EVE APIs
#import "EVEAllianceList.h"
//#import "EVECharacterInfo.h"
//#import "EVECharacterIdToName.h"
//#import "EVECharacterNameToId.h"
//#import "EVEConquerableStationList.h"
//#import "EVEErrorList.h"
//#import "EVEFactionalWarfareGlobalStats.h"
//#import "EVEFactionalWarfareTopStats.h"
//#import "EVEReferenceTypes.h"
//#import "EVESkillTree.h"
//#import "EVETypeName.h"

// Map APIs
//#import "EVEFactionalWarfareSystems.h"
//#import "EVEJumps.h"
//#import "EVEKills.h"
//#import "EVESovereignty.h"

// Misc APIs
//#import "EVEImage.h"

// Server APIs
//#import "EVEServerStatus.h"
#import "EVECallList.h"

@interface MainWindowController : NSWindowController

@property (strong) IBOutlet NSTextView *xmlTextView;

@property (strong) EVEApiKeyInformation *apiKeyInfo;
@property (strong) EVEAccountStatus *accountStatus;
@property (strong) EVEAccountCharacters *accountCharacters;
//@property (strong) EVEAccountBalance *accountBalance;
//@property (strong) EVEAssetList *assetList;
//@property (strong) EVEUpcomingCalendarEvents *upcomingEvents;
//@property (strong) EVECalendarEventAttendees *eventAttendees;
//@property (strong) EVECharacterSheet *characterSheet;
//@property (strong) EVEContactList *contactList;
//@property (strong) EVEContactNotifications *contactNotifications;
//@property (strong) EVEContracts *characterContracts;
//@property (strong) EVEContractItems *contractItems;
//@property (strong) EVEContractBids *contractBids;
//@property (strong) EVEFactionalWarfareStats *factionalWarfareStats;
//@property (strong) EVEIndustryJobs *industryJobs;
//@property (strong) EVEKillLog *killLog;
//@property (strong) EVELocations *locations;
//@property (strong) EVEMailBodies *mailBodies;
//@property (strong) EVEMailMessages *mailMessages;
//@property (strong) EVEMailingLists *mailingLists;
//@property (strong) EVEMarketOrders *marketOrders;
//@property (strong) EVEMedals *medals;
//@property (strong) EVENotifications *notifications;
//@property (strong) EVENotificationTexts *notificationTexts;
//@property (strong) EVEResearch *research;
//@property (strong) EVESkillInTraining *skillInTraining;
//@property (strong) EVESkillQueue *skillQueue;
//@property (strong) EVEStandings *standings;
//@property (strong) EVEWalletJournal *walletJournal;
//@property (strong) EVEWalletTransactions *walletTransactions;

// EVE Global APIs
@property (strong) EVEAllianceList *allianceList;
//@property (strong) EVECharacterNameToId *charNameToId;
//@property (strong) EVECharacterIdToName *charIdToName;
//@property (strong) EVECharacterInfo *characterInfo;
//@property (strong) EVEConquerableStationList *conquerableStations;
//@property (strong) EVEFactionalWarfareGlobalStats *factionWarGlobalStats;
//@property (strong) EVEReferenceTypes *refTypes;
//@property (strong) EVETypeName *typeName;
//@property (strong) EVEFactionalWarfareTopStats *factionWarTopStats;
//@property (strong) EVESkillTree *skillTree;

// Map APIs
//@property (strong) EVEFactionalWarfareSystems *facWarSystems;
//@property (strong) EVEJumps *jumps;
//@property (strong) EVEKills *kills;
//@property (strong) EVESovereignty *sovereignty;

// Server APIs
//@property (strong) EVEServerStatus *serverStatus;

// Eve Online API Server APIs
@property (strong) EVECallList *callList;

@end
