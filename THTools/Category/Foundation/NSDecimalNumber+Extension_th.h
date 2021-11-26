//
//  NSDecimalNumber+Extension_th.h
//  THToolsDemo
//
//  Created by 涂浩 on 2017/2/16.
//  Copyright © 2017年 TuHao. All rights reserved.
//

#import <Foundation/Foundation.h>
// Rounding policies :
// Original
//    value 1.2  1.21  1.25  1.35  1.27

// Plain    1.2  1.2   1.3   1.4   1.3
// Down     1.2  1.2   1.2   1.3   1.2
// Up       1.2  1.3   1.3   1.4   1.3
// Bankers  1.2  1.2   1.2   1.4   1.3


@interface NSDecimalNumber (Extension_th)

/**
 *  @brief  四舍五入 NSRoundPlain
 *
 *  @param scale 限制位数
 *
 *  @return 返回结果
 */
- (NSDecimalNumber*)th_roundToScale:(NSUInteger)scale;
/**
 *  @brief  四舍五入
 *
 *  @param scale        限制位数
 *  @param roundingMode NSRoundingMode
 *
 *  @return 返回结果
 */
- (NSDecimalNumber*)th_roundToScale:(NSUInteger)scale mode:(NSRoundingMode)roundingMode;

- (NSDecimalNumber*)th_decimalNumberWithPercentage:(float)percent;

- (NSDecimalNumber*)th_decimalNumberWithDiscountPercentage:(NSDecimalNumber *)discountPercentage;

- (NSDecimalNumber*)th_decimalNumberWithDiscountPercentage:(NSDecimalNumber *)discountPercentage
                                               roundToScale:(NSUInteger)scale;

- (NSDecimalNumber*)th_discountPercentageWithBaseValue:(NSDecimalNumber *)baseValue;

- (NSDecimalNumber*)th_discountPercentageWithBaseValue:(NSDecimalNumber *)baseValue
                                           roundToScale:(NSUInteger)scale;

@end
