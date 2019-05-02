//
//  SJGridLayout.m
//  SleepyFish
//
//  Created by sj on 2019/4/30.
//  Copyright © 2019年 sj. All rights reserved.
//

#import "SJGridLayout.h"

@interface SJGridLayout()

@property (nonatomic,copy) NSMutableArray *attrsArr;

@end

@implementation SJGridLayout

-(NSMutableArray*)attrsArr{
    if (!_attrsArr) {
        _attrsArr = [NSMutableArray array];
    }
    return _attrsArr;
}

-(void)prepareLayout{
    [super prepareLayout];
    int width = self.collectionView.frame.size.width;
    int height = self.collectionView.frame.size.height;
    CGFloat scaleW = 0.375;
    CGFloat scaleH = 0.58;
    CGFloat scaleH2 = 0.55;
    for (NSInteger i = 0; i < 8; i++) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:i inSection:0];
        UICollectionViewLayoutAttributes *attr =
        [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
        switch (i) {
            case 0:
                attr.frame = CGRectMake(0, 0, width*scaleW, height*scaleH);
                break;
            case 1:
                attr.frame = CGRectMake(width*scaleW, 0, width*(1-scaleW), height*scaleH*scaleH2);
                break;
            case 2:
                attr.frame = CGRectMake(width*scaleW, height*scaleH*scaleH2, width*(1-scaleW)/2, height*scaleH*(1-scaleH2));
                break;
            case 3:
                attr.frame = CGRectMake(width*scaleW+width*(1-scaleW)/2, height*scaleH*scaleH2, width*(1-scaleW)/2, height*scaleH*(1-scaleH2));
                break;
            case 4:
                attr.frame = CGRectMake(0, height*scaleH, width/4, height*(1-scaleH));
                break;
            case 5:
                attr.frame = CGRectMake(width/4, height*scaleH, width/4, height*(1-scaleH));
                break;
            case 6:
                attr.frame = CGRectMake(width/4*2, height*scaleH, width/4, height*(1-scaleH));
                break;
            case 7:
                attr.frame = CGRectMake(width/4*3, height*scaleH, width/4, height*(1-scaleH));
                break;
            default:
                break;
        }
        [self.attrsArr addObject:attr];
        
    }
}

-(NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect{
    return self.attrsArr;
}
@end
