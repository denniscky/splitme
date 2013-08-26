//
//  UIBorderedButton.m
//  SplitMe
//
//  Created by Dennis on 8/25/13.
//  Copyright (c) 2013 Dennis Chan. All rights reserved.
//

#import "UIBorderedButton.h"
#import <QuartzCore/QuartzCore.h>

#define kDefaultR 50
#define kDefaultG 79
#define kDefaultB 133

@implementation UIBorderedButton

@synthesize border = _border;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

//- (void)awakeFromNib
//{
//    if (self.border > 0) {
//        if (self.borderColor) {
//            self.layer.borderColor = self.borderColor.CGColor;
//        }
//        else {
//            self.layer.borderColor = [UIColor colorWithRed:kDefaultR/255.0 green:kDefaultG/255.0 blue:kDefaultB/255.0 alpha:1.0].CGColor;
//        }
//        self.layer.borderWidth = self.border;
//    }
//}

- (void)setBorder:(NSInteger)border {
    //NSLog(@"setBorder");
    _border = border;
    if (self.borderColor) {
        self.layer.borderColor = self.borderColor.CGColor;
    }
    else {
        self.layer.borderColor = [UIColor colorWithRed:kDefaultR/255.0 green:kDefaultG/255.0 blue:kDefaultB/255.0 alpha:1.0].CGColor;
    }
    self.layer.borderWidth = _border;
}

- (NSInteger)border {
    //NSLog(@"border");
    return _border;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
