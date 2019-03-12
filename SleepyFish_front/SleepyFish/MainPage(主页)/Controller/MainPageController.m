//
//  MainPageController.m
//  SleepyFish
//
//  Created by sj on 2019/2/21.
//  Copyright © 2019年 sj. All rights reserved.
//

#import "MainPageController.h"
#import "MainPageTopView.h"
#import "SJGoodsListController.h"

@interface MainPageController ()<MainPageTopViewDelegate>

@end

@implementation MainPageController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    MainPageTopView *topView = [[MainPageTopView alloc] init];
    [topView setFrame:CGRectMake(0, kRectNavAndStatusHight, kScreenWidth, kScreenHeight/5)];
    [self.view addSubview:topView];
    topView.delegate = self;
    
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)go2GoodList:(UIView *)mainPageView withGoodType:(NSString *)goodType{
    NSLog(@"%@",goodType);
    SJGoodsListController *goodList = [[SJGoodsListController alloc] init];
    [self.navigationController pushViewController:goodList animated:YES];
}

@end
