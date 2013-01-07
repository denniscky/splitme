//
//  ViewController.m
//  SplitMe
//
//  Created by Dennis on 1/5/13.
//  Copyright (c) 2013 Dennis Chan. All rights reserved.
//

#import "TotalAmountViewController.h"

@interface TotalAmountViewController ()

@end

@implementation TotalAmountViewController

- (void)viewWillAppear:(BOOL)animated {
}

- (void)viewWillDisappear:(BOOL)animated {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(willShowKeyboard:)
                                                 name:UIKeyboardWillShowNotification
                                               object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(didShowKeyboard:)
                                                 name:UIKeyboardDidShowNotification
                                               object:nil];
    [self.textField becomeFirstResponder];
}

- (void)willShowKeyboard:(NSNotification *)notification {
    [UIView setAnimationsEnabled:NO];
}

- (void)didShowKeyboard:(NSNotification *)notification {
    [UIView setAnimationsEnabled:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setTextField:nil];
    [super viewDidUnload];
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    return YES;
}

@end
