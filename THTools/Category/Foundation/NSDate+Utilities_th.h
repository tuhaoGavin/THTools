//
//  NSDate+Utilities_th.h
//  THToolsDemo
//
//  Created by weixb on 2017/2/16.
//  Copyright © 2017年 weixb. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (Utilities_th)

+ (NSCalendar *)th_currentCalendar; // avoid bottlenecks
#pragma mark ---- Decomposing dates 分解的日期
@property (readonly) NSInteger th_nearestHour;
@property (readonly) NSInteger th_hour;
@property (readonly) NSInteger th_minute;
@property (readonly) NSInteger th_seconds;
@property (readonly) NSInteger th_day;
@property (readonly) NSInteger th_month;
@property (readonly) NSInteger th_week;
@property (readonly) NSInteger th_weekday;
@property (readonly) NSInteger th_nthWeekday; // e.g. 2nd Tuesday of the month == 2
@property (readonly) NSInteger th_year;

#pragma mark ----short time 格式化的时间
@property (nonatomic, readonly) NSString *th_shortString;
@property (nonatomic, readonly) NSString *th_shortDateString;
@property (nonatomic, readonly) NSString *th_shortTimeString;
@property (nonatomic, readonly) NSString *th_mediumString;
@property (nonatomic, readonly) NSString *th_mediumDateString;
@property (nonatomic, readonly) NSString *th_mediumTimeString;
@property (nonatomic, readonly) NSString *th_longString;
@property (nonatomic, readonly) NSString *th_longDateString;
@property (nonatomic, readonly) NSString *th_longTimeString;

///使用dateStyle timeStyle格式化时间
- (NSString *)th_stringWithDateStyle:(NSDateFormatterStyle)dateStyle timeStyle:(NSDateFormatterStyle)timeStyle;
///给定format格式化时间
- (NSString *)th_stringWithFormat:(NSString *)format;

#pragma mark ---- 从当前日期相对日期时间
///明天
+ (NSDate *)th_dateTomorrow;
///昨天
+ (NSDate *)th_dateYesterday;
///今天后几天
+ (NSDate *)th_dateWithDaysFromNow:(NSInteger)days;
///今天前几天
+ (NSDate *)th_dateWithDaysBeforeNow:(NSInteger)days;
///当前小时后dHours个小时
+ (NSDate *)th_dateWithHoursFromNow:(NSInteger)dHours;
///当前小时前dHours个小时
+ (NSDate *)th_dateWithHoursBeforeNow:(NSInteger)dHours;
///当前分钟后dMinutes个分钟
+ (NSDate *)th_dateWithMinutesFromNow:(NSInteger)dMinutes;
///当前分钟前dMinutes个分钟
+ (NSDate *)th_dateWithMinutesBeforeNow:(NSInteger)dMinutes;


#pragma mark ---- Comparing dates 比较时间
///比较年月日是否相等
- (BOOL)th_isEqualToDateIgnoringTime:(NSDate *)aDate;
///是否是今天
- (BOOL)th_isToday;
///是否是明天
- (BOOL)th_isTomorrow;
///是否是昨天
- (BOOL)th_isYesterday;

///是否是同一周
- (BOOL)th_isSameWeekAsDate:(NSDate *)aDate;
///是否是本周
- (BOOL)th_isThisWeek;
///是否是本周的下周
- (BOOL)th_isNextWeek;
///是否是本周的上周
- (BOOL)th_isLastWeek;

///是否是同一月
- (BOOL)th_isSameMonthAsDate:(NSDate *)aDate;
///是否是本月
- (BOOL)th_isThisMonth;
///是否是本月的下月
- (BOOL)th_isNextMonth;
///是否是本月的上月
- (BOOL)th_isLastMonth;

///是否是同一年
- (BOOL)th_isSameYearAsDate:(NSDate *)aDate;
///是否是今年
- (BOOL)th_isThisYear;
///是否是今年的下一年
- (BOOL)th_isNextYear;
///是否是今年的上一年
- (BOOL)th_isLastYear;

///是否提前aDate
- (BOOL)th_isEarlierThanDate:(NSDate *)aDate;
///是否晚于aDate
- (BOOL)th_isLaterThanDate:(NSDate *)aDate;
///是否晚是未来
- (BOOL)th_isInFuture;
///是否晚是过去
- (BOOL)th_isInPast;


///是否是工作日
- (BOOL)th_isTypicallyWorkday;
///是否是周末
- (BOOL)th_isTypicallyWeekend;

#pragma mark ---- Adjusting dates 调节时间
///增加dYears年
- (NSDate *)th_dateByAddingYears:(NSInteger)dYears;
///减少dYears年
- (NSDate *)th_dateBySubtractingYears:(NSInteger)dYears;
///增加dMonths月
- (NSDate *)th_dateByAddingMonths:(NSInteger)dMonths;
///减少dMonths月
- (NSDate *)th_dateBySubtractingMonths:(NSInteger)dMonths;
///增加dDays天
- (NSDate *)th_dateByAddingDays:(NSInteger)dDays;
///减少dDays天
- (NSDate *)th_dateBySubtractingDays:(NSInteger)dDays;
///增加dHours小时
- (NSDate *)th_dateByAddingHours:(NSInteger)dHours;
///减少dHours小时
- (NSDate *)th_dateBySubtractingHours:(NSInteger)dHours;
///增加dMinutes分钟
- (NSDate *)th_dateByAddingMinutes:(NSInteger)dMinutes;
///减少dMinutes分钟
- (NSDate *)th_dateBySubtractingMinutes:(NSInteger)dMinutes;


#pragma mark ---- 时间间隔
///比aDate晚多少分钟
- (NSInteger)th_minutesAfterDate:(NSDate *)aDate;
///比aDate早多少分钟
- (NSInteger)th_minutesBeforeDate:(NSDate *)aDate;
///比aDate晚多少小时
- (NSInteger)th_hoursAfterDate:(NSDate *)aDate;
///比aDate早多少小时
- (NSInteger)th_hoursBeforeDate:(NSDate *)aDate;
///比aDate晚多少天
- (NSInteger)th_daysAfterDate:(NSDate *)aDate;
///比aDate早多少天
- (NSInteger)th_daysBeforeDate:(NSDate *)aDate;

///与anotherDate间隔几天
- (NSInteger)th_distanceDaysToDate:(NSDate *)anotherDate;
///与anotherDate间隔几月
- (NSInteger)th_distanceMonthsToDate:(NSDate *)anotherDate;
///与anotherDate间隔几年
- (NSInteger)th_distanceYearsToDate:(NSDate *)anotherDate;

@end
