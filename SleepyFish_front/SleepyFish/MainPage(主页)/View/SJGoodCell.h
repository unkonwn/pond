//
//  SJGoodCell.h
//  SleepyFish
//
//  Created by sj on 2019/3/12.
//  Copyright © 2019年 sj. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SJGoodModel.h"

@interface SJGoodCell : UITableViewCell

@property (nonatomic, strong) SJGoodModel *goodModel;

+(instancetype)goodCellWithTableView:(UITableView *)tableView;

@end
