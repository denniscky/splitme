//
//  AnySharedItemsViewController.m
//  SplitMe
//
//  Created by Dennis on 1/6/13.
//  Copyright (c) 2013 Dennis Chan. All rights reserved.
//

#import "AnySharedItemsViewController.h"
#import "AddSharedItemViewController.h"

@interface AnySharedItemsViewController () <AddSharedItemViewControllerDelegate>

@end

@implementation AnySharedItemsViewController

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"ShowAddSharedItems"]) {
        AddSharedItemViewController *dest = [[segue.destinationViewController viewControllers] objectAtIndex:0];
        dest.delegate = self;
    }
}

- (void)AddSharedItemViewControllerDidFinish:(AddSharedItemViewController *)controller
{
    // [self.navigationController popViewControllerAnimated:NO];
    [self performSegueWithIdentifier:@"ShowReviewSharedItems" sender:self];
    [self dismissModalViewControllerAnimated:YES];
}

@end
