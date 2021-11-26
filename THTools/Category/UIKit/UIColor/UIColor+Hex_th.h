//
//  UIColor+Hex_th.h
//  THToolsDemo
//
//  Created by 涂浩 on 2017/2/16.
//  Copyright © 2017年 TuHao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Hex_th)

+ (UIColor *)th_colorWithHex:(UInt32)hex;
+ (UIColor *)th_colorWithHex:(UInt32)hex andAlpha:(CGFloat)alpha;
+ (UIColor *)th_colorWithHexString:(NSString *)hexString;
- (NSString *)th_HEXString;
///值不需要除以255.0
+ (UIColor *)th_colorWithWholeRed:(CGFloat)red
                             green:(CGFloat)green
                              blue:(CGFloat)blue
                             alpha:(CGFloat)alpha;
///值不需要除以255.0
+ (UIColor *)th_colorWithWholeRed:(CGFloat)red
                             green:(CGFloat)green
                              blue:(CGFloat)blue;

@end
