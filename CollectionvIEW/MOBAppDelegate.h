//
//  MOBAppDelegate.h
//  CollectionvIEW
//
//  Created by Joel Backschat on 9/22/13.
//  Copyright (c) 2013 Joel Backschat. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MOBAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end
