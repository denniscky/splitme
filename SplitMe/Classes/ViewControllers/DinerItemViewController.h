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
#import "UIBorderedButton.h"
#import "FoodItem.h"

@interface DinerItemViewController : UIViewController

@property (weak, nonatomic) DinerInfo *diner;
@property FoodItemType currentType;

@property (weak, nonatomic) IBOutlet UILabel *labelDinerName;
@property (weak, nonatomic) IBOutlet UIPriceTextField *fieldItemAmount;
@property (weak, nonatomic) IBOutlet UIButton *buttonDone;
@property (weak, nonatomic) IBOutlet UIBorderedButton *buttonAppetizer;
@property (weak, nonatomic) IBOutlet UIBorderedButton *buttonEntree;
@property (weak, nonatomic) IBOutlet UIBorderedButton *buttonDessert;
@property (weak, nonatomic) IBOutlet UIBorderedButton *buttonDrink;
@property (weak, nonatomic) IBOutlet UIView *viewDinerName;
@property (weak, nonatomic) IBOutlet UIButton *buttonFinished;


@end
