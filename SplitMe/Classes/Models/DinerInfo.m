//
//  DinerInfo.m
//  SplitMe
//
//  Created by Dennis on 8/19/13.
//  Copyright (c) 2013 Dennis Chan. All rights reserved.
//

#import "DinerInfo.h"

#define kSaturation 0.71f
#define kBrightness 0.44f

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
        
        self.number = number;
        self.name = [[NSString stringWithFormat:@"Diner %@", wordNumber] capitalizedString];
        self.items = [NSMutableArray array];
        self.color = [self generateColorFromNumber:number];
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
- (UIColor *)generateColorFromNumber:(NSUInteger)number {
    NSUInteger hueInt = (212 + 126 * number) % 360;
    //NSLog(@"hueInt = %d", hueInt);
    CGFloat hue = hueInt / 360.0f;
    return [UIColor colorWithHue:hue saturation:kSaturation brightness:kBrightness alpha:1.0f];
}

- (void)print {
    NSLog(@" Name: \"%@\"", self.name);
    NSLog(@" Items (%d):", self.items.count);
    for (FoodItem *item in self.items) {
        [item print];
    }
}

@end
