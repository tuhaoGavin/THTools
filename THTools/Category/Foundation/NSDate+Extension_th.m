//
//  NSDate+Extension_th.m
//  THToolsDemo
//
//  Created by 涂浩 on 2017/2/16.
//  Copyright © 2017年 TuHao. All rights reserved.
//

#import "NSDate+Extension_th.h"

@implementation NSDate (Extension_th)

- (NSUInteger)th_day {
    return [NSDate th_day:self];
}

- (NSUInteger)th_month {
    return [NSDate th_month:self];
}

- (NSUInteger)th_year {
    return [NSDate th_year:self];
}

- (NSUInteger)th_hour {
    return [NSDate th_hour:self];
}

- (NSUInteger)th_minute {
    return [NSDate th_minute:self];
}

- (NSUInteger)th_second {
    return [NSDate th_second:self];
}

+ (NSUInteger)th_day:(NSDate *)date {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
#if __IPHONE_OS_VERSION_MIN_REQUIRED >= __IPHONE_8_0
    // NSDayCalendarUnit
    NSDateComponents *dayComponents = [calendar components:(NSCalendarUnitDay) fromDate:date];
#else
    NSDateComponents *dayComponents = [calendar components:(NSDayCalendarUnit) fromDate:date];
#endif
    
    return [dayComponents day];
}

+ (NSUInteger)th_month:(NSDate *)date {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
#if __IPHONE_OS_VERSION_MIN_REQUIRED >= __IPHONE_8_0
    // NSDayCalendarUnit
    NSDateComponents *dayComponents = [calendar components:(NSCalendarUnitMonth) fromDate:date];
#else
    NSDateComponents *dayComponents = [calendar components:(NSMonthCalendarUnit) fromDate:date];
#endif
    
    return [dayComponents month];
}

+ (NSUInteger)th_year:(NSDate *)date {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
#if __IPHONE_OS_VERSION_MIN_REQUIRED >= __IPHONE_8_0
    // NSDayCalendarUnit
    NSDateComponents *dayComponents = [calendar components:(NSCalendarUnitYear) fromDate:date];
#else
    NSDateComponents *dayComponents = [calendar components:(NSYearCalendarUnit) fromDate:date];
#endif
    
    return [dayComponents year];
}

+ (NSUInteger)th_hour:(NSDate *)date {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
#if __IPHONE_OS_VERSION_MIN_REQUIRED >= __IPHONE_8_0
    // NSDayCalendarUnit
    NSDateComponents *dayComponents = [calendar components:(NSCalendarUnitHour) fromDate:date];
#else
    NSDateComponents *dayComponents = [calendar components:(NSHourCalendarUnit) fromDate:date];
#endif
    
    return [dayComponents hour];
}

+ (NSUInteger)th_minute:(NSDate *)date {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
#if __IPHONE_OS_VERSION_MIN_REQUIRED >= __IPHONE_8_0
    // NSDayCalendarUnit
    NSDateComponents *dayComponents = [calendar components:(NSCalendarUnitMinute) fromDate:date];
#else
    NSDateComponents *dayComponents = [calendar components:(NSMinuteCalendarUnit) fromDate:date];
#endif
    
    return [dayComponents minute];
}

+ (NSUInteger)th_second:(NSDate *)date {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
#if __IPHONE_OS_VERSION_MIN_REQUIRED >= __IPHONE_8_0
    // NSDayCalendarUnit
    NSDateComponents *dayComponents = [calendar components:(NSCalendarUnitSecond) fromDate:date];
#else
    NSDateComponents *dayComponents = [calendar components:(NSSecondCalendarUnit) fromDate:date];
#endif
    
    return [dayComponents second];
}

- (NSUInteger)th_daysInYear {
    return [NSDate th_daysInYear:self];
}

+ (NSUInteger)th_daysInYear:(NSDate *)date {
    return [self th_isLeapYear:date] ? 366 : 365;
}

- (BOOL)th_isLeapYear {
    return [NSDate th_isLeapYear:self];
}

+ (BOOL)th_isLeapYear:(NSDate *)date {
    NSUInteger year = [date th_year];
    if ((year % 4  == 0 && year % 100 != 0) || year % 400 == 0) {
        return YES;
    }
    return NO;
}

- (NSString *)th_formatYMD {
    return [NSDate th_formatYMD:self];
}

+ (NSString *)th_formatYMD:(NSDate *)date {
    return [NSString stringWithFormat:@"%tu-%02tu-%02tu",[date th_year], [date th_month], [date th_day]];
}

- (NSUInteger)th_weeksOfMonth {
    return [NSDate th_weeksOfMonth:self];
}

+ (NSUInteger)th_weeksOfMonth:(NSDate *)date {
    return [[date th_lastdayOfMonth] th_weekOfYear] - [[date th_begindayOfMonth] th_weekOfYear] + 1;
}

