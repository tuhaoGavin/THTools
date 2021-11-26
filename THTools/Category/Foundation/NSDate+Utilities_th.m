//
//  NSDate+Utilities_th.m
//  THToolsDemo
//
//  Created by 涂浩 on 2017/2/16.
//  Copyright © 2017年 TuHao. All rights reserved.
//

#import "NSDate+Utilities_th.h"
#define D_MINUTE	60
#define D_HOUR		3600
#define D_DAY		86400
#define D_WEEK		604800
#define D_YEAR		31556926

// Thanks, AshFurrow
static const unsigned componentFlags = (NSCalendarUnitYear| NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitWeekOfYear |  NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond | NSCalendarUnitWeekday | NSCalendarUnitWeekdayOrdinal);

@implementation NSDate (Utilities_th)

// Courtesy of Lukasz Margielewski
// Updated via Holger Haenisch
+ (NSCalendar *) th_currentCalendar
{
    static NSCalendar *sharedCalendar = nil;
    if (!sharedCalendar)
        sharedCalendar = [NSCalendar autoupdatingCurrentCalendar];
    return sharedCalendar;
}

#pragma mark - Relative Dates

+ (NSDate *)th_dateWithDaysFromNow: (NSInteger) days
{
    // Thanks, Jim Morrison
    return [[NSDate date] th_dateByAddingDays:days];
}

+ (NSDate *)th_dateWithDaysBeforeNow: (NSInteger) days
{
    // Thanks, Jim Morrison
    return [[NSDate date] th_dateBySubtractingDays:days];
}

+ (NSDate *) th_dateTomorrow
{
    return [NSDate th_dateWithDaysFromNow:1];
}

+ (NSDate *) th_dateYesterday
{
    return [NSDate th_dateWithDaysBeforeNow:1];
}

+ (NSDate *) th_dateWithHoursFromNow: (NSInteger) dHours
{
    NSTimeInterval aTimeInterval = [[NSDate date] timeIntervalSinceReferenceDate] + D_HOUR * dHours;
    NSDate *newDate = [NSDate dateWithTimeIntervalSinceReferenceDate:aTimeInterval];
    return newDate;
}

+ (NSDate *) th_dateWithHoursBeforeNow: (NSInteger) dHours
{
    NSTimeInterval aTimeInterval = [[NSDate date] timeIntervalSinceReferenceDate] - D_HOUR * dHours;
    NSDate *newDate = [NSDate dateWithTimeIntervalSinceReferenceDate:aTimeInterval];
    return newDate;
}

+ (NSDate *) th_dateWithMinutesFromNow: (NSInteger) dMinutes
{
    NSTimeInterval aTimeInterval = [[NSDate date] timeIntervalSinceReferenceDate] + D_MINUTE * dMinutes;
    NSDate *newDate = [NSDate dateWithTimeIntervalSinceReferenceDate:aTimeInterval];
    return newDate;
}

+ (NSDate *) th_dateWithMinutesBeforeNow: (NSInteger) dMinutes
{
    NSTimeInterval aTimeInterval = [[NSDate date] timeIntervalSinceReferenceDate] - D_MINUTE * dMinutes;
    NSDate *newDate = [NSDate dateWithTimeIntervalSinceReferenceDate:aTimeInterval];
    return newDate;
}

#pragma mark - String Properties
- (NSString *) th_stringWithFormat: (NSString *) format
{
    NSDateFormatter *formatter = [NSDateFormatter new];
    //    formatter.locale = [NSLocale currentLocale]; // Necessary?
    formatter.dateFormat = format;
    return [formatter stringFromDate:self];
}

- (NSString *) th_stringWithDateStyle: (NSDateFormatterStyle) dateStyle timeStyle: (NSDateFormatterStyle) timeStyle
{
    NSDateFormatter *formatter = [NSDateFormatter new];
    formatter.dateStyle = dateStyle;
    formatter.timeStyle = timeStyle;
    //    formatter.locale = [NSLocale currentLocale]; // Necessary?
    return [formatter stringFromDate:self];
}

- (NSString *) th_shortString
{
    return [self th_stringWithDateStyle:NSDateFormatterShortStyle timeStyle:NSDateFormatterShortStyle];
}

- (NSString *) th_shortTimeString
{
    return [self th_stringWithDateStyle:NSDateFormatterNoStyle timeStyle:NSDateFormatterShortStyle];
}

- (NSString *) th_shortDateString
{
    return [self th_stringWithDateStyle:NSDateFormatterShortStyle timeStyle:NSDateFormatterNoStyle];
}

- (NSString *) th_mediumString
{
    return [self th_stringWithDateStyle:NSDateFormatterMediumStyle timeStyle:NSDateFormatterMediumStyle ];
}

