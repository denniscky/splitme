//
//  DinerInfo.h
//  SplitMe
//
//  Created by Dennis on 8/19/13.
//  Copyright (c) 2013 Dennis Chan. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "DinerItem.h"

@interface DinerInfo : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSMutableArray *items;

- (id)initWithDinerNumber:(NSUInteger)number;
//- (void)addDinerItem:(DinerItem *)item;
- (void)print;

@end
