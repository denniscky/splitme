//
//  SessionDataController.m
//  SplitMe
//
//  Created by Dennis on 8/14/13.
//  Copyright (c) 2013 Dennis Chan. All rights reserved.
//

#import "SessionDataController.h"

@implementation SessionDataController

static SessionDataController *sharedInstance = nil;

+ (SessionDataController *)sharedInstance {
    if (nil != sharedInstance) {
        return sharedInstance;
    }
    
    static dispatch_once_t pred;        // Lock
    dispatch_once(&pred, ^{             // This code is called at most once per app
        sharedInstance = [[SessionDataController alloc] init];
    });
    return sharedInstance;
}

- (void)beginSession {
    NSAssert(self.dinerCount > 0, @"Diner count is not a positive number");
    NSMutableArray *diners = [NSMutableArray arrayWithCapacity:self.dinerCount];
    for (NSUInteger i = 0; i < self.dinerCount; i++) {
        [diners addObject:[[DinerInfo alloc] initWithDinerNumber:i+1]];
    }
    self.diners = diners;
    for (DinerInfo *diner in self.diners) {
        NSLog(@"%@", diner.name);
    }
}


@end
