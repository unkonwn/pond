//
//  SJGoodCell.m
//  SleepyFish
//
//  Created by sj on 2019/3/12.
//  Copyright © 2019年 sj. All rights reserved.
//

#import "SJGoodCell.h"
#define GOODCELLNAME @"SJGoodCell"

@interface SJGoodCell()

@property (weak, nonatomic) IBOutlet UIImageView *goodImg;
@property (weak, nonatomic) IBOutlet UILabel *goodTitle;
@property (weak, nonatomic) IBOutlet UILabel *payPeopleNum;
@property (weak, nonatomic) IBOutlet UILabel *goodPrice;

@end

@implementation SJGoodCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setFrame:(CGRect)frame{
//    frame.size.height -= 10;//可以设置边距
    [super setFrame:frame];
}

-(void)setGoodModel:(SJGoodModel *)goodModel{
    //TODO:设置cell的具体属性
    
}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
