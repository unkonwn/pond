//
//  SJAdViewController.m
//  SleepyFish
//
//  Created by sj on 2019/4/7.
//  Copyright © 2019年 sj. All rights reserved.
//

#import "SJAdViewController.h"

@interface SJAdViewController ()

@property (weak, nonatomic) IBOutlet UIButton *btnRemind;
@property (weak, nonatomic) IBOutlet UIImageView *adImgView;

@end

@implementation SJAdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self setupLaunchImage];
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
