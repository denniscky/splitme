//
//  ViewController.m
//  SplitMe
//
//  Created by Dennis on 1/5/13.
//  Copyright (c) 2013 Dennis Chan. All rights reserved.
//

#import "TotalAmountViewController.h"
#import "SessionDataController.h"
#import "DinerReadyViewController.h"

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
    
    self.buttonDone.alpha = 0.0;
    self.dinerCount = 0;
    [self.fieldTotalAmount setPriceDecimal2:0];
    [self refreshUIElements];
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

//////////////////////
// IBAction methods //
//////////////////////
- (IBAction)buttonBackClicked:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)buttonStartClicked:(id)sender {
    
    if (self.dinerCount <= 0) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Zero Diners"
                                                        message:@"You can't have no one eating..."
                                                       delegate:self
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
        return;
    }
    
    SessionDataController *session = [SessionDataController sharedInstance];
    session.totalAmountDecimal2 = [self.fieldTotalAmount getPriceDecimal2];
    session.dinerCount = self.dinerCount;
    [session beginSession];
    [self performSegueForDinerOne];
}

- (IBAction)buttonIncrementDinerClicked:(id)sender {
    if (self.dinerCount < MAX_DINER) {
        self.dinerCount ++;
        [self refreshUIElements];
    }
}

- (IBAction)buttonDecrementDinerClicked:(id)sender {
    if (self.dinerCount > 0) {
        self.dinerCount --;
        [self refreshUIElements];
    }
}

- (IBAction)buttonDoneClicked:(id)sender {
    [self.fieldTotalAmount resignFirstResponder];
}

////////////////////
// Helper methods //
////////////////////
- (void)refreshUIElements {
    self.labelDinerCount.text = [NSString stringWithFormat:@"%d", self.dinerCount];
}

- (void)performSegueForDinerOne {
    UIStoryboard *storyboard = self.storyboard;
    UIViewController *overviewScreen = [storyboard instantiateViewControllerWithIdentifier:@"OverviewViewController"];
    DinerReadyViewController *readyScreen = [storyboard instantiateViewControllerWithIdentifier:@"DinerReadyViewController"];
    readyScreen.diner = [[SessionDataController sharedInstance].diners objectAtIndex:0];
    
    NSMutableArray *currentStack = [NSMutableArray arrayWithArray:self.navigationController.viewControllers];
    [currentStack addObject:overviewScreen];
    [currentStack addObject:readyScreen];
    [self.navigationController setViewControllers:(NSArray *)currentStack animated:YES];
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
    [self refreshUIElements];
}

//////////////////////
// Delegate methods //
//////////////////////
//- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)addedString
//{
//    //NSLog(@"shouldChangeCharactersInRange |%@| %d %d |%@|", textField.text, range.length, range.location, addedString);
//    
//    NSString *justNumbers = [textField.text stringByReplacingOccurrencesOfString:@"$" withString:@""];
//    justNumbers = [justNumbers stringByReplacingOccurrencesOfString:@"." withString:@""];
//    justNumbers = [justNumbers stringByReplacingOccurrencesOfString:@" " withString:@""];
//    if ([addedString isEqualToString:@""]) {
//        if (justNumbers.length > 0) {
//            justNumbers = [justNumbers substringToIndex:justNumbers.length-1];
//        }
//    }
//    else {
//        justNumbers = [justNumbers stringByAppendingString:addedString];
//    }
//    
//    textField.text = [self numberStringToPriceString:justNumbers doPadZero:NO];
//    
//    return NO;
//}

@end
