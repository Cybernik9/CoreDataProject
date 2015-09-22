//
//  AddObjectToCoreData.h
//  Project for Financial Book
//
//  Created by Admin on 05.08.15.
//  Copyright (c) 2015 HY. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface AddObjectToCoreData : NSObject

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

+ (AddObjectToCoreData*) sharedManager;

- (BOOL) createAccount:(NSString*) login password:(NSString*) password;
- (BOOL) isTrueLoginAndPassword:(NSString*) login password:(NSString*) password;
- (void) createTrips:(NSString*) destination startDate:(NSDate*) startDate
             endDate:(NSDate*) endDate comment:(NSString*) comment;
- (NSSet*) getTrips;

@end
