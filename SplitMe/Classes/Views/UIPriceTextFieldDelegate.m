//
//  UIPriceTextFieldDelegate.m
//  SplitMe
//
//  Created by Dennis on 8/19/13.
//  Copyright (c) 2013 Dennis Chan. All rights reserved.
//

#import "UIPriceTextFieldDelegate.h"
#import "UIPriceTextField.h"

@implementation UIPriceTextFieldDelegate

- (NSString *)numberToPriceString:(NSUInteger)number doPadZero:(BOOL)doPadZero {
    NSString *numberString = number == 0 ? @"" : [NSString stringWithFormat:@"%d", number];
    return [self numberStringToPriceString:numberString doPadZero:doPadZero];
}

- (NSString *)numberStringToPriceString:(NSString *)numberString doPadZero:(BOOL)doPadZero {
    NSMutableString *result = [NSMutableString stringWithString:numberString];
    while (result.length < 3) {
        doPadZero ? [result insertString:@"0" atIndex:0] : [result insertString:@" " atIndex:0];
    }
    [result insertString:@"$" atIndex:0];
    [result insertString:@"." atIndex:result.length-2];
    return result;
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)addedString
{
    NSLog(@"shouldChangeCharactersInRange |%@| %d %d |%@|", textField.text, range.length, range.location, addedString);
    
    NSString *justNumbers = [textField.text stringByReplacingOccurrencesOfString:@"$" withString:@""];
    justNumbers = [justNumbers stringByReplacingOccurrencesOfString:@"." withString:@""];
    justNumbers = [justNumbers stringByReplacingOccurrencesOfString:@" " withString:@""];
    if ([addedString isEqualToString:@""]) {
        if (justNumbers.length > 0) {
            justNumbers = [justNumbers substringToIndex:justNumbers.length-1];
        }
    }
    else {
        justNumbers = [justNumbers stringByAppendingString:addedString];
    }
    
    textField.text = [self numberStringToPriceString:justNumbers doPadZero:NO];
    
    return NO;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    textField.text = [self numberToPriceString:0 doPadZero:textField.editing];
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    textField.text = [self numberToPriceString:0 doPadZero:textField.editing];
}

@end
