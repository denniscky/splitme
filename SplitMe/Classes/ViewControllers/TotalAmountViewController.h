//
//  ViewController.h
//  SplitMe
//
//  Created by Dennis on 1/5/13.
//  Copyright (c) 2013 Dennis Chan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TotalAmountViewController : UIViewController <UITextFieldDelegate>

@property NSUInteger dinerCount;
@property NSUInteger totalAmountDecimal2;

@property (weak, nonatomic) IBOutlet UITextField *fieldTotalAmount;
@property (weak, nonatomic) IBOutlet UILabel *labelDinerCount;
@property (weak, nonatomic) IBOutlet UIButton *buttonNext;
@property (weak, nonatomic) IBOutlet UIButton *buttonBack;
@property (weak, nonatomic) IBOutlet UIButton *buttonDone;

@end
