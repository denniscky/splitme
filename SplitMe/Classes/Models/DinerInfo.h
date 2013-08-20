//
//  DinerInfo.h
//  SplitMe
//
//  Created by Dennis on 8/19/13.
//  Copyright (c) 2013 Dennis Chan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DinerInfo : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSArray *items;

- (id)initWithNumber:(NSUInteger)number;

@end
