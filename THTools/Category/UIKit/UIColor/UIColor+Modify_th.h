//
//  UIColor+Modify_th.h
//  THToolsDemo
//
//  Created by 涂浩 on 2017/2/16.
//  Copyright © 2017年 TuHao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Modify_th)

- (UIColor *)th_invertedColor;
- (UIColor *)th_colorForTranslucency;
- (UIColor *)th_lightenColor:(CGFloat)lighten;
- (UIColor *)th_darkenColor:(CGFloat)darken;

@end
