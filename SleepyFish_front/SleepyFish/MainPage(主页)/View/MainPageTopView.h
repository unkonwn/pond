//
//  MainPageTopView.h
//  SleepyFish
//
//  Created by sj on 2019/3/12.
//  Copyright © 2019年 sj. All rights reserved.
//

#import <UIKit/UIKit.h>

//@protocol MainPageTopViewDelegate <NSObject>
//
//- (void)go2GoodList:(UIView *)mainPageView withGoodType:(NSString *)goodType;
//
//@end

@interface MainPageTopView : UIView

//@property (weak, nonatomic) id<MainPageTopViewDelegate> delegate;
@property (nonatomic, strong) void(^topViewTypeBlock)(NSString *typeTile);

@end
