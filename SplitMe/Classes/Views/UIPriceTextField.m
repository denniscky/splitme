//
//  UIPriceTextField.m
//  SplitMe
//
//  Created by Dennis on 8/19/13.
//  Copyright (c) 2013 Dennis Chan. All rights reserved.
//

#import "UIPriceTextField.h"
#import "UIPriceTextFieldDelegate.h"

@implementation UIPriceTextField

- (id)initWithCoder:(NSCoder *)aDecoder {
    NSLog(@"initWithCoder");
    self = [super initWithCoder:aDecoder];
    if (self) {
        // Initialization code
        [super setDelegate: [[UIPriceTextFieldDelegate alloc] init]];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    NSLog(@"Initwithframe");
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [super setDelegate: [[UIPriceTextFieldDelegate alloc] init]];
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
 */

- (void)refreshDisplay:(NSInteger)price {
    self.text = [self numberToPriceString:price doPadZero:self.editing];
}

- (void)setPriceDecimal2:(NSInteger)price {
    [self refreshDisplay:price];
}

- (NSInteger)getPriceDecimal2 {
    NSString *justNumbers = [self.text stringByReplacingOccurrencesOfString:@"$" withString:@""];
    justNumbers = [justNumbers stringByReplacingOccurrencesOfString:@"." withString:@""];
    justNumbers = [justNumbers stringByReplacingOccurrencesOfString:@" " withString:@""];
    return [justNumbers intValue];
}

//- (NSInteger)priceDecimal2 {
//    NSString *justNumbers = [self.text stringByReplacingOccurrencesOfString:@"$" withString:@""];
//    justNumbers = [justNumbers stringByReplacingOccurrencesOfString:@"." withString:@""];
//    justNumbers = [justNumbers stringByReplacingOccurrencesOfString:@" " withString:@""];
//    return [justNumbers intValue];
//}

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

//////////////////////
// Delegate methods //
//////////////////////
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
    [self refreshDisplay:[self getPriceDecimal2]];
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    [self refreshDisplay:[self getPriceDecimal2]];
}

@end
