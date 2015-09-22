//
//  DatePickerViewController.m
//  Project for Financial Book
//
//  Created by Admin on 21.09.15.
//  Copyright (c) 2015 HY. All rights reserved.
//

#import "DatePickerViewController.h"
#import "CreateTripsViewController.h"

@interface DatePickerViewController ()

@end

@implementation DatePickerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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



#pragma mark - Action

- (IBAction)actionSaveDatePickerButton:(id)sender {
    
    [CreateTripsViewController seveStartDate:self.datePicker.date];
    [self.navigationController popViewControllerAnimated:YES];
}


@end
