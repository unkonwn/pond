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

@interface MainPageController () 

@end

@implementation MainPageController


/**
 控制器生命周期
 */
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    MainPageTopView *topView = [[MainPageTopView alloc] init];
    [topView setFrame:CGRectMake(0, kRectNavAndStatusHight, kScreenWidth, kScreenHeight/5)];
    [self.view addSubview:topView];
    
//    topView.delegate = self;
    
    topView.topViewTypeBlock = ^(NSString *typeTile) {
        NSLog(@"%@",typeTile); //需要传给listCon去请求不同类别的商品
        SJGoodsListController *goodListCon = [[SJGoodsListController alloc] init];
        [self.navigationController pushViewController:goodListCon animated:YES];
    };
    
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




@end
