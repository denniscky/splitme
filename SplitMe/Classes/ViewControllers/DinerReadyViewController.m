//
//  DinerReadyViewController.m
//  SplitMe
//
//  Created by Dennis on 8/19/13.
//  Copyright (c) 2013 Dennis Chan. All rights reserved.
//

#import "DinerReadyViewController.h"
#import "DinerItemViewController.h"
#import "SessionDataController.h"

@interface DinerReadyViewController ()

@end

@implementation DinerReadyViewController

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
    self.labelDinerName.text = self.diner.name;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setLabelDinerName:nil];
    [super viewDidUnload];
}

//////////////////////
// IBAction methods //
//////////////////////

////////////////////
// Helper methods //
////////////////////
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"SegueAfterDinerReady"]) {
        DinerItemViewController *nextScreen = (DinerItemViewController *)segue.destinationViewController;
        nextScreen.diner = self.diner;
    }
}

//////////////////////
// Delegate methods //
//////////////////////

@end