- (NSUInteger)th_weekOfYear {
    return [NSDate th_weekOfYear:self];
}

+ (NSUInteger)th_weekOfYear:(NSDate *)date {
    NSUInteger i;
    NSUInteger year = [date th_year];
    
    NSDate *lastdate = [date th_lastdayOfMonth];
    
    for (i = 1;[[lastdate th_dateAfterDay:-7 * i] th_year] == year; i++) {
        
    }
    
    return i;
}

- (NSDate *)th_dateAfterDay:(NSUInteger)day {
    return [NSDate th_dateAfterDate:self day:day];
}

+ (NSDate *)th_dateAfterDate:(NSDate *)date day:(NSInteger)day {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *componentsToAdd = [[NSDateComponents alloc] init];
    [componentsToAdd setDay:day];
    
    NSDate *dateAfterDay = [calendar dateByAddingComponents:componentsToAdd toDate:date options:0];
    
    return dateAfterDay;
}

- (NSDate *)th_dateAfterMonth:(NSUInteger)month {
    return [NSDate th_dateAfterDate:self month:month];
}

+ (NSDate *)th_dateAfterDate:(NSDate *)date month:(NSInteger)month {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *componentsToAdd = [[NSDateComponents alloc] init];
    [componentsToAdd setMonth:month];
    NSDate *dateAfterMonth = [calendar dateByAddingComponents:componentsToAdd toDate:date options:0];
    
    return dateAfterMonth;
}

- (NSDate *)th_begindayOfMonth {
    return [NSDate th_begindayOfMonth:self];
}

+ (NSDate *)th_begindayOfMonth:(NSDate *)date {
    return [self th_dateAfterDate:date day:-[date th_day] + 1];
}

- (NSDate *)th_lastdayOfMonth {
    return [NSDate th_lastdayOfMonth:self];
}

+ (NSDate *)th_lastdayOfMonth:(NSDate *)date {
    NSDate *lastDate = [self th_begindayOfMonth:date];
    return [[lastDate th_dateAfterMonth:1] th_dateAfterDay:-1];
}

- (NSUInteger)th_daysAgo {
    return [NSDate th_daysAgo:self];
}

+ (NSUInteger)th_daysAgo:(NSDate *)date {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
#if __IPHONE_OS_VERSION_MIN_REQUIRED >= __IPHONE_8_0
    NSDateComponents *components = [calendar components:(NSCalendarUnitDay)
                                               fromDate:date
                                                 toDate:[NSDate date]
                                                options:0];
#else
    NSDateComponents *components = [calendar components:(NSDayCalendarUnit)
                                               fromDate:date
                                                 toDate:[NSDate date]
                                                options:0];
#endif
    
    return [components day];
}

- (NSInteger)th_weekday {
    return [NSDate th_weekday:self];
}

