//
//  CreateTripsViewController.m
//  Project for Financial Book
//
//  Created by Admin on 05.08.15.
//  Copyright (c) 2015 HY. All rights reserved.
//

#import "CreateTripsViewController.h"
#import "AddObjectToCoreData.h"
#import "DatePickerViewController.h"
#import "Trips.h"

@interface CreateTripsViewController ()

@end

@implementation CreateTripsViewController

static NSDate* startDate;
static NSDate* endDate;
static bool isStartDate;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:YES];
    self.startDate.text = [self dateFormatString:startDate];
    self.endDate.text = [self dateFormatString:endDate];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (NSString*)dateFormatString:(NSDate*)date {
    
    NSDateFormatter * formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"dd.MM.yyyy"];
    
    return [formatter stringFromDate:date];
}

#pragma mark - Action

- (IBAction)actionSaveTripBarButton:(id)sender {
    
    CoreDataTableViewController* addObject = [[CoreDataTableViewController alloc] init];
    
    [addObject createTrips:self.nameTrip.text startDate:startDate endDate:endDate comment:self.comment.text];
    
    //[self.createDelegate saveObjectToCoreData:self.nameTrip.text startDate:startDate endDate:endDate comment:self.comment.text];
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)actionStartDate:(id)sender {
    
    [self actionOpenDatePicker];
    
    [self.startDate resignFirstResponder];
    
    
    isStartDate = YES;
}

- (IBAction)actionEndDate:(id)sender {
    
    [self actionOpenDatePicker];
    
    isStartDate = NO;
}

- (void) actionOpenDatePicker {
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    
    DatePickerViewController *verifyInfoVC = [storyboard instantiateViewControllerWithIdentifier:@"Date Picker"];
    [self.navigationController pushViewController:verifyInfoVC animated:YES];
}

+ (void) seveStartDate:(NSDate*) date {
    
    if (isStartDate) {
        startDate = date;
    } else {
        endDate = date;
    }
}



@end
