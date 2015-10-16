//
//  CreateTripsViewController.h
//  Project for Financial Book
//
//  Created by Admin on 05.08.15.
//  Copyright (c) 2015 HY. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CoreDataTableViewController.h"

@protocol CreateTripsViewControllerProtocol <NSObject>

- (void) saveObjectToCoreData:(NSString*) destination startDate:(NSDate*) startDate
                      endDate:(NSDate*) endDate comment:(NSString*) comment;

@end

@interface CreateTripsViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *nameTrip;
@property (weak, nonatomic) IBOutlet UITextField *startDate;
@property (weak, nonatomic) IBOutlet UITextField *endDate;
@property (weak, nonatomic) IBOutlet UITextField *comment;
//@property (assign) CreateTripsViewController *delegate;

@property (nonatomic, weak) NSObject <CreateTripsViewControllerProtocol> *createDelegate;

- (IBAction)actionSaveTripBarButton:(id)sender;

- (IBAction)actionStartDate:(id)sender;
- (IBAction)actionEndDate:(id)sender;

+ (void) seveStartDate:(NSDate*) date;

@end
