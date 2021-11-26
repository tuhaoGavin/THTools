//
//  NSArray+SafeAccess_th.h
//  THToolsDemo
//
//  Created by 涂浩 on 2017/2/16.
//  Copyright © 2017年 TuHao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSArray (SafeAccess_th)

-(id)th_objectWithIndex:(NSUInteger)index;

- (NSString*)th_stringWithIndex:(NSUInteger)index;

- (NSNumber*)th_numberWithIndex:(NSUInteger)index;

- (NSDecimalNumber *)th_decimalNumberWithIndex:(NSUInteger)index;

- (NSArray*)th_arrayWithIndex:(NSUInteger)index;

- (NSDictionary*)th_dictionaryWithIndex:(NSUInteger)index;

- (NSInteger)th_integerWithIndex:(NSUInteger)index;

- (NSUInteger)th_unsignedIntegerWithIndex:(NSUInteger)index;

- (BOOL)th_boolWithIndex:(NSUInteger)index;

- (int16_t)th_int16WithIndex:(NSUInteger)index;

- (int32_t)th_int32WithIndex:(NSUInteger)index;

- (int64_t)th_int64WithIndex:(NSUInteger)index;

- (char)th_charWithIndex:(NSUInteger)index;

- (short)th_shortWithIndex:(NSUInteger)index;

- (float)th_floatWithIndex:(NSUInteger)index;

- (double)th_doubleWithIndex:(NSUInteger)index;

- (NSDate *)th_dateWithIndex:(NSUInteger)index dateFormat:(NSString *)dateFormat;
//CG
- (CGFloat)th_CGFloatWithIndex:(NSUInteger)index;

- (CGPoint)th_pointWithIndex:(NSUInteger)index;

- (CGSize)th_sizeWithIndex:(NSUInteger)index;

- (CGRect)th_rectWithIndex:(NSUInteger)index;

@end

#pragma --mark NSMutableArray
@interface NSMutableArray (SafeAccess_th)

-(void)th_addObj:(id)i;

-(void)th_addString:(NSString*)i;

-(void)th_addBool:(BOOL)i;

-(void)th_addInt:(int)i;

-(void)th_addInteger:(NSInteger)i;

-(void)th_addUnsignedInteger:(NSUInteger)i;

-(void)th_addCGFloat:(CGFloat)f;

-(void)th_addChar:(char)c;

-(void)th_addFloat:(float)i;

-(void)th_addPoint:(CGPoint)o;

-(void)th_addSize:(CGSize)o;

-(void)th_addRect:(CGRect)o;

@end
