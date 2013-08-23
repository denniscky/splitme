//
//  DinerItemViewController.m
//  SplitMe
//
//  Created by Dennis on 8/19/13.
//  Copyright (c) 2013 Dennis Chan. All rights reserved.
//

#import "DinerItemViewController.h"
#import "OverviewViewController.h"

@interface DinerItemViewController ()

@property BOOL isFirstItem;

@end

@implementation DinerItemViewController

///////////////////////
// Inherited methods //
///////////////////////
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    UIViewController *previous = [self.navigationController.viewControllers objectAtIndex:(self.navigationController.viewControllers.count - 2)];
    self.isFirstItem = NO;
    if ([previous isKindOfClass:[DinerItemViewController class]]) {
        self.isFirstItem = YES;
    }
    
    self.buttonDone.alpha = 0.0;
    self.labelDinerName.text = self.diner.name;
    [self.fieldItemAmount setPriceDecimal2:0];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillShow:)
                                                 name:UIKeyboardWillShowNotification
                                               object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillHide:)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];

}

- (void)viewDidAppear:(BOOL)animated {
    // Keyboard stuff
    // If we want keybaord to show up on load
    [self.fieldItemAmount becomeFirstResponder];
    
}

- (void)viewWillDisappear:(BOOL)animated {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)viewDidUnload {
    [self setLabelDinerName:nil];
    [self setFieldItemAmount:nil];
    [self setButtonDone:nil];
    [super viewDidUnload];
}

//////////////////////
// IBAction methods //
//////////////////////
- (IBAction)buttonNextItemClicked:(id)sender {
    UIStoryboard *storyboard = self.storyboard;
    DinerItemViewController *nextItem = [storyboard instantiateViewControllerWithIdentifier:@"DinerItemViewController"];
    
    [self.navigationController pushViewController:nextItem animated:YES];
}

- (IBAction)buttonBackClicked:(id)sender {
    if (self.isFirstItem) {
        [self.navigationController popViewControllerAnimated:YES];
        return;
    }
    
    OverviewViewController *backToScreen;
    for (id item in self.navigationController.viewControllers) {
        if ([item isKindOfClass:[OverviewViewController class]]) {
            backToScreen = item;
            break;
        }
    }
    [self.navigationController popToViewController:backToScreen animated:YES];
}

- (IBAction)buttonDoneClicked:(id)sender {
    [self.fieldItemAmount resignFirstResponder];
}

//////////////////////////
// Notification methods //
//////////////////////////
- (void)keyboardWillShow:(NSNotification *)notification {
    NSLog(@"keyboardWillShow");
    NSDictionary* info = [notification userInfo];
    NSValue* value = [info objectForKey:UIKeyboardAnimationDurationUserInfoKey];
    NSTimeInterval duration = 0;
    [value getValue:&duration];
    [UIView animateWithDuration:duration animations:^{
        self.buttonDone.alpha = 1.0;
    }];
}

- (void)keyboardWillHide:(NSNotification *)notification {
    NSLog(@"keyboardWillHide totlaAmount");
    NSDictionary* info = [notification userInfo];
    NSValue* value = [info objectForKey:UIKeyboardAnimationDurationUserInfoKey];
    NSTimeInterval duration = 0;
    [value getValue:&duration];
    [UIView animateWithDuration:duration animations:^{
        self.buttonDone.alpha = 0.0;
    }];
    
    [self.fieldItemAmount getPriceDecimal2];
   // [self refreshAllLabels];
}

@end
