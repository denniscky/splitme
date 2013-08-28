//
//  DinerReadyViewController.h
//  SplitMe
//
//  Created by Dennis on 8/19/13.
//  Copyright (c) 2013 Dennis Chan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DinerInfo.h"
#import "ItemInputAbstractViewController.h"

@interface DinerReadyViewController : ItemInputAbstractViewController

@property (weak, nonatomic) DinerInfo *diner;
@property (weak, nonatomic) IBOutlet UILabel *labelDinerName;

@end
