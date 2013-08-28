//
//  DinerItem.m
//  SplitMe
//
//  Created by Dennis on 8/25/13.
//  Copyright (c) 2013 Dennis Chan. All rights reserved.
//

#import "FoodItem.h"

@implementation FoodItem

- (void)print {
    NSLog(@"  $%.02f (type %d)", self.priceDecimal2 / 100.0, self.type);
}

@end
