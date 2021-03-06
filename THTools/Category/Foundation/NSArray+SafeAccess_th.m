//
//  NSArray+SafeAccess_th.m
//  THToolsDemo
//
//  Created by 涂浩 on 2017/2/16.
//  Copyright © 2017年 TuHao. All rights reserved.
//

#import "NSArray+SafeAccess_th.h"

@implementation NSArray (SafeAccess_th)

-(id)th_objectWithIndex:(NSUInteger)index{
    if (index <self.count) {
        return self[index];
    }else{
        return nil;
    }
}

- (NSString*)th_stringWithIndex:(NSUInteger)index
{
    id value = [self th_objectWithIndex:index];
    if (value == nil || value == [NSNull null] || [[value description] isEqualToString:@"<null>"])
    {
        return nil;
    }
    if ([value isKindOfClass:[NSString class]]) {
        return (NSString*)value;
    }
    if ([value isKindOfClass:[NSNumber class]]) {
        return [value stringValue];
    }
    
    return nil;
}


- (NSNumber*)th_numberWithIndex:(NSUInteger)index
{
    id value = [self th_objectWithIndex:index];
    if ([value isKindOfClass:[NSNumber class]]) {
        return (NSNumber*)value;
    }
    if ([value isKindOfClass:[NSString class]]) {
        NSNumberFormatter * f = [[NSNumberFormatter alloc] init];
        [f setNumberStyle:NSNumberFormatterDecimalStyle];
        return [f numberFromString:(NSString*)value];
    }
    return nil;
}

- (NSDecimalNumber *)th_decimalNumberWithIndex:(NSUInteger)index{
    id value = [self th_objectWithIndex:index];
    
    if ([value isKindOfClass:[NSDecimalNumber class]]) {
        return value;
    } else if ([value isKindOfClass:[NSNumber class]]) {
        NSNumber * number = (NSNumber*)value;
        return [NSDecimalNumber decimalNumberWithDecimal:[number decimalValue]];
    } else if ([value isKindOfClass:[NSString class]]) {
        NSString * str = (NSString*)value;
        return [str isEqualToString:@""] ? nil : [NSDecimalNumber decimalNumberWithString:str];
    }
    return nil;
}

- (NSArray*)th_arrayWithIndex:(NSUInteger)index
{
    id value = [self th_objectWithIndex:index];
    if (value == nil || value == [NSNull null])
    {
        return nil;
    }
    if ([value isKindOfClass:[NSArray class]])
    {
        return value;
    }
    return nil;
}


- (NSDictionary*)th_dictionaryWithIndex:(NSUInteger)index
{
    id value = [self th_objectWithIndex:index];
    if (value == nil || value == [NSNull null])
    {
        return nil;
    }
    if ([value isKindOfClass:[NSDictionary class]])
    {
        return value;
    }
    return nil;
}

- (NSInteger)th_integerWithIndex:(NSUInteger)index
{
    id value = [self th_objectWithIndex:index];
    if (value == nil || value == [NSNull null])
    {
        return 0;
    }
    if ([value isKindOfClass:[NSString class]] || [value isKindOfClass:[NSNumber class]])
    {
        return [value integerValue];
    }
    return 0;
}
- (NSUInteger)th_unsignedIntegerWithIndex:(NSUInteger)index
{
    id value = [self th_objectWithIndex:index];
    if (value == nil || value == [NSNull null])
    {
        return 0;
    }
    if ([value isKindOfClass:[NSString class]] || [value isKindOfClass:[NSNumber class]])
    {
        return [value unsignedIntegerValue];
    }
    return 0;
}
- (BOOL)th_boolWithIndex:(NSUInteger)index
{
    id value = [self th_objectWithIndex:index];
    
    if (value == nil || value == [NSNull null])
    {
        return NO;
    }
    if ([value isKindOfClass:[NSNumber class]])
    {
        return [value boolValue];
    }
    if ([value isKindOfClass:[NSString class]])
    {
        return [value boolValue];
    }
    return NO;
}
- (int16_t)th_int16WithIndex:(NSUInteger)index
{
    id value = [self th_objectWithIndex:index];
    
    if (value == nil || value == [NSNull null])
    {
        return 0;
    }
    if ([value isKindOfClass:[NSNumber class]])
    {
        return [value shortValue];
    }
    if ([value isKindOfClass:[NSString class]])
    {
        return [value intValue];
    }
    return 0;
}
- (int32_t)th_int32WithIndex:(NSUInteger)index
{
    id value = [self th_objectWithIndex:index];
    
    if (value == nil || value == [NSNull null])
    {
        return 0;
    }
    if ([value isKindOfClass:[NSNumber class]] || [value isKindOfClass:[NSString class]])
    {
        return [value intValue];
    }
    return 0;
}
- (int64_t)th_int64WithIndex:(NSUInteger)index
{
    id value = [self th_objectWithIndex:index];
    
    if (value == nil || value == [NSNull null])
    {
        return 0;
    }
    if ([value isKindOfClass:[NSNumber class]] || [value isKindOfClass:[NSString class]])
    {
        return [value longLongValue];
    }
    return 0;
}

