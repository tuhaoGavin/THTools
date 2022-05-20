//
//  UIView+Radius_th.h
//  THToolsDemo
//
//  Created by WeiXinbing on 2019/6/12.
//  Copyright © 2019 TuHao. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (Radius_th)
/**
 配置不同数量不同大小的圆角, 使用UIBezierPath进行切圆角
 
 @param topLeft 上左
 @param topRight 上右
 @param bottomLeft 下左
 @param bottomRight 下右
 */
- (void)radiusWithTopLeft:(CGFloat)topLeft
                     topRight:(CGFloat)topRight
                   bottomLeft:(CGFloat)bottomLeft
                  bottomRight:(CGFloat)bottomRight;

/**
 绘制圆角 避免直接使用cornerRadius触发的离屏渲染销号GPU(该方法需已设置控件的frame,若使用约束布局
 需要在约束完成后调用layoutIfNeeded后在调用，或者在layoutsubviews 中调用)
 @param radius 圆角尺寸
 @param corner 圆角位置
 */
- (void)radiusWithRadius:(CGFloat)radius corner:(UIRectCorner)corner;

@end

NS_ASSUME_NONNULL_END
