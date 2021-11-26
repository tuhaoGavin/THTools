//
//  NSNumber+CGFloat_th.m
//  THToolsDemo
//
//  Created by 涂浩 on 2017/2/16.
//  Copyright © 2017年 TuHao. All rights reserved.
//

#import "NSNumber+CGFloat_th.h"

@implementation NSNumber (CGFloat_th)

- (CGFloat)th_CGFloatValue
{
#if (CGFLOAT_IS_DOUBLE == 1)
    CGFloat result = [self doubleValue];
#else
    CGFloat result = [self floatValue];
#endif
    return result;
}

- (id)initWithyqCGFloat:(CGFloat)value
{
#if (CGFLOAT_IS_DOUBLE == 1)
    self = [self initWithDouble:value];
#else
    self = [self initWithFloat:value];
#endif
    return self;
}
+ (NSNumber *)th_numberWithCGFloat:(CGFloat)value
{
    NSNumber *result = [[self alloc] initWithyqCGFloat:value];
    return result;
}

@end
