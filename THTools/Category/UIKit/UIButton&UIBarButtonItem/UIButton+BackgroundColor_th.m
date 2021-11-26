//
//  UIButton+BackgroundColor_th.m
//  THToolsDemo
//
//  Created by 涂浩 on 2017/2/16.
//  Copyright © 2017年 TuHao. All rights reserved.
//

#import "UIButton+BackgroundColor_th.h"

@implementation UIButton (BackgroundColor_th)

/**
 *  @brief  使用颜色设置按钮背景
 *
 *  @param backgroundColor 背景颜色
 *  @param state           按钮状态
 */
- (void)th_setBackgroundColor:(UIColor *)backgroundColor forState:(UIControlState)state
{
    self.backgroundColor = [UIColor clearColor];
    [self setBackgroundImage:[UIButton th_b_imageWithColor:backgroundColor] forState:state];
}

+ (UIImage *)th_b_imageWithColor:(UIColor *)color
{
    CGRect rect = CGRectMake(0.0f, 0.0f, 0.5f, 0.5f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

@end
