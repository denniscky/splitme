//
//  AddSharedItemViewController.h
//  SplitMe
//
//  Created by Dennis on 1/6/13.
//  Copyright (c) 2013 Dennis Chan. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol AddSharedItemViewControllerDelegate;

@interface AddSharedItemViewController : UIViewController

@property (weak, nonatomic) id<AddSharedItemViewControllerDelegate> delegate;

@end


// Delegate protocol

@protocol AddSharedItemViewControllerDelegate <NSObject>
- (void)AddSharedItemViewControllerDidFinish:(AddSharedItemViewController *)controller;
@end
