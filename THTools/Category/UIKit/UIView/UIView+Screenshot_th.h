//
//  UIView+Screenshot_th.h
//  THToolsDemo
//
//  Created by 涂浩 on 2017/2/16.
//  Copyright © 2017年 TuHao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Screenshot_th)

/**
 *  @brief  view截图
 *
 *  @return 截图
 */
- (UIImage *)th_screenshot;

/**
 *  @author Jakey
 *
 *  @brief  截图一个view中所有视图 包括旋转缩放效果
 *
 *  @param maxWidth 限制缩放的最大宽度 保持默认传0
 *
 *  @return 截图
 */
- (UIImage *)th_screenshot:(CGFloat)maxWidth;

@end
