//
//  DinerItem.m
//  SplitMe
//
//  Created by Dennis on 8/25/13.
//  Copyright (c) 2013 Dennis Chan. All rights reserved.
//

#import "DinerItem.h"

@implementation DinerItem

- (void)print {
    NSLog(@"  Type: %d, Amount: $%.02f", self.type, self.priceDecimal2 / 100.0);
}

@end
