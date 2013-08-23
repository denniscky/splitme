//
//  DinerItemViewController.h
//  SplitMe
//
//  Created by Dennis on 8/19/13.
//  Copyright (c) 2013 Dennis Chan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DinerInfo.h"
#import "UIPriceTextField.h"

@interface DinerItemViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *labelDinerName;
@property (weak, nonatomic) IBOutlet UIPriceTextField *fieldItemAmount;
@property (weak, nonatomic) DinerInfo *diner;
@property (weak, nonatomic) IBOutlet UIButton *buttonDone;

@end
