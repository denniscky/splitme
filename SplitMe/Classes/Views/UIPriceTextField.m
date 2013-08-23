//
//  UIPriceTextField.m
//  SplitMe
//
//  Created by Dennis on 8/19/13.
//  Copyright (c) 2013 Dennis Chan. All rights reserved.
//

#import "UIPriceTextField.h"
#import "UIPriceTextFieldDelegate.h"

@interface UIPriceTextField ()

// Need this redundant property to retain the delegate
@property (strong, nonatomic) UIPriceTextFieldDelegate *internalDelegate;

@end

@implementation UIPriceTextField

///////////////////////
// Inherited methods //
///////////////////////
- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        // Initialization code
        self.internalDelegate = [[UIPriceTextFieldDelegate alloc] init];
        self.delegate = self.internalDelegate;
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.internalDelegate = [[UIPriceTextFieldDelegate alloc] init];
        [super setDelegate:self.internalDelegate];
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

- (void)dealloc {
    self.internalDelegate = nil;
}

////////////////////
// Helper methods //
////////////////////
- (void)setExternalDelegate:(id<UITextFieldDelegate>)externalDelegate {
    NSLog(@"setExternalDelegate");
    self.internalDelegate.delegate = externalDelegate;
}

- (void)setPriceDecimal2:(NSInteger)price {
    self.text = [self.internalDelegate numberToPriceString:price doPadZero:!self.editing];
}

- (NSInteger)getPriceDecimal2 {
    return [self.internalDelegate getPriceDecimal2:self];
}

@end
