//
//  TripsTableViewController.h
//  Project for Financial Book
//
//  Created by Admin on 05.08.15.
//  Copyright (c) 2015 HY. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "CoreDataTableViewController.h"

@interface TripsTableViewController : CoreDataTableViewController

@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;


- (IBAction)actionExitBarButton:(id)sender;
- (IBAction)actionAddBarButton:(id)sender;


@end
