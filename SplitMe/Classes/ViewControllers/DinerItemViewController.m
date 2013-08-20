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
    self.labelDinerName.text = self.diner.name;
    [self.fieldItemAmount setPriceDecimal2:0];
}

- (void)viewDidAppear:(BOOL)animated {
    // Keyboard stuff
    // If we want keybaord to show up on load
    [self.fieldItemAmount becomeFirstResponder];
//    [[NSNotificationCenter defaultCenter] addObserver:self
//                                             selector:@selector(keyboardWillShow:)
//                                                 name:UIKeyboardWillShowNotification
//                                               object:nil];
//    [[NSNotificationCenter defaultCenter] addObserver:self
//                                             selector:@selector(keyboardDidShow:)
//                                                 name:UIKeyboardDidShowNotification
//                                               object:nil];
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
}

//////////////////////////
// Notification methods //
//////////////////////////
//- (void)keyboardWillShow:(NSNotification *)notification {
//    [UIView setAnimationsEnabled:NO]; // For showing a textField on load
//}
//
//- (void)keyboardDidShow:(NSNotification *)notification {
//    [UIView setAnimationsEnabled:YES]; // For showing a textField on load
//}

@end
