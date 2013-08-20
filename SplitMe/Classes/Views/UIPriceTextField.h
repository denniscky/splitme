//
//  UIPriceTextField.h
//  SplitMe
//
//  Created by Dennis on 8/19/13.
//  Copyright (c) 2013 Dennis Chan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIPriceTextField : UITextField <UITextFieldDelegate>

- (void)setPriceDecimal2:(NSInteger)price;
- (NSInteger)getPriceDecimal2;

@end
