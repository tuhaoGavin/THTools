//
//  UIColor+Hex.h
//  Single
//
//  Created by 涂浩 on 2020/1/7.
//  Copyright © 2020 lobochat. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIColor+Hex.h"
NS_ASSUME_NONNULL_BEGIN

@interface UIColor (Hex)


/// 通过字符串获取颜色
/// @param hexRGBString 16进制字符串
+ (UIColor *)colorWithHexString:(NSString *)hexRGBString;

+ (UIColor *)colorWithHexString:(NSString *)hexRGBString alpha:(CGFloat)alpha;

/// 通过HEX16进制获取颜色
/// @param hex 颜色的16进制值 fg:0XFF0000
+ (UIColor *)colorWithHexInt:(UInt32)hex;

///值不需要除以255.0
+ (UIColor *)colorWithWholeRed:(CGFloat)red
                             green:(CGFloat)green
                              blue:(CGFloat)blue
                             alpha:(CGFloat)alpha;
///值不需要除以255.0
+ (UIColor *)colorWithWholeRed:(CGFloat)red
                             green:(CGFloat)green
                              blue:(CGFloat)blue;
/** 颜色的hex16进制字符串 */
- (NSString *)th_HEXString;


/// 设置不同模式下的颜色
/// @param lightColor 普通模式下颜色
/// @param darkColor 深色模式下颜色
+ (UIColor *)colorWithLight:(UIColor *)lightColor dark:(UIColor *)darkColor;

@end

NS_INLINE UIColor * HexColor(NSString * colorStr) {
    return [UIColor colorWithHexString:colorStr];
}

NS_INLINE UIColor * HexColorWithAlpha(NSString * colorStr, CGFloat alpha) {
    return [UIColor colorWithHexString:colorStr alpha:alpha];
}

NS_INLINE UIColor * RGBColor(CGFloat red, CGFloat green, CGFloat blue) {
    return [UIColor colorWithWholeRed:red green:green blue:blue];
}

NS_INLINE UIColor * RGBColorWithAlpha(CGFloat red, CGFloat green, CGFloat blue,  CGFloat alpha) {
    return [UIColor colorWithWholeRed:red green:green blue:blue alpha:alpha];
}

NS_ASSUME_NONNULL_END
