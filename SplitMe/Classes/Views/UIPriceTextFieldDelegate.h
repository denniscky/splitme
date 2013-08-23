//
//  UIPriceTextFieldDelegate.h
//  SplitMe
//
//  Created by Dennis on 8/19/13.
//  Copyright (c) 2013 Dennis Chan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UIPriceTextFieldDelegate : NSObject <UITextFieldDelegate>

@property (weak, nonatomic) id<UITextFieldDelegate> delegate;

- (NSString *)numberToPriceString:(NSUInteger)number doPadZero:(BOOL)doPadZero;
- (NSString *)numberStringToPriceString:(NSString *)numberString doPadZero:(BOOL)doPadZero;
- (NSInteger)getPriceDecimal2:(UITextField *)textField;

@end