- (char)th_charWithIndex:(NSUInteger)index{
    
    id value = [self th_objectWithIndex:index];
    
    if (value == nil || value == [NSNull null])
    {
        return 0;
    }
    if ([value isKindOfClass:[NSNumber class]] || [value isKindOfClass:[NSString class]])
    {
        return [value charValue];
    }
    return 0;
}

- (short)th_shortWithIndex:(NSUInteger)index
{
    id value = [self th_objectWithIndex:index];
    
    if (value == nil || value == [NSNull null])
    {
        return 0;
    }
    if ([value isKindOfClass:[NSNumber class]])
    {
        return [value shortValue];
    }
    if ([value isKindOfClass:[NSString class]])
    {
        return [value intValue];
    }
    return 0;
}
- (float)th_floatWithIndex:(NSUInteger)index
{
    id value = [self th_objectWithIndex:index];
    
    if (value == nil || value == [NSNull null])
    {
        return 0;
    }
    if ([value isKindOfClass:[NSNumber class]] || [value isKindOfClass:[NSString class]])
    {
        return [value floatValue];
    }
    return 0;
}
- (double)th_doubleWithIndex:(NSUInteger)index
{
    id value = [self th_objectWithIndex:index];
    
    if (value == nil || value == [NSNull null])
    {
        return 0;
    }
    if ([value isKindOfClass:[NSNumber class]] || [value isKindOfClass:[NSString class]])
    {
        return [value doubleValue];
    }
    return 0;
}

- (NSDate *)th_dateWithIndex:(NSUInteger)index dateFormat:(NSString *)dateFormat {
    NSDateFormatter *formater = [[NSDateFormatter alloc]init];
    formater.dateFormat = dateFormat;
    id value = [self th_objectWithIndex:index];
    
    if (value == nil || value == [NSNull null])
    {
        return nil;
    }
    
    if ([value isKindOfClass:[NSString class]] && ![value isEqualToString:@""] && !dateFormat) {
        return [formater dateFromString:value];
    }
    return nil;
}

//CG
- (CGFloat)th_CGFloatWithIndex:(NSUInteger)index
{
    id value = [self th_objectWithIndex:index];
    
    CGFloat f = [value doubleValue];
    
    return f;
}

- (CGPoint)th_pointWithIndex:(NSUInteger)index
{
    id value = [self th_objectWithIndex:index];
    
    CGPoint point = CGPointFromString(value);
    
    return point;
}
- (CGSize)th_sizeWithIndex:(NSUInteger)index
{
    id value = [self th_objectWithIndex:index];
    
    CGSize size = CGSizeFromString(value);
    
    return size;
}
- (CGRect)th_rectWithIndex:(NSUInteger)index
{
    id value = [self th_objectWithIndex:index];
    
    CGRect rect = CGRectFromString(value);
    
    return rect;
}

@end


#pragma --mark NSMutableArray
@implementation NSMutableArray (SafeAccess_th)

-(void)th_addObj:(id)i{
    if (i!=nil) {
        [self addObject:i];
    }
}
-(void)th_addString:(NSString*)i
{
    if (i!=nil) {
        [self addObject:i];
    }
}
-(void)th_addBool:(BOOL)i
{
    [self addObject:@(i)];
}
-(void)th_addInt:(int)i
{
    [self addObject:@(i)];
}
-(void)th_addInteger:(NSInteger)i
{
    [self addObject:@(i)];
}
-(void)th_addUnsignedInteger:(NSUInteger)i
{
    [self addObject:@(i)];
}
-(void)th_addCGFloat:(CGFloat)f
{
    [self addObject:@(f)];
}
-(void)th_addChar:(char)c
{
    [self addObject:@(c)];
}
-(void)th_addFloat:(float)i
{
    [self addObject:@(i)];
}
-(void)th_addPoint:(CGPoint)o
{
    [self addObject:NSStringFromCGPoint(o)];
}
-(void)th_addSize:(CGSize)o
{
    [self addObject:NSStringFromCGSize(o)];
}
-(void)th_addRect:(CGRect)o
{
    [self addObject:NSStringFromCGRect(o)];
}

@end
