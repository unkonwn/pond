//
//  ZJNavigationController.m
//  SleepyFish
//
//  Created by sj on 2019/2/21.
//  Copyright © 2019年 sj. All rights reserved.
//

#import "ZJNavigationController.h"
#import "UIBarButtonItem+Item.h"

@interface ZJNavigationController () <UIGestureRecognizerDelegate>

@end


@implementation ZJNavigationController

+ (void)load{
    NSMutableDictionary *atts = [NSMutableDictionary dictionary];
    atts[NSFontAttributeName] = [UIFont boldSystemFontOfSize:20];
    UINavigationBar *navBar = [UINavigationBar appearanceWhenContainedInInstancesOfClasses:@[self]];
    [navBar setTitleTextAttributes:atts];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // self.navigationBarHidden = YES;
    /**
     事实上对于一个视图控制器而言，该属性的默认值即为YES，因此不设置也能实现右滑pop的功能。然而这个功能很有局限性，因为它不允许当前视图控制器自定义了leftBarButtonItem，一旦自定义，右滑功能就会失效
     */
    //只有非根控制器才有滑动返回功能
    self.interactivePopGestureRecognizer.delegate = self;
    self.navigationBar.backgroundColor = [UIColor blueColor];
//    NSLog(@"%@",self.childViewControllers);
    
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch{
    return self.childViewControllers.count > 1;
}
/**
 *  @author zhengju, 16-05-23 17:05:28
 *
 *  @brief 重写这个方法，能拦截所有的push方法
 *
 *  @param viewController 下一级视图控制器
 *  @param animated       是否带动画
 */
-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    
    if (self.viewControllers.count > 0) {
        
        viewController.hidesBottomBarWhenPushed=YES;
        viewController.navigationItem.leftBarButtonItem = [UIBarButtonItem backItemWithimage:[UIImage imageNamed:@"白色返回按钮"] highImage:[UIImage imageNamed:@"白色返回按钮"] target:self action:@selector(back) title:@"返回"];
        
    }
    
    [super pushViewController:viewController animated:YES];
}

- (void)back{
    [self popViewControllerAnimated:YES];
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
