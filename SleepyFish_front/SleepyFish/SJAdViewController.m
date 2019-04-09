//
//  SJAdViewController.m
//  SleepyFish
//
//  Created by sj on 2019/4/7.
//  Copyright © 2019年 sj. All rights reserved.
//

#import "SJAdViewController.h"
#import "SJGlobeConst.h"

#define adParams @"phcqnauGuHYkFMRquANhmgN_IauBThfqmgKsUARhIWdGULPxnz3vndtkQW08nau_I1Y1P1Rhmhwz5Hb8nBuL5HDknWRhTA_qmvqVQhGGUhI_py4MQhF1TvChmgKY5H6hmyPW5RFRHzuET1dGULnhuAN85HchUy7s5HDhIywGujY3P1n3mWb1PvDLnvF-Pyf4mHR4nyRvmWPBmhwBPjcLPyfsPHT3uWm4FMPLpHYkFh7sTA-b5yRzPj6sPvRdFhPdTWYsFMKzuykEmyfqnauGuAu95Rnsnbfknbm1QHnkwW6VPjujnBdKfWD1QHnsnbRsnHwKfYwAwiu9mLfqHbD_H70hTv6qnHn1PauVmynqnjclnj0lnj0lnj0lnj0lnj0hThYqniuVujYkFhkC5HRvnB3dFh7spyfqnW0srj64nBu9TjYsFMub5HDhTZFEujdzTLK_mgPCFMP85Rnsnbfknbm1QHnkwW6VPjujnBdKfWD1QHnsnbRsnHwKfYwAwiuBnHfdnjD4rjnvPWYkFh7sTZu-TWY1QW68nBuWUHYdnHchIAYqPHDzFhqsmyPGIZbqniuYThuYTjd1uAVxnz3vnzu9IjYzFh6qP1RsFMws5y-fpAq8uHT_nBuYmycqnau1IjYkPjRsnHb3n1mvnHDkQWD4niuVmybqniu1uy3qwD-HQDFKHakHHNn_HR7fQ7uDQ7PcHzkHiR3_RYqNQD7jfzkPiRn_wdKHQDP5HikPfRb_fNc_NbwPQDdRHzkDiNchTvwW5HnvPj0zQWndnHRvnBsdPWb4ri3kPW0kPHmhmLnqPH6LP1ndm1-WPyDvnHKBrAw9nju9PHIhmH9WmH6zrjRhTv7_5iu85HDhTvd15HDhTLTqP1RsFh4ETjYYPW0sPzuVuyYqn1mYnjc8nWbvrjTdQjRvrHb4QWDvnjDdPBuk5yRzPj6sPvRdgvPsTBu_my4bTvP9TARqnam"

@interface SJAdViewController ()

@property (weak, nonatomic) IBOutlet UIButton *btnRemind;
@property (weak, nonatomic) IBOutlet UIImageView *adImgView;

@end

@implementation SJAdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self setupLaunchImage];
    [self loadAdDat];
}

- (void)loadAdDat{
    NSMutableDictionary *paramsDic = [NSMutableDictionary dictionary];
    paramsDic[@"code2"] = adParams;
    [NetworkTool Get:adUrl parameters:paramsDic success:^(NSDictionary *response, AFHTTPRequestOperation *operation) {
        NSLog(@"-----%@",response);
    } failure:^(NSError *error, AFHTTPRequestOperation *operation) {
       NSLog(@"-----%@",error);
    } isHUD:NO];

}

// 设置启动图片
- (void)setupLaunchImage
{
    // 6p:LaunchImage-800-Portrait-736h@3x.png
    // 6:LaunchImage-800-667h@2x.png
    // 5:LaunchImage-568h@2x.png
    // 4s:LaunchImage@2x.png
    if (IS_IPHONE_Xs_Max) {
        self.adImgView.image = [UIImage imageNamed:@"LaunchImage-800-Portrait-736h@3x"];
    }
    else if (IS_IPHONE_Xs) {
        self.adImgView.image = [UIImage imageNamed:@"LaunchImage-800-Portrait-736h@3x"];
    }
    else if (IS_IPHONE_Xr){
        self.adImgView.image = [UIImage imageNamed:@"LaunchImage-800-Portrait-736h@3x"];
    }
    else if (IS_IPHONE_X){
        self.adImgView.image = [UIImage imageNamed:@"LaunchImage-800-Portrait-736h@3x"];
    }
    else if (kiPhone6Plus) { // 6p/7p/8p
        self.adImgView.image = [UIImage imageNamed:@"LaunchImage-800-Portrait-736h@3x"];
    } else if (kiPhone6) { // 6/7/8/6s/7s/8s
        self.adImgView.image = [UIImage imageNamed:@"LaunchImage-800-667h"];
    } else if (kiPhone5) { // 5
        self.adImgView.image = [UIImage imageNamed:@"LaunchImage-568h"];
        
    } else if (kiPhone4) { // 4
        self.adImgView.image = [UIImage imageNamed:@"LaunchImage-700"];
    }
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
