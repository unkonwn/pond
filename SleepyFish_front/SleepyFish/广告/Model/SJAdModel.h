//
//  SJAdModel.h
//  SleepyFish
//
//  Created by sj on 2019/4/9.
//  Copyright © 2019年 sj. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SJAdModel : NSObject


/** 广告地址 */
@property (nonatomic, strong) NSString *w_picurl;
/** 点击广告跳转的界面 */
@property (nonatomic, strong) NSString *ori_curl;

@property (nonatomic, assign) CGFloat w;

@property (nonatomic, assign) CGFloat h;

@end
