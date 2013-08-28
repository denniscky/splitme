//
//  DinerItem.h
//  SplitMe
//
//  Created by Dennis on 8/25/13.
//  Copyright (c) 2013 Dennis Chan. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    APPETIZER = 1,
    ENTREE = 2,
    DESSERT = 3,
    DRINK = 4
} FoodItemType;

@interface FoodItem : NSObject

@property FoodItemType type;
@property NSUInteger priceDecimal2;

- (void)print;

@end
