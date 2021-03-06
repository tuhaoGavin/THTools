//
//  UIApplication+Util_th.m
//  THToolsDemo
//
//  Created by 涂浩 on 2018/2/4.
//  Copyright © 2018年 TuHao. All rights reserved.
//

#import "UIApplication+Util_th.h"
#import <UserNotifications/UserNotifications.h>
#import <sys/sysctl.h>
#import <mach/mach.h>
#import <objc/runtime.h>
#import "UIImage+Capture_th.h"

@implementation UIApplication (Util_th)

+ (void)th_registerAPNsWithBlock:(THRegistAPNSBlock)block {
    if (@available(iOS 10.0, *))
    {
        UNUserNotificationCenter *center = [UNUserNotificationCenter currentNotificationCenter];
        [center requestAuthorizationWithOptions:(UNAuthorizationOptionBadge | UNAuthorizationOptionSound | UNAuthorizationOptionAlert) completionHandler:^(BOOL granted, NSError * _Nullable error) {
            !block ?: block(granted);
        }];
    } else
    {
        UIUserNotificationType types = UIUserNotificationTypeBadge | UIUserNotificationTypeSound | UIUserNotificationTypeAlert;
        UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:types
                                                                                 categories:nil];
        [[UIApplication sharedApplication] registerUserNotificationSettings:settings];
        !block ?: block(YES);
    }

    [[UIApplication sharedApplication] registerForRemoteNotifications];
}

+ (UIImage *)th_launchImage {
    
    NSString *UILaunchStoryboardName = [[[NSBundle mainBundle] infoDictionary] valueForKey:@"UILaunchStoryboardName"];
    if(UILaunchStoryboardName == nil){
        CGSize viewSize = [UIScreen mainScreen].bounds.size;
        NSString *launchImage = nil;
     
        NSArray* imagesDict = [[[NSBundle mainBundle] infoDictionary] valueForKey:@"UILaunchImages"];
        for (NSDictionary* dict in imagesDict)
        {
            CGSize imageSize = CGSizeFromString(dict[@"UILaunchImageSize"]);
     
            // 横屏改成 @"Landscape"
            if (CGSizeEqualToSize(imageSize, viewSize) && [@"Portrait" isEqualToString:dict[@"UILaunchImageOrientation"]])
            {
                launchImage = dict[@"UILaunchImageName"];
            }
        }
        return [UIImage imageNamed:launchImage];
    } else {
        UIViewController *viewController = [[UIStoryboard storyboardWithName:UILaunchStoryboardName bundle:nil] instantiateInitialViewController];
        UIView * view = viewController.view;
        // 加入到UIWindow后，LaunchScreenSb.view的safeAreaInsets在刘海屏机型才正常。
        UIWindow *containerWindow = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
        view.frame = containerWindow.bounds;
        [containerWindow addSubview:view];
        [containerWindow layoutIfNeeded];
        UIImage *image = [UIImage th_captureWithView:view];
        containerWindow = nil;
        return image;
    }
}

- (NSString *)th_appBundleName {
    return [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleName"];
}

- (NSString *)th_appBundleID {
    return [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleIdentifier"];
}

- (NSString *)th_appVersion {
    return [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"];
}

- (NSString *)th_appBuildVersion {
    return [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleVersion"];
}

- (BOOL)th_isPirated {
    if (TARGET_OS_SIMULATOR) return YES; // Simulator is not from appstore
    
    if (getgid() <= 10) return YES; // process ID shouldn't be root
    
    if ([[[NSBundle mainBundle] infoDictionary] objectForKey:@"SignerIdentity"]) {
        return YES;
    }
    
    if (![self _yy_fileExistInMainBundle:@"_CodeSignature"]) {
        return YES;
    }
    
    if (![self _yy_fileExistInMainBundle:@"SC_Info"]) {
        return YES;
    }
    
    //if someone really want to crack your app, this method is useless..
    //you may change this method's name, encrypt the code and do more check..
    return NO;
}

- (BOOL)_yy_fileExistInMainBundle:(NSString *)name {
    NSString *bundlePath = [[NSBundle mainBundle] bundlePath];
    NSString *path = [NSString stringWithFormat:@"%@/%@", bundlePath, name];
    return [[NSFileManager defaultManager] fileExistsAtPath:path];
}

- (BOOL)th_isBeingDebugged {
    size_t size = sizeof(struct kinfo_proc);
    struct kinfo_proc info;
    int ret = 0, name[4];
    memset(&info, 0, sizeof(struct kinfo_proc));
    
    name[0] = CTL_KERN;
    name[1] = KERN_PROC;
    name[2] = KERN_PROC_PID; name[3] = getpid();
    
    if (ret == (sysctl(name, 4, &info, &size, NULL, 0))) {
        return ret != 0;
    }
    return (info.kp_proc.p_flag & P_TRACED) ? YES : NO;
}

- (int64_t)th_memoryUsage {
    struct task_basic_info info;
    mach_msg_type_number_t size = sizeof(info);
    kern_return_t kern = task_info(mach_task_self(), TASK_BASIC_INFO, (task_info_t)&info, &size);
    if (kern != KERN_SUCCESS) return -1;
    return info.resident_size;
}

- (float)th_cpuUsage {
    kern_return_t kr;
    task_info_data_t tinfo;
    mach_msg_type_number_t task_info_count;
    
    task_info_count = TASK_INFO_MAX;
    kr = task_info(mach_task_self(), TASK_BASIC_INFO, (task_info_t)tinfo, &task_info_count);
    if (kr != KERN_SUCCESS) {
        return -1;
    }
    
    thread_array_t thread_list;
    mach_msg_type_number_t thread_count;
    
    thread_info_data_t thinfo;
    mach_msg_type_number_t thread_info_count;
    
    thread_basic_info_t basic_info_th;
    
    kr = task_threads(mach_task_self(), &thread_list, &thread_count);
    if (kr != KERN_SUCCESS) {
        return -1;
    }
    
    long tot_sec = 0;
    long tot_usec = 0;
    float tot_cpu = 0;
    int j;
    
    for (j = 0; j < thread_count; j++) {
        thread_info_count = THREAD_INFO_MAX;
        kr = thread_info(thread_list[j], THREAD_BASIC_INFO,
                         (thread_info_t)thinfo, &thread_info_count);
        if (kr != KERN_SUCCESS) {
            return -1;
        }
        
        basic_info_th = (thread_basic_info_t)thinfo;
        
        if (!(basic_info_th->flags & TH_FLAGS_IDLE)) {
            tot_sec = tot_sec + basic_info_th->user_time.seconds + basic_info_th->system_time.seconds;
            tot_usec = tot_usec + basic_info_th->system_time.microseconds + basic_info_th->system_time.microseconds;
            tot_cpu = tot_cpu + basic_info_th->cpu_usage / (float)TH_USAGE_SCALE;
        }
    }
    
    kr = vm_deallocate(mach_task_self(), (vm_offset_t)thread_list, thread_count * sizeof(thread_t));
    assert(kr == KERN_SUCCESS);
    
    return tot_cpu;
}

@end
