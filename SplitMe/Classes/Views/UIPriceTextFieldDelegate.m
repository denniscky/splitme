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

////////////////////
// Helper methods //
////////////////////
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

- (NSInteger)getPriceDecimal2:(UITextField *)textField {
    NSString *justNumbers = [textField.text stringByReplacingOccurrencesOfString:@"$" withString:@""];
    justNumbers = [justNumbers stringByReplacingOccurrencesOfString:@"." withString:@""];
    justNumbers = [justNumbers stringByReplacingOccurrencesOfString:@" " withString:@""];
    return [justNumbers intValue];
}

- (void)refreshPriceTextField:(UITextField *)textField {
    textField.text = [self numberToPriceString:[self getPriceDecimal2:textField] doPadZero:!textField.editing];
}

//////////////////////
// Delegate methods //
//////////////////////
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)addedString
{
   // NSLog(@"shouldChangeCharactersInRange |%@| %d %d |%@|", textField.text, range.length, range.location, addedString);
    
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
    //NSLog(@"textFieldDidBeginEditing");
    [self refreshPriceTextField:textField];
    if ([self.delegate respondsToSelector:@selector(textFieldDidBeginEditing:)])
        [self.delegate textFieldDidBeginEditing:textField];
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    //NSLog(@"textFieldDidEndEditing");
    [self refreshPriceTextField:textField];
    if ([self.delegate respondsToSelector:@selector(textFieldDidEndEditing:)])
        [self.delegate textFieldDidEndEditing:textField];
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    //NSLog(@"textFieldShouldBeginEditing %d", [self.delegate respondsToSelector:@selector(textFieldShouldBeginEditing:)]);
    if ([self.delegate respondsToSelector:@selector(textFieldShouldBeginEditing:)])
        return [self.delegate textFieldShouldBeginEditing:textField];
    else
        return true;
}

- (BOOL)textFieldShouldClear:(UITextField *)textField {
    //NSLog(@"textFieldShouldClear");
    if ([self.delegate respondsToSelector:@selector(textFieldShouldClear:)])
        return [self.delegate textFieldShouldClear:textField];
    else
        return true;
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField {
    //NSLog(@"textFieldShouldEndEditing");
    if ([self.delegate respondsToSelector:@selector(textFieldShouldEndEditing:)])
        return [self.delegate textFieldShouldEndEditing:textField];
    else
        return true;

}
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    //NSLog(@"textFieldShouldReturn");
    if ([self.delegate respondsToSelector:@selector(textFieldShouldReturn:)])
        return [self.delegate textFieldShouldReturn:textField];
    else
        return true;
}

@end
