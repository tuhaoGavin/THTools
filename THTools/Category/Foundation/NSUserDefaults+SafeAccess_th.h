//
//  NSUserDefaults+SafeAccess_th.h
//  THToolsDemo
//
//  Created by weixb on 2017/2/16.
//  Copyright © 2017年 weixb. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSUserDefaults (SafeAccess_th)

+ (NSString *)th_stringForKey:(NSString *)defaultName;

+ (NSArray *)th_arrayForKey:(NSString *)defaultName;

+ (NSDictionary *)th_dictionaryForKey:(NSString *)defaultName;

+ (NSData *)th_dataForKey:(NSString *)defaultName;

+ (NSArray *)th_stringArrayForKey:(NSString *)defaultName;

+ (NSInteger)th_integerForKey:(NSString *)defaultName;

+ (float)th_floatForKey:(NSString *)defaultName;

+ (double)th_doubleForKey:(NSString *)defaultName;

+ (BOOL)th_boolForKey:(NSString *)defaultName;

+ (NSURL *)th_URLForKey:(NSString *)defaultName;

#pragma mark - WRITE FOR STANDARD

+ (void)th_setObject:(id)value forKey:(NSString *)defaultName;

#pragma mark - READ ARCHIVE FOR STANDARD

+ (id)th_arcObjectForKey:(NSString *)defaultName;

#pragma mark - WRITE ARCHIVE FOR STANDARD

+ (void)th_setArcObject:(id)value forKey:(NSString *)defaultName;

@end
