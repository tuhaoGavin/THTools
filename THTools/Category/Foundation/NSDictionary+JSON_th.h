//
//  NSDictionary+JSON_th.h
//  THToolsDemo
//
//  Created by 涂浩 on 2017/12/15.
//  Copyright © 2017年 TuHao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (JSON_th)

- (NSString *)jsonString: (NSString *)key;

- (NSDictionary *)jsonDict: (NSString *)key;
- (NSArray *)jsonArray: (NSString *)key;
- (NSArray *)jsonStringArray: (NSString *)key;


- (BOOL)jsonBool: (NSString *)key;
- (NSInteger)jsonInteger: (NSString *)key;
- (long long)jsonLongLong: (NSString *)key;
- (unsigned long long)jsonUnsignedLongLong:(NSString *)key;

- (double)jsonDouble: (NSString *)key;
//json转字典
+ (NSDictionary *)jsonDictWithString:(NSString *)string;

@end
