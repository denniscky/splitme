//
//  DinerItemViewController.m
//  SplitMe
//
//  Created by Dennis on 8/19/13.
//  Copyright (c) 2013 Dennis Chan. All rights reserved.
//

#import "DinerItemViewController.h"
#import "OverviewViewController.h"

#define kBorderWidth 4

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
    [self.diner print];
    
    UIViewController *previous = [self.navigationController.viewControllers objectAtIndex:(self.navigationController.viewControllers.count - 2)];
    self.isFirstItem = NO;
    if ([previous isKindOfClass:[DinerItemViewController class]]) {
        self.isFirstItem = YES;
    }
    
    self.buttonDone.alpha = 0.0;
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillShow:)
                                                 name:UIKeyboardWillShowNotification
                                               object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillHide:)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];
    
    self.currentType = APPETIZER;
    self.labelDinerName.text = self.diner.name;
    [self.fieldItemAmount setPriceDecimal2:0];
    [self refreshUIElements];
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
    [self setButtonAppetizer:nil];
    [self setButtonEntree:nil];
    [self setButtonDessert:nil];
    [self setButtonDrink:nil];
    [super viewDidUnload];
}

//////////////////////
// IBAction methods //
//////////////////////
- (IBAction)buttonNextItemClicked:(id)sender {
    DinerItem *newItem = [[DinerItem alloc] init];
    newItem.priceDecimal2 = [self.fieldItemAmount getPriceDecimal2];
    newItem.type = self.currentType;
    
   // [self.diner addDinerItem:newItem];
    [self.diner.items addObject:newItem];
    NSLog(@"current count = %d", self.diner.items.count);
    
    UIStoryboard *storyboard = self.storyboard;
    DinerItemViewController *nextItem = [storyboard instantiateViewControllerWithIdentifier:@"DinerItemViewController"];
    nextItem.diner = self.diner;
    
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

- (IBAction)buttonTypeClicked:(id)sender {
    self.currentType = ((UIButton *)sender).tag;
    [self refreshUIElements];
}


////////////////////
// Helper methods //
////////////////////
- (void)refreshUIElements {
    self.buttonAppetizer.border = self.currentType == APPETIZER ? kBorderWidth : 0;
    self.buttonEntree.border = self.currentType == ENTREE ? kBorderWidth : 0;
    self.buttonDessert.border = self.currentType == DESSERT ? kBorderWidth : 0;
    self.buttonDrink.border = self.currentType == DRINK ? kBorderWidth : 0;
}

//////////////////////////
// Notification methods //
//////////////////////////
- (void)keyboardWillShow:(NSNotification *)notification {
    NSDictionary* info = [notification userInfo];
    NSValue* value = [info objectForKey:UIKeyboardAnimationDurationUserInfoKey];
    NSTimeInterval duration = 0;
    [value getValue:&duration];
    [UIView animateWithDuration:duration animations:^{
        self.buttonDone.alpha = 1.0;
    }];
}

- (void)keyboardWillHide:(NSNotification *)notification {
    NSDictionary* info = [notification userInfo];
    NSValue* value = [info objectForKey:UIKeyboardAnimationDurationUserInfoKey];
    NSTimeInterval duration = 0;
    [value getValue:&duration];
    [UIView animateWithDuration:duration animations:^{
        self.buttonDone.alpha = 0.0;
    }];
}

@end
