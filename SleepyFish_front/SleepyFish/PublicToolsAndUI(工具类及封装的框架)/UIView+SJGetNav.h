//
//  UIView+SJGetNav.h
//  SleepyFish
//
//  Created by sj on 2019/3/12.
//  Copyright © 2019年 sj. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (SJGetNav)

- (UIViewController *)currentViewController;
- (UINavigationController *)currentNavigationController;
- (UINavigationController*)getNavigationController;

@end
