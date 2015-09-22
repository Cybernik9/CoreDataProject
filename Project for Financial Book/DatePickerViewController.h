//
//  DatePickerViewController.h
//  Project for Financial Book
//
//  Created by Admin on 21.09.15.
//  Copyright (c) 2015 HY. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DatePickerViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;
- (IBAction)actionSaveDatePickerButton:(id)sender;

@end
