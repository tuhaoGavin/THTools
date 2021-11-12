//
//  UIWindow+Util_th.m
//  THToolsDemo
//
//  Created by weixb on 2017/7/24.
//  Copyright © 2017年 weixb. All rights reserved.
//

#import "UIWindow+Util_th.h"

@implementation UIWindow (Util_th)

+ (UIViewController *)th_getCurrentVC {
    UIViewController *result = nil;
    UIWindow * window = [[[UIApplication sharedApplication] delegate] window];
    //app默认windowLevel是UIWindowLevelNormal，如果不是，找到UIWindowLevelNormal的
    if (window.windowLevel != UIWindowLevelNormal) {
        NSArray *windows = [[UIApplication sharedApplication] windows];
        for(UIWindow * tmpWin in windows) {
            if (tmpWin.windowLevel == UIWindowLevelNormal) {
                window = tmpWin;
                break;
            }
        }
    }
    id  nextResponder = nil;
    UIViewController *appRootVC = window.rootViewController;
    //如果是present上来的appRootVC.presentedViewController 不为nil
    if (appRootVC.presentedViewController) {
        nextResponder = appRootVC.presentedViewController;
    }
    else {
        //        NSLog(@"===%@",[window subviews]);
        UIView *frontView = [[window subviews] objectAtIndex:0];
        nextResponder = [frontView nextResponder];
    }
    
    if ([nextResponder isKindOfClass:[UITabBarController class]]) {
        UITabBarController * tabbar = (UITabBarController *)nextResponder;
        UINavigationController * nav = (UINavigationController *)tabbar.viewControllers[tabbar.selectedIndex];
        //UINavigationController * nav = tabbar.selectedViewController ; 上下两种写法都行
        result = nav.childViewControllers.lastObject;
        
    }
    else if ([nextResponder isKindOfClass:[UINavigationController class]]) {
        UIViewController * nav = (UIViewController *)nextResponder;
        result = nav.childViewControllers.lastObject;
    }
    else {
        result = nextResponder;
    }
    return result;
}

@end
