//
//  MainPageTopView.m
//  SleepyFish
//
//  Created by sj on 2019/3/12.
//  Copyright © 2019年 sj. All rights reserved.
//

#import "MainPageTopView.h"
#import "UIView+SJGetNav.h"
#import "SJGoodsListController.h"

#define VIEWNUM 4
#define VIEWWIDTH 40
#define VIEWMARGINY 25

@implementation MainPageTopView

-(void)layoutSubviews{
    CGFloat viewMargin = (kScreenWidth - VIEWWIDTH * VIEWNUM) / (VIEWNUM + 1);
    for (int i = 0; i < VIEWNUM * 2; i++) {
        CGFloat viewX = viewMargin + i%VIEWNUM*(VIEWWIDTH+viewMargin);
        CGFloat viewY = VIEWMARGINY + i/VIEWNUM*(VIEWWIDTH+VIEWMARGINY);
        UIView *iconView = [[UIView alloc] initWithFrame:CGRectMake(viewX, viewY, VIEWWIDTH, VIEWWIDTH)];
        UIButton *iconBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        [iconBtn setFrame:CGRectMake(0, 0, VIEWWIDTH, VIEWWIDTH)];
        UILabel *lab = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(iconBtn.frame)+5, VIEWWIDTH, VIEWWIDTH/4)];
        [iconBtn setBackgroundColor:[UIColor blueColor]];
        iconBtn.layer.cornerRadius = VIEWWIDTH/2;
        iconBtn.titleLabel.text = @"类别";
        [iconBtn addTarget:self action:@selector(iconBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [lab setText:@"类别"];
        lab.textAlignment = NSTextAlignmentCenter;
        [iconView addSubview:iconBtn];
        [iconView addSubview:lab];
//        [iconView setBackgroundColor:[UIColor redColor]];
        [self addSubview:iconView];
    }
  
}

- (void)iconBtnClick:(UIButton *)sender{
   if(self.delegate && [self.delegate respondsToSelector:@selector(go2GoodList:withGoodType:)]){
       [self.delegate go2GoodList:self withGoodType:sender.titleLabel.text];
   }
}

@end
