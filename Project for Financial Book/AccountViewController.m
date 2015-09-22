//
//  AccountViewController.m
//  Project for Financial Book
//
//  Created by Admin on 05.08.15.
//  Copyright (c) 2015 HY. All rights reserved.
//

#import "AccountViewController.h"
#import "AddObjectToCoreData.h"
#import "TripsTableViewController.h"

@interface AccountViewController ()

@end

@implementation AccountViewController

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

- (IBAction)actionLogin:(id)sender {
    
    AddObjectToCoreData* addObject = [[AddObjectToCoreData alloc] init];
    
    if ([addObject isTrueLoginAndPassword:self.entryLogin.text password:self.entryPassword.text]) {
        
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
        
        TripsTableViewController *verifyInfoVC = [storyboard instantiateViewControllerWithIdentifier:@"trips"];
        [self.navigationController pushViewController:verifyInfoVC animated:YES];
        
        self.entryLogin.text = self.entryPassword.text = nil;
        
    } else {
        [self alertMessage:@"Login or password wrong"
                   message:@"Please try again or sign up"];
        
        self.entryPassword.text = nil;
    }
    
    
    
}

- (IBAction)actionCreate:(id)sender {
    
    AddObjectToCoreData* addObject = [[AddObjectToCoreData alloc] init];
    
    if ([addObject createAccount:self.createLogin.text password:self.createPassword.text]) {
        
        [self.navigationController popViewControllerAnimated:YES];
        
    } else {
        [self alertMessage:@"This login is already created"
                   message:@"Please enter a different login"];
        
        self.createLogin.text = self.createPassword.text = nil;
    }
    
    //NSLog(@"%@ - %@",self.createLogin.text, self.createPassword.text);
    
}

- (void) alertMessage:(NSString*) title message:(NSString*)message {
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title
                                                    message:message
                                                   delegate:self
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];
    
}

@end
