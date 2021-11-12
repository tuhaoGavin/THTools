//
//  NSDate+Extension_th.h
//  THToolsDemo
//
//  Created by weixb on 2017/2/16.
//  Copyright © 2017年 weixb. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (Extension_th)

/**
 * 获取日、月、年、小时、分钟、秒
 */
- (NSUInteger)th_day;
- (NSUInteger)th_month;
- (NSUInteger)th_year;
- (NSUInteger)th_hour;
- (NSUInteger)th_minute;
- (NSUInteger)th_second;
+ (NSUInteger)th_day:(NSDate *)date;
+ (NSUInteger)th_month:(NSDate *)date;
+ (NSUInteger)th_year:(NSDate *)date;
+ (NSUInteger)th_hour:(NSDate *)date;
+ (NSUInteger)th_minute:(NSDate *)date;
+ (NSUInteger)th_second:(NSDate *)date;

/**
 * 获取一年中的总天数
 */
- (NSUInteger)th_daysInYear;
+ (NSUInteger)th_daysInYear:(NSDate *)date;

/**
 * 判断是否是润年
 * @return YES表示润年，NO表示平年
 */
- (BOOL)th_isLeapYear;
+ (BOOL)th_isLeapYear:(NSDate *)date;

/**
 * 获取该日期是该年的第几周
 */
- (NSUInteger)th_weekOfYear;
+ (NSUInteger)th_weekOfYear:(NSDate *)date;

/**
 * 获取格式化为YYYY-MM-dd格式的日期字符串
 */
- (NSString *)th_formatYMD;
+ (NSString *)th_formatYMD:(NSDate *)date;

/**
 * 返回当前月一共有几周(可能为4,5,6)
 */
- (NSUInteger)th_weeksOfMonth;
+ (NSUInteger)th_weeksOfMonth:(NSDate *)date;

/**
 * 获取该月的第一天的日期
 */
- (NSDate *)th_begindayOfMonth;
+ (NSDate *)th_begindayOfMonth:(NSDate *)date;

/**
 * 获取该月的最后一天的日期
 */
- (NSDate *)th_lastdayOfMonth;
+ (NSDate *)th_lastdayOfMonth:(NSDate *)date;

/**
 * 返回day天后的日期(若day为负数,则为|day|天前的日期)
 */
- (NSDate *)th_dateAfterDay:(NSUInteger)day;
+ (NSDate *)th_dateAfterDate:(NSDate *)date day:(NSInteger)day;

/**
 * 返回day天后的日期(若day为负数,则为|day|天前的日期)
 */
- (NSDate *)th_dateAfterMonth:(NSUInteger)month;
+ (NSDate *)th_dateAfterDate:(NSDate *)date month:(NSInteger)month;

/**
 * 返回numYears年后的日期
 */
- (NSDate *)th_offsetYears:(int)numYears;
+ (NSDate *)th_offsetYears:(int)numYears fromDate:(NSDate *)fromDate;

/**
 * 返回numMonths月后的日期
 */
- (NSDate *)th_offsetMonths:(int)numMonths;
+ (NSDate *)th_offsetMonths:(int)numMonths fromDate:(NSDate *)fromDate;

/**
 * 返回numDays天后的日期
 */
- (NSDate *)th_offsetDays:(int)numDays;
+ (NSDate *)th_offsetDays:(int)numDays fromDate:(NSDate *)fromDate;

/**
 * 返回numHours小时后的日期
 */
- (NSDate *)th_offsetHours:(int)hours;
+ (NSDate *)th_offsetHours:(int)numHours fromDate:(NSDate *)fromDate;

/**
 * 距离该日期前几天
 */
- (NSUInteger)th_daysAgo;
+ (NSUInteger)th_daysAgo:(NSDate *)date;

/**
 *  获取星期几
 *
 *  @return Return weekday number
 *  [1 - Sunday]
 *  [2 - Monday]
 *  [3 - Tuerday]
 *  [4 - Wednesday]
 *  [5 - Thursday]
 *  [6 - Friday]
 *  [7 - Saturday]
 */
- (NSInteger)th_weekday;
+ (NSInteger)th_weekday:(NSDate *)date;

/**
 *  获取星期几(名称)
 *
 *  @return Return weekday as a localized string
 *  [1 - Sunday]
 *  [2 - Monday]
 *  [3 - Tuerday]
 *  [4 - Wednesday]
 *  [5 - Thursday]
 *  [6 - Friday]
 *  [7 - Saturday]
 */
- (NSString *)th_dayFromWeekday;
+ (NSString *)th_dayFromWeekday:(NSDate *)date;

/**
 *  日期是否相等
 *
 *  @param anotherDate The another date to compare as NSDate
 *  @return Return YES if is same day, NO if not
 */
- (BOOL)th_isSameDay:(NSDate *)anotherDate;

/**
 *  是否是今天
 *
 *  @return Return if self is today
 */
- (BOOL)th_isToday;

/**
 *  Add days to self
 *
 *  @param days The number of days to add
 *  @return Return self by adding the gived days number
 */
- (NSDate *)th_dateByAddingDays:(NSUInteger)days;

/**
 *  Get the month as a localized string from the given month number
 *
 *  @param month The month to be converted in string
 *  [1 - January]
 *  [2 - February]
 *  [3 - March]
 *  [4 - April]
 *  [5 - May]
 *  [6 - June]
 *  [7 - July]
 *  [8 - August]
 *  [9 - September]
 *  [10 - October]
 *  [11 - November]
 *  [12 - December]
 *
 *  @return Return the given month as a localized string
 */
+ (NSString *)th_monthWithMonthNumber:(NSInteger)month;

/**
 * 根据日期返回字符串
 */
+ (NSString *)th_stringWithDate:(NSDate *)date format:(NSString *)format;
- (NSString *)th_stringWithFormat:(NSString *)format;
+ (NSDate *)th_dateWithString:(NSString *)string format:(NSString *)format;

/**
 * 获取指定月份的天数
 */
- (NSUInteger)th_daysInMonth:(NSUInteger)month;
+ (NSUInteger)th_daysInMonth:(NSDate *)date month:(NSUInteger)month;

/**
 * 获取当前月份的天数
 */
- (NSUInteger)th_daysInMonth;
+ (NSUInteger)th_daysInMonth:(NSDate *)date;

/**
 * @param showDateInToday 当日的时间是否展示具体时间
 * 为false则返回x分钟前/x小时前/昨天/x天前/x个月前/x年前
 * 为true则返回xx:xx:xx/昨天/x天前/x个月前/x年前
 */
- (NSString *)th_timeInfoWithShowDateInToday:(BOOL)showDateInToday;
+ (NSString *)th_timeInfoWithDate:(NSDate *)date showDateInToday:(BOOL)showDateInToday;
+ (NSString *)th_timeInfoWithDateString:(NSString *)dateString showDateInToday:(BOOL)showDateInToday;

/**
 * 分别获取yyyy-MM-dd/HH:mm:ss/yyyy-MM-dd HH:mm:ss格式的字符串
 */
- (NSString *)th_ymdFormat;
- (NSString *)th_hmsFormat;
- (NSString *)th_ymdHmsFormat;
+ (NSString *)th_ymdFormat;
+ (NSString *)th_hmsFormat;
+ (NSString *)th_ymdHmsFormat;

@end
