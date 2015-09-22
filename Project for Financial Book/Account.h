//
//  Account.h
//  Project for Financial Book
//
//  Created by Admin on 05.08.15.
//  Copyright (c) 2015 HY. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class NSManagedObject;

@interface Account : NSManagedObject

@property (nonatomic, retain) NSString * login;
@property (nonatomic, retain) NSString * password;
@property (nonatomic, retain) NSSet *trips;
@end

@interface Account (CoreDataGeneratedAccessors)

- (void)addTripsObject:(NSManagedObject *)value;
- (void)removeTripsObject:(NSManagedObject *)value;
- (void)addTrips:(NSSet *)values;
- (void)removeTrips:(NSSet *)values;

@end
