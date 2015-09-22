//
//  AddObjectToCoreData.m
//  Project for Financial Book
//
//  Created by Admin on 05.08.15.
//  Copyright (c) 2015 HY. All rights reserved.
//

#import "AddObjectToCoreData.h"
#import "Account.h"
#import "Trips.h"


@implementation AddObjectToCoreData

@synthesize managedObjectContext = _managedObjectContext;
@synthesize managedObjectModel = _managedObjectModel;
@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;

static NSString* enterLogin;

+ (AddObjectToCoreData*) sharedManager {
    
    static AddObjectToCoreData* manager = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[AddObjectToCoreData alloc] init];
    });
    
    return manager;
}

#pragma mark - Core Data stack

- (NSURL *)applicationDocumentsDirectory {
    // The directory the application uses to store the Core Data store file. This code uses a directory named "Cybernik.Project_for_Financial_Book" in the application's documents directory.
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

- (NSManagedObjectModel *)managedObjectModel {
    // The managed object model for the application. It is a fatal error for the application not to be able to find and load its model.
    if (_managedObjectModel != nil) {
        return _managedObjectModel;
    }
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"Project_for_Financial_Book" withExtension:@"momd"];
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return _managedObjectModel;
}

- (NSPersistentStoreCoordinator *)persistentStoreCoordinator {
    // The persistent store coordinator for the application. This implementation creates and return a coordinator, having added the store for the application to it.
    if (_persistentStoreCoordinator != nil) {
        return _persistentStoreCoordinator;
    }
    
    // Create the coordinator and store
    
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"Project_for_Financial_Book.sqlite"];
    NSError *error = nil;
    NSString *failureReason = @"There was an error creating or loading the application's saved data.";
    if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
        // Report any error we got.
        NSMutableDictionary *dict = [NSMutableDictionary dictionary];
        dict[NSLocalizedDescriptionKey] = @"Failed to initialize the application's saved data";
        dict[NSLocalizedFailureReasonErrorKey] = failureReason;
        dict[NSUnderlyingErrorKey] = error;
        error = [NSError errorWithDomain:@"YOUR_ERROR_DOMAIN" code:9999 userInfo:dict];
        // Replace this with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    
    return _persistentStoreCoordinator;
}


- (NSManagedObjectContext *)managedObjectContext {
    // Returns the managed object context for the application (which is already bound to the persistent store coordinator for the application.)
    if (_managedObjectContext != nil) {
        return _managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (!coordinator) {
        return nil;
    }
    _managedObjectContext = [[NSManagedObjectContext alloc] init];
    [_managedObjectContext setPersistentStoreCoordinator:coordinator];
    return _managedObjectContext;
}

#pragma mark - Core Data Saving support

- (void)saveContext {
    NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
    if (managedObjectContext != nil) {
        NSError *error = nil;
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
            // Replace this implementation with code to handle the error appropriately.
            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
    }
}

#pragma mark - Account

- (BOOL) createAccount:(NSString*) login password:(NSString*) password {
    
    NSArray* resultArray = [self giveAccountArray];
    
    for (Account* obj in resultArray) {
        if ([login isEqualToString:obj.login]) {
            
            return NO;
        }
    }
    
    NSError* error = nil;
    
    Account* account =
    [NSEntityDescription insertNewObjectForEntityForName:@"Account"
                                  inManagedObjectContext:self.managedObjectContext];
    account.login = login;
    account.password = password;
    
    if (![self.managedObjectContext save:&error]) {
             NSLog(@"%@", [error localizedDescription]);
    }
    
    return YES;
    
}

- (BOOL) isTrueLoginAndPassword:(NSString*) login password:(NSString*) password {
    
    NSArray* resultArray = [self giveAccountArray];
    
    for (Account* account in resultArray) {
        
        if ([account.login isEqualToString:login] &&
            [account.password isEqualToString:password]) {
            
            enterLogin = login;
            
            return YES;
            
        }
    }
    
    return NO;
}

- (void) createTrips:(NSString*) destination startDate:(NSDate*) startDate
             endDate:(NSDate*) endDate comment:(NSString*) comment {
    
    NSArray* resultArray = [self giveAccountArray];
    NSError* error = nil;
    
    Trips* trips =
    [NSEntityDescription insertNewObjectForEntityForName:@"Trips"
                                  inManagedObjectContext:self.managedObjectContext];
    
    trips.destination = destination;
    trips.startDate = startDate;
    trips.endDate = endDate;
    trips.comment = comment;
    
    for (Account* account in resultArray) {
        
        if ([account.login isEqualToString:enterLogin]) {
            [account addTripsObject:trips];
            if (![self.managedObjectContext save:&error]) {
                NSLog(@"%@", [error localizedDescription]);
            }
            return;
        }
    }
    
}

- (NSSet*) getTrips {
    
    NSArray* resultArray = [self giveAccountArray];
    
    for (Account* account in resultArray) {
        if ([account.login isEqualToString:enterLogin]) {
            NSLog(@"%@",account.trips);
            NSLog(@"/n %@",account);
            return account.trips;
        }
    }
    return nil;
}

- (NSArray*) giveAccountArray {
    
    NSFetchRequest* request = [[NSFetchRequest alloc] init];
    
    NSEntityDescription* description = [NSEntityDescription entityForName:@"Account"
                                                   inManagedObjectContext:self.managedObjectContext];
    
    [request setEntity:description];
    NSError* error = nil;
    NSArray* resultArray = [self.managedObjectContext executeFetchRequest:request error:&error];
    
    return resultArray;
}

@end