- (NSString *) th_mediumTimeString
{
    return [self th_stringWithDateStyle:NSDateFormatterNoStyle timeStyle:NSDateFormatterMediumStyle ];
}

- (NSString *) th_mediumDateString
{
    return [self th_stringWithDateStyle:NSDateFormatterMediumStyle  timeStyle:NSDateFormatterNoStyle];
}

- (NSString *) th_longString
{
    return [self th_stringWithDateStyle:NSDateFormatterLongStyle timeStyle:NSDateFormatterLongStyle ];
}

- (NSString *) th_longTimeString
{
    return [self th_stringWithDateStyle:NSDateFormatterNoStyle timeStyle:NSDateFormatterLongStyle ];
}

- (NSString *) th_longDateString
{
    return [self th_stringWithDateStyle:NSDateFormatterLongStyle  timeStyle:NSDateFormatterNoStyle];
}

#pragma mark - Comparing Dates

- (BOOL) th_isEqualToDateIgnoringTime: (NSDate *) aDate
{
    NSDateComponents *components1 = [[NSDate th_currentCalendar] components:componentFlags fromDate:self];
    NSDateComponents *components2 = [[NSDate th_currentCalendar] components:componentFlags fromDate:aDate];
    return ((components1.year == components2.year) &&
            (components1.month == components2.month) &&
            (components1.day == components2.day));
}

- (BOOL) th_isToday
{
    return [self th_isEqualToDateIgnoringTime:[NSDate date]];
}

- (BOOL) th_isTomorrow
{
    return [self th_isEqualToDateIgnoringTime:[NSDate th_dateTomorrow]];
}

- (BOOL) th_isYesterday
{
    return [self th_isEqualToDateIgnoringTime:[NSDate th_dateYesterday]];
}

// This hard codes the assumption that a week is 7 days
- (BOOL)th_isSameWeekAsDate: (NSDate *) aDate
{
    NSDateComponents *components1 = [[NSDate th_currentCalendar] components:componentFlags fromDate:self];
    NSDateComponents *components2 = [[NSDate th_currentCalendar] components:componentFlags fromDate:aDate];
    
#pragma clang diagnostic push
#pragma clang diagnostic ignored"-Wdeprecated-declarations"
    // Must be same week. 12/31 and 1/1 will both be week "1" if they are in the same week
    if (components1.week != components2.week) return NO;
#pragma clang diagnostic pop
    
    // Must have a time interval under 1 week. Thanks @aclark
    return (fabs([self timeIntervalSinceDate:aDate]) < D_WEEK);
    
}

- (BOOL) th_isThisWeek
{
    return [self th_isSameWeekAsDate:[NSDate date]];
}

- (BOOL) th_isNextWeek
{
    NSTimeInterval aTimeInterval = [[NSDate date] timeIntervalSinceReferenceDate] + D_WEEK;
    NSDate *newDate = [NSDate dateWithTimeIntervalSinceReferenceDate:aTimeInterval];
    return [self th_isSameWeekAsDate:newDate];
}

- (BOOL) th_isLastWeek
{
    NSTimeInterval aTimeInterval = [[NSDate date] timeIntervalSinceReferenceDate] - D_WEEK;
    NSDate *newDate = [NSDate dateWithTimeIntervalSinceReferenceDate:aTimeInterval];
    return [self th_isSameWeekAsDate:newDate];
}

// Thanks, mspasov
- (BOOL) th_isSameMonthAsDate: (NSDate *) aDate
{
    NSDateComponents *components1 = [[NSDate th_currentCalendar] components:NSCalendarUnitYear | NSCalendarUnitMonth fromDate:self];
    NSDateComponents *components2 = [[NSDate th_currentCalendar] components:NSCalendarUnitYear | NSCalendarUnitMonth fromDate:aDate];
    return ((components1.month == components2.month) &&
            (components1.year == components2.year));
}

- (BOOL) th_isThisMonth
{
    return [self th_isSameMonthAsDate:[NSDate date]];
}

// Thanks Marcin Krzyzanowski, also for adding/subtracting years and months
- (BOOL) th_isLastMonth
{
    return [self th_isSameMonthAsDate:[[NSDate date] th_dateBySubtractingMonths:1]];
}

- (BOOL) th_isNextMonth
{
    return [self th_isSameMonthAsDate:[[NSDate date] th_dateByAddingMonths:1]];
}

- (BOOL) th_isSameYearAsDate: (NSDate *) aDate
{
    NSDateComponents *components1 = [[NSDate th_currentCalendar] components:NSCalendarUnitYear fromDate:self];
    NSDateComponents *components2 = [[NSDate th_currentCalendar] components:NSCalendarUnitYear fromDate:aDate];
    return (components1.year == components2.year);
}

