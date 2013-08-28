//
//  DinerInfo.h
//  SplitMe
//
//  Created by Dennis on 8/19/13.
//  Copyright (c) 2013 Dennis Chan. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "FoodItem.h"

@interface DinerInfo : NSObject

@property NSUInteger number;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSMutableArray *items;
@property (nonatomic, strong) UIColor *color;

- (id)initWithDinerNumber:(NSUInteger)number;
//- (void)addDinerItem:(DinerItem *)item;
- (void)print;

@end
