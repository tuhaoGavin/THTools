//
//  UIApplication+Util_th.h
//  THToolsDemo
//
//  Created by 涂浩 on 2018/2/4.
//  Copyright © 2018年 TuHao. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^THRegistAPNSBlock)(BOOL granted);

@interface UIApplication (Util_th)

/**
 *  注册APNs
 */
+ (void)th_registerAPNsWithBlock:(THRegistAPNSBlock)block;

/**
 *  获取启动页图片
 *
 *  @return 启动页图片
 */
+ (UIImage *)th_launchImage;

/// Application's Bundle Name (show in SpringBoard).
@property (nullable, nonatomic, readonly) NSString *th_appBundleName;

/// Application's Bundle ID.  e.g. "com.ibireme.MyApp"
@property (nullable, nonatomic, readonly) NSString *th_appBundleID;

/// Application's Version.  e.g. "1.2.0"
@property (nullable, nonatomic, readonly) NSString *th_appVersion;

/// Application's Build number. e.g. "123"
@property (nullable, nonatomic, readonly) NSString *th_appBuildVersion;

/// Whether this app is pirated (not install from appstore).
@property (nonatomic, readonly) BOOL th_isPirated;

/// Whether this app is being debugged (debugger attached).
@property (nonatomic, readonly) BOOL th_isBeingDebugged;

/// Current thread real memory used in byte. (-1 when error occurs)
@property (nonatomic, readonly) int64_t th_memoryUsage;

/// Current thread CPU usage, 1.0 means 100%. (-1 when error occurs)
@property (nonatomic, readonly) float th_cpuUsage;


@end

NS_ASSUME_NONNULL_END
