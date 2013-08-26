//
//  DinerInfo.m
//  SplitMe
//
//  Created by Dennis on 8/19/13.
//  Copyright (c) 2013 Dennis Chan. All rights reserved.
//

#import "DinerInfo.h"

@interface DinerInfo ()

@end

@implementation DinerInfo

- (id)initWithDinerNumber:(NSUInteger)number {
    self = [super init];
    if (self) {
        NSString *wordNumber;
        NSNumber *numberValue = [NSNumber numberWithInt:number];
        NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
        [numberFormatter setNumberStyle:NSNumberFormatterSpellOutStyle];
        wordNumber = [numberFormatter stringFromNumber:numberValue];
        self.name = [[NSString stringWithFormat:@"Diner %@", wordNumber] capitalizedString];
        self.items = [NSMutableArray array];
    }
    return self;
}

- (void)setItems:(NSMutableArray *)newList {
    if (_items != newList) {
        _items = [newList mutableCopy];
    }
}

//- (void)addDinerItem:(DinerItem *)item {
//    [self.items addObject:item];
//}

- (void)print {
    NSLog(@" Name: \"%@\"", self.name);
    NSLog(@" Items (%d):", self.items.count);
    for (DinerItem *item in self.items) {
        [item print];
    }
}

@end