+ (NSInteger)th_weekday:(NSDate *)date {
    NSCalendar *gregorian = [[NSCalendar alloc]
                             initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *comps = [gregorian components:(NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear | NSCalendarUnitWeekday) fromDate:date];
    NSInteger weekday = [comps weekday];
    
    return weekday;
}

- (NSString *)th_dayFromWeekday {
    return [NSDate th_dayFromWeekday:self];
}

+ (NSString *)th_dayFromWeekday:(NSDate *)date {
    switch([date th_weekday]) {
        case 1:
            return @"星期天";
            break;
        case 2:
            return @"星期一";
            break;
        case 3:
            return @"星期二";
            break;
        case 4:
            return @"星期三";
            break;
        case 5:
            return @"星期四";
            break;
        case 6:
            return @"星期五";
            break;
        case 7:
            return @"星期六";
            break;
        default:
            break;
    }
    return @"";
}

- (BOOL)th_isSameDay:(NSDate *)anotherDate {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components1 = [calendar components:(NSCalendarUnitYear
                                                          | NSCalendarUnitMonth
                                                          | NSCalendarUnitDay)
                                                fromDate:self];
    NSDateComponents *components2 = [calendar components:(NSCalendarUnitYear
                                                          | NSCalendarUnitMonth
                                                          | NSCalendarUnitDay)
                                                fromDate:anotherDate];
    return ([components1 year] == [components2 year]
            && [components1 month] == [components2 month]
            && [components1 day] == [components2 day]);
}

- (BOOL)th_isToday {
    return [self th_isSameDay:[NSDate date]];
}

- (NSDate *)th_dateByAddingDays:(NSUInteger)days {
    NSDateComponents *c = [[NSDateComponents alloc] init];
    c.day = days;
    return [[NSCalendar currentCalendar] dateByAddingComponents:c toDate:self options:0];
}

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
+ (NSString *)th_monthWithMonthNumber:(NSInteger)month {
    switch(month) {
        case 1:
            return @"January";
            break;
        case 2:
            return @"February";
            break;
        case 3:
            return @"March";
            break;
        case 4:
            return @"April";
            break;
        case 5:
            return @"May";
            break;
        case 6:
            return @"June";
            break;
        case 7:
            return @"July";
            break;
        case 8:
            return @"August";
            break;
        case 9:
            return @"September";
            break;
        case 10:
            return @"October";
            break;
        case 11:
            return @"November";
            break;
        case 12:
            return @"December";
            break;
        default:
            break;
    }
    return @"";
}

+ (NSString *)th_stringWithDate:(NSDate *)date format:(NSString *)format {
    return [date th_stringWithFormat:format];
}

- (NSString *)th_stringWithFormat:(NSString *)format {
    NSDateFormatter *outputFormatter = [[NSDateFormatter alloc] init];
    [outputFormatter setDateFormat:format];
    
    NSString *retStr = [outputFormatter stringFromDate:self];
    
    return retStr;
}

+ (NSDate *)th_dateWithString:(NSString *)string format:(NSString *)format {
    NSDateFormatter *inputFormatter = [[NSDateFormatter alloc] init];
    [inputFormatter setDateFormat:format];
    
    NSDate *date = [inputFormatter dateFromString:string];
    
    return date;
}

- (NSUInteger)th_daysInMonth:(NSUInteger)month {
    return [NSDate th_daysInMonth:self month:month];
}

+ (NSUInteger)th_daysInMonth:(NSDate *)date month:(NSUInteger)month {
    switch (month) {
        case 1: case 3: case 5: case 7: case 8: case 10: case 12:
            return 31;
        case 2:
            return [date th_isLeapYear] ? 29 : 28;
    }
    return 30;
}

- (NSUInteger)th_daysInMonth {
    return [NSDate th_daysInMonth:self];
}

+ (NSUInteger)th_daysInMonth:(NSDate *)date {
    return [self th_daysInMonth:date month:[date th_month]];
}

- (NSString *)th_timeInfoWithShowDateInToday:(BOOL)showDateInToday {
    return [NSDate th_timeInfoWithDate:self showDateInToday:showDateInToday];
}

+ (NSString *)th_timeInfoWithDate:(NSDate *)date showDateInToday:(BOOL)showDateInToday {
    return [self th_timeInfoWithDateString:[self th_stringWithDate:date format:[self th_ymdHmsFormat]] showDateInToday:showDateInToday];
}

+ (NSString *)th_timeInfoWithDateString:(NSString *)dateString showDateInToday:(BOOL)showDateInToday {
    NSDate *date = [self th_dateWithString:dateString format:[self th_ymdHmsFormat]];
    
    NSDate *curDate = [NSDate date];
    NSTimeInterval time = -[date timeIntervalSinceDate:curDate];
    
    int month = (int)([curDate th_month] - [date th_month]);
    int year = (int)([curDate th_year] - [date th_year]);
    int day = (int)([curDate th_day] - [date th_day]);
    
    if (month == 0 && year == 0 && day < 2) {
        if (showDateInToday) {
            if (day == 0) {
                return [date th_stringWithFormat:[self th_hmsFormat]];
            } else if (day == 1) {
                return @"昨天";
            }
            
        } else {
            NSTimeInterval retTime = 1.0;
            if (time < 3600) { // 小于一小时
                retTime = time / 60;
                retTime = retTime <= 0.0 ? 1.0 : retTime;
                return [NSString stringWithFormat:@"%.0f分钟前", retTime];
            } else if (time < 3600 * 24) { // 小于一天，也就是今天
                retTime = time / 3600;
                retTime = retTime <= 0.0 ? 1.0 : retTime;
                return [NSString stringWithFormat:@"%.0f小时前", retTime];
            } else if (time < 3600 * 24 * 2) {
                return @"昨天";
            }
        }
    }
    
    // 第一个条件是同年，且相隔时间在一个月内
    // 第二个条件是隔年，对于隔年，只能是去年12月与今年1月这种情况
    else if ((abs(year) == 0 && abs(month) <= 1)
             || (abs(year) == 1 && [curDate th_month] == 1 && [date th_month] == 12)) {
        int retDay = 0;
        if (year == 0) { // 同年
            if (month == 0) { // 同月
                retDay = day;
            }
        }
        
        if (retDay <= 0) {
            // 获取发布日期中，该月有多少天
            int totalDays = (int)[self th_daysInMonth:date month:[date th_month]];
            
            // 当前天数 + （发布日期月中的总天数-发布日期月中发布日，即等于距离今天的天数）
            retDay = (int)[curDate th_day] + (totalDays - (int)[date th_day]);
        }
        
        return [NSString stringWithFormat:@"%d天前", (abs)(retDay)];
    } else  {
        if (abs(year) <= 1) {
            if (year == 0) { // 同年
                return [NSString stringWithFormat:@"%d个月前", abs(month)];
            }
            
            // 隔年
            int month = (int)[curDate th_month];
            int preMonth = (int)[date th_month];
            if (month == 12 && preMonth == 12) {// 隔年，但同月，就作为满一年来计算
                return @"1年前";
            }
            return [NSString stringWithFormat:@"%d个月前", (abs)(12 - preMonth + month)];
        }
        
        return [NSString stringWithFormat:@"%d年前", abs(year)];
    }
    
    return @"1小时前";
}

- (NSString *)th_ymdFormat {
    return [NSDate th_ymdFormat];
}

- (NSString *)th_hmsFormat {
    return [NSDate th_hmsFormat];
}

- (NSString *)th_ymdHmsFormat {
    return [NSDate th_ymdHmsFormat];
}

+ (NSString *)th_ymdFormat {
    return @"yyyy-MM-dd";
}

+ (NSString *)th_hmsFormat {
    return @"HH:mm:ss";
}

+ (NSString *)th_ymdHmsFormat {
    return [NSString stringWithFormat:@"%@ %@", [self th_ymdFormat], [self th_hmsFormat]];
}

- (NSDate *)th_offsetYears:(int)numYears {
    return [NSDate th_offsetYears:numYears fromDate:self];
}

+ (NSDate *)th_offsetYears:(int)numYears fromDate:(NSDate *)fromDate {
    if (fromDate == nil) {
        return nil;
    }
    
#if __IPHONE_OS_VERSION_MIN_REQUIRED >= __IPHONE_8_0
    // NSDayCalendarUnit
    NSCalendar *gregorian = [[NSCalendar alloc]
                             initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
#else
    NSCalendar *gregorian = [[NSCalendar alloc]
                             initWithCalendarIdentifier:NSGregorianCalendar];
#endif
    
    
    NSDateComponents *offsetComponents = [[NSDateComponents alloc] init];
    [offsetComponents setYear:numYears];
    
    return [gregorian dateByAddingComponents:offsetComponents
                                      toDate:fromDate
                                     options:0];
}

- (NSDate *)th_offsetMonths:(int)numMonths {
    return [NSDate th_offsetMonths:numMonths fromDate:self];
}

+ (NSDate *)th_offsetMonths:(int)numMonths fromDate:(NSDate *)fromDate {
    if (fromDate == nil) {
        return nil;
    }
    
#if __IPHONE_OS_VERSION_MIN_REQUIRED >= __IPHONE_8_0
    // NSDayCalendarUnit
    NSCalendar *gregorian = [[NSCalendar alloc]
                             initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
#else
    NSCalendar *gregorian = [[NSCalendar alloc]
                             initWithCalendarIdentifier:NSGregorianCalendar];
#endif
    
    
    NSDateComponents *offsetComponents = [[NSDateComponents alloc] init];
    [offsetComponents setMonth:numMonths];
    
    return [gregorian dateByAddingComponents:offsetComponents
                                      toDate:fromDate
                                     options:0];
}

- (NSDate *)th_offsetDays:(int)numDays {
    return [NSDate th_offsetDays:numDays fromDate:self];
}

+ (NSDate *)th_offsetDays:(int)numDays fromDate:(NSDate *)fromDate {
    if (fromDate == nil) {
        return nil;
    }
    
#if __IPHONE_OS_VERSION_MIN_REQUIRED >= __IPHONE_8_0
    // NSDayCalendarUnit
    NSCalendar *gregorian = [[NSCalendar alloc]
                             initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
#else
    NSCalendar *gregorian = [[NSCalendar alloc]
                             initWithCalendarIdentifier:NSGregorianCalendar];
#endif
    
    
    NSDateComponents *offsetComponents = [[NSDateComponents alloc] init];
    [offsetComponents setDay:numDays];
    
    return [gregorian dateByAddingComponents:offsetComponents
                                      toDate:fromDate
                                     options:0];
}

- (NSDate *)th_offsetHours:(int)hours {
    return [NSDate th_offsetHours:hours fromDate:self];
}

+ (NSDate *)th_offsetHours:(int)numHours fromDate:(NSDate *)fromDate {
    if (fromDate == nil) {
        return nil;
    }
    
#if __IPHONE_OS_VERSION_MIN_REQUIRED >= __IPHONE_8_0
    // NSDayCalendarUnit
    NSCalendar *gregorian = [[NSCalendar alloc]
                             initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
#else
    NSCalendar *gregorian = [[NSCalendar alloc]
                             initWithCalendarIdentifier:NSGregorianCalendar];
#endif
    
    
    NSDateComponents *offsetComponents = [[NSDateComponents alloc] init];
    [offsetComponents setHour:numHours];
    
    return [gregorian dateByAddingComponents:offsetComponents
                                      toDate:fromDate
                                     options:0];
}

@end
