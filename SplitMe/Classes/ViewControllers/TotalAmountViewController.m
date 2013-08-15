//
//  ViewController.m
//  SplitMe
//
//  Created by Dennis on 1/5/13.
//  Copyright (c) 2013 Dennis Chan. All rights reserved.
//

#import "TotalAmountViewController.h"
#import "SessionDataController.h"

@interface TotalAmountViewController ()

@end

@implementation TotalAmountViewController

///////////////////////
// Inherited methods //
///////////////////////
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillShow:)
                                                 name:UIKeyboardWillShowNotification
                                               object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillHide:)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];
    
    // If we want keybaord to show up on load (keep for later reference)
    //[self.textField becomeFirstResponder];
    
    
    self.buttonDone.alpha = 0.0;
    self.dinerCount = 0;
    self.totalAmountDecimal2 = 0;
    [self refreshAllLabels];
    
}

- (void)viewWillAppear:(BOOL)animated {
}

- (void)viewWillDisappear:(BOOL)animated {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setLabelDinerCount:nil];
    [self setButtonNext:nil];
    [self setButtonBack:nil];
    [self setButtonDone:nil];
    [self setFieldTotalAmount:nil];
    [super viewDidUnload];
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)performSegueWithIdentifier:(NSString *)identifier sender:(id)sender {
    if ([identifier isEqualToString:@"segueAfterTotalAmount"]) {
        SessionDataController *session = [SessionDataController sharedInstance];
        session.totalAmountDecimal2 = self.totalAmountDecimal2;
        session.dinerCount = self.dinerCount;
    }
}

//////////////////////
// IBAction methods //
//////////////////////
- (IBAction)buttonBackClicked:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)buttonIncrementDinerClicked:(id)sender {
    if (self.dinerCount < MAX_DINER) {
        self.dinerCount ++;
        [self refreshAllLabels];
    }
}

- (IBAction)buttonDecrementDinerClicked:(id)sender {
    if (self.dinerCount > 0) {
        self.dinerCount --;
        [self refreshAllLabels];
    }
}

- (IBAction)buttonDoneClicked:(id)sender {
    [self.fieldTotalAmount resignFirstResponder];
}

////////////////////
// Helper methods //
////////////////////
- (void)refreshAllLabels {
    self.labelDinerCount.text = [NSString stringWithFormat:@"%d", self.dinerCount];
    self.fieldTotalAmount.text = [self numberToPriceString:self.totalAmountDecimal2 doPadZero:YES];
}

- (NSString *)numberToPriceString:(NSUInteger)number doPadZero:(BOOL)doPadZero {
    NSString *numberString = number == 0 ? @"" : [NSString stringWithFormat:@"%d", number];
    return [self numberStringToPriceString:numberString doPadZero:doPadZero];
}

- (NSString *)numberStringToPriceString:(NSString *)numberString doPadZero:(BOOL)doPadZero {
    NSMutableString *result = [NSMutableString stringWithString:numberString];
    while (result.length < 3) {
        doPadZero ? [result insertString:@"0" atIndex:0] : [result insertString:@" " atIndex:0];
    }
    [result insertString:@"$" atIndex:0];
    [result insertString:@"." atIndex:result.length-2];
    return result;
}

//////////////////////////
// Notification methods //
//////////////////////////
- (void)keyboardWillShow:(NSNotification *)notification {
    //[UIView setAnimationsEnabled:NO]; // For showing a textField on load
    
    // Keeping this in case we need example code later
//    NSDictionary* info = [notification userInfo];
//    CGSize kbSize = [[info objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
//    
//    UIEdgeInsets contentInsets = UIEdgeInsetsMake(0.0, 0.0, kbSize.height, 0.0);
//    scrollView.contentInset = contentInsets;
//    scrollView.scrollIndicatorInsets = contentInsets;
//    
//    // If active text field is hidden by keyboard, scroll it so it's visible
//    // Your application might not need or want this behavior.
//    CGRect aRect = self.view.frame;
//    aRect.size.height -= kbSize.height;
//    if (!CGRectContainsPoint(aRect, activeField.frame.origin) ) {
//        CGPoint scrollPoint = CGPointMake(0.0, activeField.frame.origin.y-kbSize.height);
//        [scrollView setContentOffset:scrollPoint animated:YES];
    //    }
    NSDictionary* info = [notification userInfo];
    NSValue* value = [info objectForKey:UIKeyboardAnimationDurationUserInfoKey];
    NSTimeInterval duration = 0;
    [value getValue:&duration];
    CGFloat edgeOfDinerCount = self.labelDinerCount.superview.frame.origin.y + self.labelDinerCount.superview.frame.size.height;
    [UIView animateWithDuration:duration animations:^{
        self.view.transform = CGAffineTransformMakeTranslation(0.0, -edgeOfDinerCount);
        self.buttonDone.alpha = 1.0;
    }];
    self.fieldTotalAmount.text = [self numberToPriceString:self.totalAmountDecimal2 doPadZero:NO];
    self.buttonBack.hidden = YES;
    self.buttonNext.hidden = YES;
}

- (void)keyboardWillHide:(NSNotification *)notification {
    NSDictionary* info = [notification userInfo];
    NSValue* value = [info objectForKey:UIKeyboardAnimationDurationUserInfoKey];
    NSTimeInterval duration = 0;
    [value getValue:&duration];
    [UIView animateWithDuration:duration animations:^{
        self.view.transform = CGAffineTransformMakeTranslation(0.0, 0.0);
        self.buttonDone.alpha = 0.0;
    }];
    self.buttonBack.hidden = NO;
    self.buttonNext.hidden = NO;
    
    NSString *justNumbers = [self.fieldTotalAmount.text stringByReplacingOccurrencesOfString:@"$" withString:@""];
    justNumbers = [justNumbers stringByReplacingOccurrencesOfString:@"." withString:@""];
    justNumbers = [justNumbers stringByReplacingOccurrencesOfString:@" " withString:@""];
    self.totalAmountDecimal2 = [justNumbers intValue];
    [self refreshAllLabels];
}

//////////////////////
// Delegate methods //
//////////////////////
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)addedString
{
    //NSLog(@"shouldChangeCharactersInRange |%@| %d %d |%@|", textField.text, range.length, range.location, addedString);
    
    NSString *justNumbers = [textField.text stringByReplacingOccurrencesOfString:@"$" withString:@""];
    justNumbers = [justNumbers stringByReplacingOccurrencesOfString:@"." withString:@""];
    justNumbers = [justNumbers stringByReplacingOccurrencesOfString:@" " withString:@""];
    if ([addedString isEqualToString:@""]) {
        if (justNumbers.length > 0) {
            justNumbers = [justNumbers substringToIndex:justNumbers.length-1];
        }
    }
    else {
        justNumbers = [justNumbers stringByAppendingString:addedString];
    }
    
    textField.text = [self numberStringToPriceString:justNumbers doPadZero:NO];
    
    return NO;
}

@end
