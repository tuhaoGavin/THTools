//
//  THVcControl.m
//  TestDemo
//
//  Created by 涂浩 on 2021/11/25.
//

#import "THVcControl.h"
#if __has_include(<RTRootNavigationController/RTRootNavigationController.h>)
#import <RTRootNavigationController/RTRootNavigationController.h>
#else
#import "RTRootNavigationController.h"
#endif

@implementation THVcControl

//获取当前VC
+ (UIViewController *)getCurrentVC {
    UIViewController *rootViewController = [UIApplication sharedApplication].keyWindow.rootViewController;
    
    UIViewController *currentVC = [self getCurrentVCFrom:rootViewController];
    
    return currentVC;
}

+(UIViewController *)getCurrentVCFrom:(UIViewController *)rootVC {
    
    UIViewController *currentVC;
    
    if ([rootVC presentedViewController]) {
        
        rootVC = [rootVC presentedViewController];
    }
    
    if ([rootVC isKindOfClass:[UITabBarController class]]) {
        
        currentVC = [self getCurrentVCFrom:[(UITabBarController *)rootVC selectedViewController]];
        
    } else if ([rootVC isKindOfClass:[UINavigationController class]]){
        
        currentVC = [self getCurrentVCFrom:[(UINavigationController *)rootVC visibleViewController]];
        
    } else if ([rootVC isKindOfClass:[RTContainerController class]]) {
        // 根视图为RTContainerController类
        RTContainerController * containerVC = (RTContainerController *)rootVC;
        currentVC = containerVC.contentViewController;
    } else {
        currentVC = rootVC;
    }
    
    return currentVC;
}

@end
