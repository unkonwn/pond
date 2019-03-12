//
//  MyTabBarController.m
//  SleepyFish
//
//  Created by sj on 2019/2/21.
//  Copyright © 2019年 sj. All rights reserved.
//

#import "MyTabBarController.h"
#import "ZJNavigationController.h"

#define RGBACOLOR(r,g,b,a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]

@interface MyTabBarController ()

@end

@implementation MyTabBarController

- (void)viewDidLoad {
    
   
    
    self.separateBtnIndex = 2;
    //   self.interceptIndex = 3;
    //是否超出tabBar
    self.isSeparateBtnHit = YES;
    
    self.isSwitchingTheme = YES;//切换主题
    
    [super viewDidLoad];
    
    //    self.isIntercept = YES;
    
    self.defaultSelectedIndex = 0;
    
}

-(void)setUPAllChildViewController{
    
    self.childItemsArray = @[@[
                                 @{kClassKey  : @"MainPage",
                                   kTitleKey  : @"首页",
                                   kImgKey    : @"shouyexuanzhong",
                                   kSelImgKey : @"shouye"},
                                 
                                 @{kClassKey  : @"TakingOrder",
                                   kTitleKey  : @"接单",
                                   kImgKey    : @"fuwu",
                                   kSelImgKey : @"fuwuxuanzhong"},
                                 
                                 @{kClassKey  : @"Release",
                                   kTitleKey  : @"发布",
                                   kImgKey    : @"添加",
                                   kSelImgKey : @"添加"},
                                 
                                 @{kClassKey  : @"MyNews",
                                   kTitleKey  : @"消息",
                                   kImgKey    : @"fuwu",
                                   kSelImgKey : @"fuwuxuanzhong"},
                                 
                                 @{kClassKey  : @"PersonalCenter",
                                   kTitleKey  : @"我的",
                                   kImgKey    : @"wode",
                                   kSelImgKey : @"wodexuanzhong"},
                                 ],
                             ];
    
    
    
    self.itemNomalColor = RGBACOLOR(102, 102, 102, 1.0);
    
    self.itemSelectedColor =  RGBACOLOR(63, 101, 186, 1.0);
    
    [super setUPAllChildViewController];
    
}


- (void)tabBarDidselectedButtonFrom:(int)from to:(int)to block:(void (^)())success_block{
    
    
    
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
