//
//  AccountViewController.h
//  Project for Financial Book
//
//  Created by Admin on 05.08.15.
//  Copyright (c) 2015 HY. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AccountViewController : UIViewController


@property (weak, nonatomic) IBOutlet UITextField *createLogin;
@property (weak, nonatomic) IBOutlet UITextField *createPassword;

@property (weak, nonatomic) IBOutlet UITextField *entryLogin;
@property (weak, nonatomic) IBOutlet UITextField *entryPassword;


- (IBAction)actionLogin:(id)sender;
- (IBAction)actionCreate:(id)sender;


@end
