//
//  UIDevice+Hardware_th.h
//  THToolsDemo
//
//  Created by 涂浩 on 2017/2/16.
//  Copyright © 2017年 TuHao. All rights reserved.
//
//  https://github.com/fahrulazmi/UIDeviceHardware/blob/master/UIDeviceHardware.m

#import <UIKit/UIKit.h>

@interface UIDevice (Hardware_th)

/** 是否s为iPhone X系列设备 */
+ (BOOL)isIPhoneXSeries;

+ (NSString *)th_name;
+ (NSString *)th_mode;
+ (NSString *)th_localizedModel;
+ (NSString *)th_systemName;
+ (NSString *)th_systemVersion;
+ (NSString *)th_platform;
+ (NSString *)th_platformString;


+ (NSString *)th_macAddress;

//Return the current device CPU frequency
+ (NSUInteger)th_cpuFrequency;
// Return the current device BUS frequency
+ (NSUInteger)th_busFrequency;
//current device RAM size
+ (NSUInteger)th_ramSize;
//Return the current device CPU number
+ (NSUInteger)th_cpuNumber;
//Return the current device total memory


/// 判断当前系统是否有摄像头
+ (BOOL)th_hasCamera;
/// 获取手机内存总量, 返回的是字节数
+ (NSUInteger)th_totalMemoryBytes;
/// 获取手机可用内存, 返回的是字节数
+ (NSUInteger)th_freeMemoryBytes;

/// 获取手机硬盘空闲空间, 返回的是字节数
+ (long long)th_freeDiskSpaceBytes;
/// 获取手机硬盘总空间, 返回的是字节数
+ (long long)th_totalDiskSpaceBytes;

@end