- (BOOL) th_isThisYear
{
    // Thanks, baspellis
    return [self th_isSameYearAsDate:[NSDate date]];
}

- (BOOL) th_isNextYear
{
    NSDateComponents *components1 = [[NSDate th_currentCalendar] components:NSCalendarUnitYear fromDate:self];
    NSDateComponents *components2 = [[NSDate th_currentCalendar] components:NSCalendarUnitYear fromDate:[NSDate date]];
    
    return (components1.year == (components2.year + 1));
}

- (BOOL) th_isLastYear
{
    NSDateComponents *components1 = [[NSDate th_currentCalendar] components:NSCalendarUnitYear fromDate:self];
    NSDateComponents *components2 = [[NSDate th_currentCalendar] components:NSCalendarUnitYear fromDate:[NSDate date]];
    
    return (components1.year == (components2.year - 1));
}

- (BOOL) th_isEarlierThanDate: (NSDate *) aDate
{
    return ([self compare:aDate] == NSOrderedAscending);
}

- (BOOL) th_isLaterThanDate: (NSDate *) aDate
{
    return ([self compare:aDate] == NSOrderedDescending);
}

// Thanks, markrickert
- (BOOL) th_isInFuture
{
    return ([self th_isLaterThanDate:[NSDate date]]);
}

// Thanks, markrickert
- (BOOL) th_isInPast
{
    return ([self th_isEarlierThanDate:[NSDate date]]);
}


#pragma mark - Roles
- (BOOL) th_isTypicallyWeekend
{
    NSDateComponents *components = [[NSDate th_currentCalendar] components:NSCalendarUnitWeekday fromDate:self];
    if ((components.weekday == 1) ||
        (components.weekday == 7))
        return YES;
    return NO;
}

- (BOOL) th_isTypicallyWorkday
{
    return ![self th_isTypicallyWeekend];
}

#pragma mark - Adjusting Dates

// Thaks, rsjohnson
- (NSDate *) th_dateByAddingYears: (NSInteger) dYears
{
    NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
    [dateComponents setYear:dYears];
    NSDate *newDate = [[NSCalendar currentCalendar] dateByAddingComponents:dateComponents toDate:self options:0];
    return newDate;
}

- (NSDate *) th_dateBySubtractingYears: (NSInteger) dYears
{
    return [self th_dateByAddingYears:-dYears];
}

- (NSDate *) th_dateByAddingMonths: (NSInteger) dMonths
{
    NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
    [dateComponents setMonth:dMonths];
    NSDate *newDate = [[NSCalendar currentCalendar] dateByAddingComponents:dateComponents toDate:self options:0];
    return newDate;
}

- (NSDate *) th_dateBySubtractingMonths: (NSInteger) dMonths
{
    return [self th_dateByAddingMonths:-dMonths];
}

// Courtesy of dedan who mentions issues with Daylight Savings
- (NSDate *) th_dateByAddingDays: (NSInteger) dDays
{
    NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
    [dateComponents setDay:dDays];
    NSDate *newDate = [[NSCalendar currentCalendar] dateByAddingComponents:dateComponents toDate:self options:0];
    return newDate;
}

- (NSDate *) th_dateBySubtractingDays: (NSInteger) dDays
{
    return [self th_dateByAddingDays: (dDays * -1)];
}

- (NSDate *) th_dateByAddingHours: (NSInteger) dHours
{
    NSTimeInterval aTimeInterval = [self timeIntervalSinceReferenceDate] + D_HOUR * dHours;
    NSDate *newDate = [NSDate dateWithTimeIntervalSinceReferenceDate:aTimeInterval];
    return newDate;
}

- (NSDate *) th_dateBySubtractingHours: (NSInteger) dHours
{
    return [self th_dateByAddingHours: (dHours * -1)];
}

- (NSDate *) th_dateByAddingMinutes: (NSInteger) dMinutes
{
    NSTimeInterval aTimeInterval = [self timeIntervalSinceReferenceDate] + D_MINUTE * dMinutes;
    NSDate *newDate = [NSDate dateWithTimeIntervalSinceReferenceDate:aTimeInterval];
    return newDate;
}

- (NSDate *) th_dateBySubtractingMinutes: (NSInteger) dMinutes
{
    return [self th_dateByAddingMinutes: (dMinutes * -1)];
}

- (NSDateComponents *) th_componentsWithOffsetFromDate: (NSDate *) aDate
{
    NSDateComponents *dTime = [[NSDate th_currentCalendar] components:componentFlags fromDate:aDate toDate:self options:0];
    return dTime;
}

#pragma mark - Extremes

- (NSDate *) th_dateAtStartOfDay
{
    NSDateComponents *components = [[NSDate th_currentCalendar] components:componentFlags fromDate:self];
    components.hour = 0;
    components.minute = 0;
    components.second = 0;
    return [[NSDate th_currentCalendar] dateFromComponents:components];
}

