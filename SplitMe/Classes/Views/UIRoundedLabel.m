//
//  UIRoundedLabel.m
//  RubberDuckIpad
//
//  Created by Dennis on 6/21/13.
//  Copyright (c) 2013 Captain Planner. All rights reserved.
//

#import "UIRoundedLabel.h"
#import <QuartzCore/QuartzCore.h>

#define DEFAULT_RAD 6.0

@implementation UIRoundedLabel

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self.layer setCornerRadius:5.0];
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
