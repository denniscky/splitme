//
//  AddSharedItemViewController.m
//  SplitMe
//
//  Created by Dennis on 1/6/13.
//  Copyright (c) 2013 Dennis Chan. All rights reserved.
//

#import "AddSharedItemViewController.h"

@interface AddSharedItemViewController ()

@end

@implementation AddSharedItemViewController

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
- (IBAction)reviewItems:(id)sender {
    [self.delegate AddSharedItemViewControllerDidFinish:self];
}

@end
