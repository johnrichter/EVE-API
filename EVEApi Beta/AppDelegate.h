//
//  AppDelegate.h
//  EVEApi Beta
//
//  Created by Johnathan Richter on 2/19/14.
//  Copyright (c) 2014 D-Squared Productions. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "MainWindowController.h"

@interface AppDelegate : NSObject <NSApplicationDelegate>

@property (assign) IBOutlet NSWindow *window;

@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@property (strong) MainWindowController *mainWindowController;

- (IBAction)saveAction:(id)sender;

@end
