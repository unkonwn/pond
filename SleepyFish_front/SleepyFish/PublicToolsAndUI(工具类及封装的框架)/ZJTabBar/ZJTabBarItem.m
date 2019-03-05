//
//  ZJTabBarItem.m
//  SleepyFish
//
//  Created by sj on 2019/2/21.
//  Copyright © 2019年 sj. All rights reserved.
//

#import "ZJTabBarItem.h"
#import "ZJTabBarItem.h"

@implementation ZJTabBarItem

- (void)setFont:(UIFont *)font{
    _font = font;
    if (_font == nil) {
        _font = [UIFont systemFontOfSize:14];
    }
    
}

- (void)setItemSelectedColor:(UIColor *)itemSelectedColor{
    //    _itemSelectedColor = itemSelectedColor;
    //    if(!_itemSelectedColor){
    //        _itemSelectedColor = [UIColor blackColor];
    //    }
    
    _itemSelectedColor = [UIColor blackColor];
}
@end
