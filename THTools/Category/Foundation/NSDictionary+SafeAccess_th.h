//
//  NSDictionary+SafeAccess_th.h
//  THToolsDemo
//
//  Created by 涂浩 on 2017/2/16.
//  Copyright © 2017年 TuHao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSDictionary (SafeAccess_th)

- (BOOL)th_hasKey:(NSString *)key;

- (NSString*)th_stringForKey:(id)key;

- (NSNumber*)th_numberForKey:(id)key;

- (NSDecimalNumber *)th_decimalNumberForKey:(id)key;

- (NSArray*)th_arrayForKey:(id)key;

- (NSDictionary*)th_dictionaryForKey:(id)key;

- (NSInteger)th_integerForKey:(id)key;

- (NSUInteger)th_unsignedIntegerForKey:(id)key;

- (BOOL)th_boolForKey:(id)key;

- (int16_t)th_int16ForKey:(id)key;

- (int32_t)th_int32ForKey:(id)key;

- (int64_t)th_int64ForKey:(id)key;

- (char)th_charForKey:(id)key;

- (short)th_shortForKey:(id)key;

- (float)th_floatForKey:(id)key;

- (double)th_doubleForKey:(id)key;

- (long long)th_longLongForKey:(id)key;

- (unsigned long long)th_unsignedLongLongForKey:(id)key;

- (NSDate *)th_dateForKey:(id)key dateFormat:(NSString *)dateFormat;

//CG
- (CGFloat)th_CGFloatForKey:(id)key;

- (CGPoint)th_pointForKey:(id)key;

- (CGSize)th_sizeForKey:(id)key;

- (CGRect)th_rectForKey:(id)key;

@end


#pragma --mark NSMutableDictionary
@interface NSMutableDictionary (SafeAccess_th)

-(void)th_setObj:(id)i forKey:(NSString*)key;

-(void)th_setString:(NSString*)i forKey:(NSString*)key;

-(void)th_setBool:(BOOL)i forKey:(NSString*)key;

-(void)th_setInt:(int)i forKey:(NSString*)key;

-(void)th_setInteger:(NSInteger)i forKey:(NSString*)key;

-(void)th_setUnsignedInteger:(NSUInteger)i forKey:(NSString*)key;

-(void)th_setCGFloat:(CGFloat)f forKey:(NSString*)key;

-(void)th_setChar:(char)c forKey:(NSString*)key;

-(void)th_setFloat:(float)i forKey:(NSString*)key;

-(void)th_setDouble:(double)i forKey:(NSString*)key;

-(void)th_setLongLong:(long long)i forKey:(NSString*)key;

-(void)th_setPoint:(CGPoint)o forKey:(NSString*)key;

-(void)th_setSize:(CGSize)o forKey:(NSString*)key;

-(void)th_setRect:(CGRect)o forKey:(NSString*)key;

@end

