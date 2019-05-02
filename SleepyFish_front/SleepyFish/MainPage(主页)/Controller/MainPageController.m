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
#import "SJGridCollectionCon.h"
#import "UIImageView+WebCache.h"
#import "SJRecommendCell.h"
#import "SJGoodDetailViewCon.h"
#import "UIColor+Hex.h"

static NSString * const recommendCellId = @"recommend";

@interface MainPageController ()

@property (nonatomic, strong) MainPageTopView *topView;
@property (nonatomic, strong) SJGridCollectionCon *gridCollection;
@property (nonatomic, strong) NSMutableArray *recommendingGoods;

@end

@implementation MainPageController


/**
 控制器生命周期
 */
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];

    [self.tableView setBackgroundColor:[UIColor colorWithHexString:@"#f5f5f5"]];
    //注册cell
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([SJRecommendCell class]) bundle:nil] forCellReuseIdentifier:recommendCellId];


}

-(MainPageTopView *)topView{
    if (!_topView) {
        MainPageTopView *topView = [[MainPageTopView alloc] init];
        [topView setFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight/5)];
        //    topView.delegate = self;
        topView.topViewTypeBlock = ^(NSString *typeTile) {
            NSLog(@"%@",typeTile); //需要传给listCon去请求不同类别的商品
            SJGoodsListController *goodListCon = [[SJGoodsListController alloc] init];
            [self.navigationController pushViewController:goodListCon animated:YES];
        };
        _topView = topView;
    }
    return _topView;
}

-(SJGridCollectionCon *)gridCollection{
    if (!_gridCollection) {
        _gridCollection = [[SJGridCollectionCon alloc] init];
        NSArray *arr = @[@"http://eimg.smzdm.com/201706/24/594dcc71cdca59038.png",
                         @"http://eimg.smzdm.com/201706/23/594c69eaeb83e2393.png",
                         @"http://eimg.smzdm.com/201703/06/58bd4104c7076804.png",
                         @"http://eimg.smzdm.com/201706/24/594dcc357b2f0503.png",
                         @"http://tp-y.zdmimg.com/201706/26/58730c28245868912.jpg_d200.jpg",
                         @"http://tp-y.zdmimg.com/201706/26/5950acb0c4f3c5734.jpg_d200.jpg",
                         @"http://tp-y.zdmimg.com/201706/26/5950b007443aa3177.jpg_d200.jpg",
                         @"http://tp-y.zdmimg.com/201706/26/5950af832580a4674.jpg_d200.jpg"];
        _gridCollection.gridImgArrs = arr;
    }
    return _gridCollection;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 8;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    switch (section) {
        case 0:
            return kScreenHeight/5;
        case 1:
            return 150;
        case 2:
            return 40;
        case 3:
            return 118;
        case 4:
            return 28;
        case 5:
            return kScreenWidth*0.75;
        case 6:
            return 28;
    }
    return 0;
}

-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return self.topView;
    }
    if (section == 1) {
        #warning 添加广告界面
        return nil;
//        return self.addView;
    }
    if (section == 2) {
        UIView *cycleTextView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 40)];
        cycleTextView.backgroundColor = [UIColor whiteColor];
        UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 52, 20)];
        [imgView setImage:[UIImage imageNamed:@"homePage_headline"]];
        [cycleTextView addSubview:imgView];
        #warning 添加文字轮播器
//        [cycleTextView addSubview:self.textView];
        return cycleTextView;
        
    }
    if (section == 3) {
        NSURL *url = [NSURL URLWithString:@"http://eimg.smzdm.com/201706/26/59506edd8f08e3564.png"];
        UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 118)];
//        #warning 设置带URL的图片，使用sdwebimg
        [imgView sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"default"]];
        return imgView;
    }
    if (section == 4) {
        UIView *titleView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 28)];
        titleView.backgroundColor = [UIColor clearColor];
        UIView *tagView = [[UIView alloc]initWithFrame:CGRectMake(10, 9, 4, 9)];
        tagView.backgroundColor = [UIColor redColor];
        [titleView addSubview:tagView];
        UILabel *tagLab = [[UILabel alloc]initWithFrame:CGRectMake(24, 9, kScreenWidth-24, 9)];
        [tagLab setText:@"精选"];
        [titleView addSubview:tagLab];
        return titleView;

    }
    if (section == 5) {
        return self.gridCollection.view;
    }

    return nil;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 7) {
        return 10;
//        return self.recommendingGoods.count;
    }
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 170;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    SJRecommendCell *cell = [tableView dequeueReusableCellWithIdentifier:recommendCellId];
    cell.recommendModel = [self.recommendingGoods objectAtIndex:indexPath.row];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    SJGoodDetailViewCon *detailCon = [[SJGoodDetailViewCon alloc] init];
    [self.navigationController pushViewController:detailCon animated:YES];
}






@end
