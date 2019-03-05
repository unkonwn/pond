//
//  ZJTabBarItem.h
//  SleepyFish
//
//  Created by sj on 2019/2/21.
//  Copyright © 2019年 sj. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZJTabBarItem : UITabBarItem
/**
 未选中字体颜色
 */
@property(strong,nonatomic) UIColor * itemNomalColor;
/**
 选中颜色
 */
@property(strong,nonatomic) UIColor * itemSelectedColor;
/**
 字体显示大小,默认字体大小为 14
 */
@property(nonatomic,strong) UIFont * font;
@end