// Thanks gsempe & mteece
- (NSDate *) th_dateAtEndOfDay
{
    NSDateComponents *components = [[NSDate th_currentCalendar] components:componentFlags fromDate:self];
    
    components.hour = 23; // Thanks Aleksey Kononov
    components.minute = 59;
    components.second = 59;
    return [[NSDate th_currentCalendar] dateFromComponents:components];
}

#pragma mark - Retrieving Intervals

- (NSInteger) th_minutesAfterDate: (NSDate *) aDate
{
    NSTimeInterval ti = [self timeIntervalSinceDate:aDate];
    return (NSInteger) (ti / D_MINUTE);
}

- (NSInteger) th_minutesBeforeDate: (NSDate *) aDate
{
    NSTimeInterval ti = [aDate timeIntervalSinceDate:self];
    return (NSInteger) (ti / D_MINUTE);
}

- (NSInteger) th_hoursAfterDate: (NSDate *) aDate
{
    NSTimeInterval ti = [self timeIntervalSinceDate:aDate];
    return (NSInteger) (ti / D_HOUR);
}

- (NSInteger) th_hoursBeforeDate: (NSDate *) aDate
{
    NSTimeInterval ti = [aDate timeIntervalSinceDate:self];
    return (NSInteger) (ti / D_HOUR);
}

- (NSInteger) th_daysAfterDate: (NSDate *) aDate
{
    NSTimeInterval ti = [self timeIntervalSinceDate:aDate];
    return (NSInteger) (ti / D_DAY);
}

- (NSInteger) th_daysBeforeDate: (NSDate *) aDate
{
    NSTimeInterval ti = [aDate timeIntervalSinceDate:self];
    return (NSInteger) (ti / D_DAY);
}

// Thanks, dmitrydims
// I have not yet thoroughly tested this
- (NSInteger)th_distanceDaysToDate:(NSDate *)anotherDate
{
    NSCalendar *gregorianCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *components = [gregorianCalendar components:NSCalendarUnitDay fromDate:self toDate:anotherDate options:0];
    return components.day;
}
- (NSInteger)th_distanceMonthsToDate:(NSDate *)anotherDate{
    NSCalendar *gregorianCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *components = [gregorianCalendar components:NSCalendarUnitMonth fromDate:self toDate:anotherDate options:0];
    return components.month;
}
- (NSInteger)th_distanceYearsToDate:(NSDate *)anotherDate{
    NSCalendar *gregorianCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *components = [gregorianCalendar components:NSCalendarUnitYear fromDate:self toDate:anotherDate options:0];
    return components.year;
}
#pragma mark Decomposing Dates
- (NSInteger)th_nearestHour
{
    NSTimeInterval aTimeInterval = [[NSDate date] timeIntervalSinceReferenceDate] + D_MINUTE * 30;
    NSDate *newDate = [NSDate dateWithTimeIntervalSinceReferenceDate:aTimeInterval];
    NSDateComponents *components = [[NSDate th_currentCalendar] components:NSCalendarUnitHour fromDate:newDate];
    return components.hour;
}
- (NSInteger) th_hour
{
    NSDateComponents *components = [[NSDate th_currentCalendar] components:componentFlags fromDate:self];
    return components.hour;
}

- (NSInteger) th_minute
{
    NSDateComponents *components = [[NSDate th_currentCalendar] components:componentFlags fromDate:self];
    return components.minute;
}

- (NSInteger) th_seconds
{
    NSDateComponents *components = [[NSDate th_currentCalendar] components:componentFlags fromDate:self];
    return components.second;
}

- (NSInteger) th_day
{
    NSDateComponents *components = [[NSDate th_currentCalendar] components:componentFlags fromDate:self];
    return components.day;
}

- (NSInteger) th_month
{
    NSDateComponents *components = [[NSDate th_currentCalendar] components:componentFlags fromDate:self];
    return components.month;
}

- (NSInteger) th_week
{
    NSDateComponents *components = [[NSDate th_currentCalendar] components:componentFlags fromDate:self];
    return components.weekOfMonth;
}

- (NSInteger) th_weekday
{
    NSDateComponents *components = [[NSDate th_currentCalendar] components:componentFlags fromDate:self];
    return components.weekday;
}

- (NSInteger) th_nthWeekday // e.g. 2nd Tuesday of the month is 2
{
    NSDateComponents *components = [[NSDate th_currentCalendar] components:componentFlags fromDate:self];
    return components.weekdayOrdinal;
}

- (NSInteger) th_year
{
    NSDateComponents *components = [[NSDate th_currentCalendar] components:componentFlags fromDate:self];
    return components.year;
}

@end
