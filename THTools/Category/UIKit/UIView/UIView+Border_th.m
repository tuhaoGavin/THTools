//
//  UIView+Border_th.m
//  THToolsDemo
//
//  Created by 涂浩 on 2017/7/24.
//  Copyright © 2017年 TuHao. All rights reserved.
//

#import "UIView+Border_th.h"

@implementation UIView (Border_th)

@dynamic th_borderType;
/** 设置边框类型 */
- (void)setTh_borderType:(THViewBorderType)th_borderType {
    CGFloat bh = self.layer.borderWidth;
    if (th_borderType & THViewBorderBottom) {
        [self addBottomBorder:self borderHeight:bh];
    }
    if (th_borderType & THViewBorderLeft) {
        [self addLeftBorder:self borderHeight:bh];
    }
    if (th_borderType & THViewBorderRight) {
        [self addRightBorder:self borderHeight:bh];
    }
    if (th_borderType & THViewBorderTop) {
        [self addTopBorder:self borderHeight:bh];
    }
    if (th_borderType & THViewBorderLeftAndBottom) {
        [self addBottomBorder:self borderHeight:bh];
        [self addLeftBorder:self borderHeight:bh];
    }
    if (th_borderType & THViewBorderRightAndBottom) {
        [self addBottomBorder:self borderHeight:bh];
        [self addRightBorder:self borderHeight:bh];
    }
    self.layer.borderWidth = 0;
}

#pragma mark - private
/** 设置边框的frame */
- (void)addTopBorder:(UIView *)vi borderHeight:(CGFloat)bh {
    CGRect frame = CGRectMake(0, 0, vi.frame.size.width, bh);
    [self addBorderLayerWithFrame:frame];
}
- (void)addLeftBorder:(UIView *)vi borderHeight:(CGFloat)bh{
    CGRect frame = CGRectMake(0, 0, bh, vi.frame.size.height);
    [self addBorderLayerWithFrame:frame];
}
- (void)addBottomBorder:(UIView *)vi borderHeight:(CGFloat)bh{
    CGRect frame = CGRectMake(0, vi.frame.size.height-bh, vi.frame.size.width, bh);
    [self addBorderLayerWithFrame:frame];
}
- (void)addRightBorder:(UIView *)vi borderHeight:(CGFloat)bh{
    CGRect frame = CGRectMake(vi.frame.size.width-bh, 0, bh, vi.frame.size.height);
    [self addBorderLayerWithFrame:frame];
}

/** 添加边框到view上 */
- (void)addBorderLayerWithFrame:(CGRect)frame {
    CALayer *border = [CALayer layer];
    border.frame = frame;
    border.backgroundColor = self.layer.borderColor;
    [self.layer addSublayer:border];
}


@end
