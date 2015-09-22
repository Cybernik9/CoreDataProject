//
//  Trips.h
//  Project for Financial Book
//
//  Created by Admin on 05.08.15.
//  Copyright (c) 2015 HY. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "Object.h"

@class Account;

@interface Trips : Object

@property (nonatomic, retain) NSString * destination;
@property (nonatomic, retain) NSDate * startDate;
@property (nonatomic, retain) NSDate * endDate;
@property (nonatomic, retain) NSString * comment;
@property (nonatomic, retain) Account *account;

@end
