//
//  ZJTabBarButton.h
//  SleepyFish
//
//  Created by sj on 2019/2/21.
//  Copyright © 2019年 sj. All rights reserved.
//

#import <UIKit/UIKit.h>
#define ZJTabBarButtonImageRatio 0.6

@class ZJTabBarItem;
@interface ZJTabBarButton : UIButton
@property(nonatomic,strong)ZJTabBarItem *item;
@property(copy,nonatomic) NSString * badgeValue;
@end

#import "ZJTabBarButton.h"
@interface ZJTabBarNormalBtn : ZJTabBarButton

@end
