//
//  UIRoundedView.m
//  RubberDuckIpad
//
//  Created by Dennis on 6/21/13.
//  Copyright (c) 2013 Captain Planner. All rights reserved.
//

#import "UIRoundedView.h"
#import <QuartzCore/QuartzCore.h>

#define DEFAULT_RAD 6.0

@implementation UIRoundedView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib
{
    float radius = DEFAULT_RAD;
    if (self.tag > 0 && self.tag < 100) {
        radius = self.tag;
    }
    [self.layer setCornerRadius:radius];
    if (self.border > 0) {
        if (self.borderColor) {
            self.layer.borderColor = self.borderColor.CGColor;
        }
        else {
            self.layer.borderColor = [UIColor colorWithRed:189.0/255.0 green:193.0/255.0 blue:197.0/255.0 alpha:1.0].CGColor;
        }
        self.layer.borderWidth = self.border;
    }
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
