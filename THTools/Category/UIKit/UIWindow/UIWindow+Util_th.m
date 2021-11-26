//
//  UIWindow+Util_th.m
//  THToolsDemo
//
//  Created by 涂浩 on 2017/7/24.
//  Copyright © 2017年 TuHao. All rights reserved.
//

#import "UIWindow+Util_th.h"

@implementation UIWindow (Util_th)

+ (UIViewController *)th_getCurrentVC {
    UIViewController * result = nil;
    UIWindow * window = [[UIApplication sharedApplication] keyWindow];
    if (window.windowLevel != UIWindowLevelNormal) {
        NSArray*windows = [[UIApplication sharedApplication] windows];
        for(UIWindow* tmpWin in windows) {
            if (tmpWin.windowLevel == UIWindowLevelNormal){
                window = tmpWin;
                break;
            }
        }
    }
    //从根控制器开始查找
        UIViewController*rootVC = window.rootViewController;
    id nextResponder = [rootVC.view nextResponder];
    if ([nextResponder isKindOfClass:[UINavigationController   class]]) {
        result =  ((UINavigationController*)nextResponder).topViewController;
        if([result isKindOfClass:[UITabBarController class]]) {
            result =  ((UITabBarController*)result).selectedViewController;
        }
    }else if([nextResponder isKindOfClass:[UITabBarController    class]]) {
        result = ((UITabBarController*)nextResponder).selectedViewController;
        if([result isKindOfClass:[UINavigationController class]]) {
            result = ((UINavigationController*)result).topViewController;
        }
    }else if([nextResponder isKindOfClass:[UIViewController  class]]) {
        result = nextResponder;
    }else { result = window.rootViewController;
        if ([result isKindOfClass:[UINavigationController class]]) {
            result = ((UINavigationController*)result).topViewController;
            if([result isKindOfClass:[UITabBarController class]]) {
                result = ((UITabBarController*)result).selectedViewController;
            }
        }else if([result isKindOfClass:[UIViewController class]]) {
            result = nextResponder;
        }
    }
    return result;
}

@end
