//
//  THLocalNotification.h
//  Tools
//
//  Created by 涂浩 on 16/12/15.
//  Copyright © 2016年 TuHao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface THLocalNotification : NSObject

+ (void)createLocalNotificationWithTitle:(NSString *)title alertBody:(NSString *)alertBody userInfo:(NSDictionary *)userInfo date:(NSDate *)date;

+ (void)registerUserNotificationWithCategory:(BOOL)isSupport;
//+ (void)scheduleLocalNotification;
+ (void)scheduleLocalNotificationWithRepeatInterval:(NSCalendarUnit)repeatInterval alertBody:(NSString *)alertBody userInfo:(NSDictionary *)userInfo date:(NSDate *)date;

@end
