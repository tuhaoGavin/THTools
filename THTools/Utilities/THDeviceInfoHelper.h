//
//  CSDeviceInfoHelper.h
//  CodeStandardsDemo
//
//  Created by taihe-ios-imac-01 on 2019/9/10.
//  Copyright © 2019 太合音乐. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "THAppMacro.h"
#include <sys/types.h>
#include <sys/sysctl.h>

#import <sys/socket.h>
#import <sys/param.h>
#import <sys/mount.h>
#import <sys/stat.h>
#import <sys/utsname.h>
#import <net/if.h>
#import <net/if_dl.h>
#import <mach/mach.h>
#import <mach/mach_host.h>
#import <mach/processor_info.h>

NS_ASSUME_NONNULL_BEGIN

NS_INLINE NSString * AppBundleID() {
    return [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleIdentifier"];
}

/**
* 系统版本是否大于8
*/
NS_INLINE BOOL IOS8() {
    return [[[UIDevice currentDevice] systemVersion] doubleValue] >= 8.0;
}

/**
 * 手机系统版本
 */
NS_INLINE NSString *SystemVersion() {
    return [[UIDevice currentDevice] systemVersion];
}

/**
 * 设备名称 e.g. "My iPhone"
 */
NS_INLINE NSString *DeviceName() {
    return [[UIDevice currentDevice] name];
}

/**
 * 设备模型 e.g. @"iPhone", @"iPod touch"
 */
NS_INLINE NSString *DeviceModel() {
    return [[UIDevice currentDevice] model];
}

NS_INLINE NSUInteger _GetSysInfo(int typeSpecifier) {
    size_t size = sizeof(int);
    int result;
    int mib[2] = {CTL_HW, typeSpecifier};
    sysctl(mib, 2, &result, &size, NULL, 0);
    return (NSUInteger)result;
}

/**
 * CPU核心数
 */
NS_INLINE NSUInteger CpuNumber() {
    return _GetSysInfo(HW_NCPU);
}

/**
 * 手机内存总量, 返回的是字节数
 */
NS_INLINE NSUInteger TotalMemoryBytes() {
    return _GetSysInfo(HW_PHYSMEM);
}

/**
 * 获取app占用内存, 返回的是字节数
 */
NS_INLINE int64_t UsedMemoryBytes() {
    
    int64_t memoryUsageInByte = 0;
    task_vm_info_data_t vmInfo;
    mach_msg_type_number_t count = TASK_VM_INFO_COUNT;
    kern_return_t kernelReturn = task_info(mach_task_self(), TASK_VM_INFO, (task_info_t) &vmInfo, &count);
    if(kernelReturn == KERN_SUCCESS) {
        memoryUsageInByte = (int64_t) vmInfo.phys_footprint;
    } else {
        NSLog(@"Error with task_info(): %s", mach_error_string(kernelReturn));
    }
    return memoryUsageInByte;
}

/**
 * 获取手机硬盘空闲空间, 返回的是字节数
 */
NS_INLINE int64_t FreeDiskSpaceBytes() {
    struct statfs buf;
    long long freespace;
    freespace = 0;
    if ( statfs("/private/var", &buf) >= 0 ) {
        freespace = (long long)buf.f_bsize * buf.f_bfree;
    }
    return freespace;
}

/**
 * 获取手机硬盘总空间, 返回的是字节数
 */
NS_INLINE int64_t TotalDiskSpaceBytes() {
    struct statfs buf;
    long long totalspace;
    totalspace = 0;
    if ( statfs("/private/var", &buf) >= 0 ) {
        totalspace = (long long)buf.f_bsize * buf.f_blocks;
    }
    return totalspace;
}

/**
 * 获取当前电池电量，返回值为小数
 */
NS_INLINE float BattetyLavel() {
    [UIDevice currentDevice].batteryMonitoringEnabled = YES;
    return [UIDevice currentDevice].batteryLevel;
}

/**
 * 项目版本
 */
NS_INLINE NSString *ProjectVersion() {
    return [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
}

@interface THDeviceInfoHelper : NSObject

/**
 * 设备名称(型号)
 */
+ (NSString *)phoneName;

@end

NS_ASSUME_NONNULL_END

