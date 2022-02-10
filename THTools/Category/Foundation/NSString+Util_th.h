//
//  NSString+Util_th.h
//  Tools
//
//  Created by 涂浩 on 16/12/19.
//  Copyright © 2016年 TuHao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (Util_th)

/**
 *  根据各种情况判断字符串是否为空 是空返回yes
 */
+ (BOOL)th_isEmptyString:(NSString *)str;
/**
 *  将中文字符串转为拼音
 *
 *  @param string 中文
 *
 *  @return 拼音
 */
+ (NSString *)th_pinyinWithChineseString:(NSString *)string;

/**
 利用属性改变字符串的大小颜色
 
 @param targetStr   输入字符串
 @param rangStrings 要改变的字符串数组
 @param colors      改变后的颜色数组
 @param fonts       改变后的字体数组
 @return 改变后的字符串
 */
+ (NSMutableAttributedString *)th_changeWithTargetString:(NSString *)targetStr rangStrings:(NSArray *)rangStrings colers:(NSArray *)colors fonts:(NSArray *)fonts;


/// 改变字符串行高
/// @param string 源字符串
/// @param lineSpace 行高
+ (NSMutableAttributedString *)th_getAttributedStringWithString:(NSString *)string lineSpace:(CGFloat)lineSpace;

/**
* 金额的格式转化
* str : 金额的字符串
* numberStyle : 金额转换的格式
* return  NSString : 转化后的金额格式字符串
*/
+ (NSString *)stringChangeMoneyWithStr:(NSString *)str numberStyle:(NSNumberFormatterStyle)numberStyle;

/** 生日转年龄 */
+ (NSString *)th_getAgeWithBirth:(NSString *)birth;

/** 获取非空字符串 空的话就返回空字符串 @"" */
+ (NSString *)th_noEmptyStr:(NSString *)str;

/** 传入 秒  得到 xx:xx:xx */
+(NSString *)th_getHHMMSSFromSS:(NSString *)totalTime;

//传入 秒  得到  xx分钟xx秒
+(NSString *)th_getMMSSFromSS:(NSString *)totalTime;


- (NSString *)th_noEmptyStr;
@end
