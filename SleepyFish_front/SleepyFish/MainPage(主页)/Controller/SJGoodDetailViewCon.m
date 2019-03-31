//
//  SJGoodDetailViewCon.m
//  SleepyFish
//
//  Created by sj on 2019/3/31.
//  Copyright © 2019年 sj. All rights reserved.
//

#import "SJGoodDetailViewCon.h"

NSInteger const imgH = 300;
NSInteger const imgCount = 5;

@interface SJGoodDetailViewCon () <UIScrollViewDelegate>

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIPageControl *pageCon;
@property (nonatomic, strong) NSTimer *timer;

@property (nonatomic, strong) UIImageView *leftImgView;
@property (nonatomic, strong) UIImageView *centerImgView;
@property (nonatomic, strong) UIImageView *rightImgView;

@property (nonatomic, assign) NSInteger centerIndex;
@property (nonatomic, assign) NSInteger leftIndex;
@property (nonatomic, assign) NSInteger rightIndex;


@end

@implementation SJGoodDetailViewCon

-(UIScrollView *)scrollView{

    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, kRectNavAndStatusHight, kScreenWidth, imgH)];
        [self.view addSubview:_scrollView];
        _scrollView.bounces = false;
        _scrollView.showsHorizontalScrollIndicator = false;
        _scrollView.pagingEnabled = true;
        
        //设置无限轮播
        _scrollView.contentSize = CGSizeMake(kScreenWidth * 3, imgH);
        [_scrollView setContentOffset:CGPointMake(kScreenWidth, 0) animated:NO];
        _scrollView.delegate = self;
        
    }
    return _scrollView;
}



-(UIPageControl *)pageCon{
    if (!_pageCon) {
        _pageCon = [[UIPageControl alloc] init];
        [self.view addSubview:_pageCon];
        _pageCon.numberOfPages = imgCount;
        CGSize size = [_pageCon sizeForNumberOfPages:imgCount];
        _pageCon.bounds = CGRectMake(0, 0, size.width, size.height);
        _pageCon.center = CGPointMake(self.view.center.x, imgH - 10);
        _pageCon.pageIndicatorTintColor = [UIColor whiteColor];
        _pageCon.currentPageIndicatorTintColor = [UIColor redColor];
        [_pageCon addTarget:self action:@selector(pageChanged:) forControlEvents:UIControlEventValueChanged];
    }
    return _pageCon;
}

- (NSInteger)leftIndex {
    
    if (_centerIndex == 0) {
        
        _leftIndex = imgCount - 1;
        
    } else {
        
        _leftIndex = _centerIndex - 1;
    }
    
    return _leftIndex;
}

- (NSInteger)rightIndex {
    
    if (_centerIndex == imgCount - 1) {
        
        _rightIndex = 0;
    } else {
        
        _rightIndex = _centerIndex + 1;
    }
    
    return _rightIndex;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self setupScrollView];
}

- (void)setupImgView:(UIImageView *)imgView withIndex:(NSInteger)index{
    imgView = [[UIImageView alloc] initWithFrame:self.scrollView.bounds];
    imgView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%ld",index + 1]];
    [self.scrollView addSubview:imgView];
    
}

- (void)setupScrollView{
    
    //添加图片
    [self setupImgView:self.leftImgView withIndex:0];
    [self setupImgView:self.centerImgView withIndex:1];
    [self setupImgView:self.rightImgView withIndex:2];
    
    //设置每个img的位置
    [self.scrollView.subviews enumerateObjectsUsingBlock:^(__kindof UIImageView * _Nonnull imgView, NSUInteger idx, BOOL * _Nonnull stop) {
        CGRect frame = imgView.frame;
        frame.origin.x = idx * frame.size.width;
        imgView.frame = frame;
    }];
    
    [self.pageCon setCurrentPage:0];
//    [self setupTimer];
    
}


- (void)setupTimer{
    self.timer = [NSTimer timerWithTimeInterval:2 target:self selector:@selector(timerChanged) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
}

- (void)timerChanged{
    NSInteger page = (self.pageCon.currentPage + 1) % imgCount;
    self.pageCon.currentPage = page;
    [self pageChanged:self.pageCon];
}


- (void)pageChanged:(UIPageControl *)pagecon{
    CGFloat x = (pagecon.currentPage) * self.view.bounds.size.width;
    [self.scrollView setContentOffset:CGPointMake(x, 0) animated:YES];
}

-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
     [self.timer invalidate];
  
   
}

//重新加载图片
- (void)reloadImgs{
    CGPoint offset = [self.scrollView contentOffset];
    if (offset.x == 2 * kScreenWidth) {
        [self currentImageIndexAdd];
    } else if(offset.x == 0){
        [self currentImageIndexMinus];
    }
    
    self.centerImgView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%ld",self.centerIndex + 1]];
    
    //重置左右图片

    self.leftImgView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%ld",self.leftIndex + 1]];
    self.rightImgView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%ld",self.rightIndex + 1]];
}

- (void)currentImageIndexAdd {
    
    if (self.centerIndex == imgCount - 1) {
        
        self.centerIndex = 0;
    } else {
        self.centerIndex = self.centerIndex + 1;
    }
}

- (void)currentImageIndexMinus {
    
    if (self.centerIndex == 0) {
        
        self.centerIndex = imgCount - 1;
        
    } else {
        
        self.centerIndex = self.centerIndex - 1;
    }
}


- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    [self reloadImgs];
    [self.scrollView setContentOffset:CGPointMake(kScreenWidth, 0) animated:false];
    self.pageCon.currentPage = self.centerIndex;
//    [self setupTimer];
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
