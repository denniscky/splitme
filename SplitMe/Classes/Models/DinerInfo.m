//
//  DinerInfo.m
//  SplitMe
//
//  Created by Dennis on 8/19/13.
//  Copyright (c) 2013 Dennis Chan. All rights reserved.
//

#import "DinerInfo.h"

@implementation DinerInfo

- (id)initWithNumber:(NSUInteger)number {
    self = [super init];
    if (self) {
        NSString *wordNumber;
        NSNumber *numberValue = [NSNumber numberWithInt:number];
        NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
        [numberFormatter setNumberStyle:NSNumberFormatterSpellOutStyle];
        wordNumber = [numberFormatter stringFromNumber:numberValue];
        self.name = [[NSString stringWithFormat:@"Diner %@", wordNumber] capitalizedString];
    }
    return self;
}

@end
