//
//  SessionDataController.h
//  SplitMe
//
//  Created by Dennis on 8/14/13.
//  Copyright (c) 2013 Dennis Chan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DinerInfo.h"

#define MAX_DINER 20

@interface SessionDataController : NSObject

+ (SessionDataController *)sharedInstance;

@property NSUInteger dinerCount;
@property NSUInteger totalAmountDecimal2;
@property (nonatomic, copy) NSArray *diners;

- (void)beginSession;

@end
