//
//  UIColor+Hex.m
//  Single
//
//  Created by 涂浩 on 2020/1/7.
//  Copyright © 2020 lobochat. All rights reserved.
//

#import "UIColor+Hex.h"

@implementation UIColor (Hex)

+ (UIColor *)colorWithHexString:(NSString *)hexRGBString {
    return [self colorWithHexString:hexRGBString alpha:1];
}

+ (UIColor *)colorWithHexString:(NSString *)hexRGBString alpha:(CGFloat)alpha {
    if (![hexRGBString isKindOfClass:[NSString class]]) {
        return [UIColor clearColor];
    }
    if (hexRGBString.length < 6) {
        return [UIColor clearColor];
    }
    if ([hexRGBString hasPrefix:@"#"]) {
        
        hexRGBString = [hexRGBString substringFromIndex:1];
    }
    if ([hexRGBString hasPrefix:@"0X"]) {
        hexRGBString = [hexRGBString substringFromIndex:2];
    }
    if (hexRGBString.length != 6) {
        return [UIColor clearColor];
    }
    unsigned int colorCode = 0;
    unsigned char redByte, greenByte, blueByte;
    
    if (hexRGBString) {
        NSScanner *scanner = [NSScanner scannerWithString:hexRGBString];
        [scanner scanHexInt:&colorCode];
    }
    redByte = (unsigned char) (colorCode >> 16);
    greenByte = (unsigned char) (colorCode >> 8);
    blueByte = (unsigned char) (colorCode); // masks off high bits
    
    return [UIColor colorWithRed:(float)redByte/0xff green:(float)greenByte/0xff blue:(float)blueByte/0xff alpha:alpha];
}

+ (UIColor *)colorWithWholeRed:(CGFloat)red
                             green:(CGFloat)green
                              blue:(CGFloat)blue
                             alpha:(CGFloat)alpha
{
    return [UIColor colorWithRed:red/255.f
                           green:green/255.f
                            blue:blue/255.f
                           alpha:alpha];
}

+ (UIColor *)colorWithWholeRed:(CGFloat)red
                             green:(CGFloat)green
                              blue:(CGFloat)blue
{
    return [self colorWithWholeRed:red
                                 green:green
                                  blue:blue
                                 alpha:1.0];
}

@end
