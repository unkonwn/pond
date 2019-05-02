//
//  SJRecommendCell.m
//  SleepyFish
//
//  Created by sj on 2019/5/2.
//  Copyright © 2019年 sj. All rights reserved.
//

#import "SJRecommendCell.h"

@interface SJRecommendCell()


@property (weak, nonatomic) IBOutlet UIImageView *goodImgView;
@property (weak, nonatomic) IBOutlet UILabel *goodTitleLb;
@property (weak, nonatomic) IBOutlet UILabel *goodPriceLb;
@property (weak, nonatomic) IBOutlet UILabel *goodPublishTimeLb;

@end

@implementation SJRecommendCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    //设置圆角
    self.selectionStyle = UITableViewCellSelectionStyleNone;
//    self.backgroundColor = [UIColor clearColor];
    self.layer.cornerRadius=5.0f;
    self.layer.masksToBounds=YES;
    
}

-(void)setFrame:(CGRect)frame
{
    frame.origin.x = 4;//这里间距为10，可以根据自己的情况调整
    frame.size.width -= 2*frame.origin.x;
    frame.size.height -= 10;
    [super setFrame:frame];
}


-(void)drawRect:(CGRect)rect{
    [self.goodTitleLb sizeToFit];
}

- (void)setRecommendModel:(SJRecommendModel *)recommendModel{
    #warning 设置cell的属性
    [self.goodImgView setImage:[UIImage imageNamed:@"default"]];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
