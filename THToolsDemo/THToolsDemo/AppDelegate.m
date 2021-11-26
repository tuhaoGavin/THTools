//
//  AppDelegate.m
//  THToolsDemo
//
//  Created by Qi on 2021/10/28.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "THTools.h"
#import "RTRootNavigationController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = UIColor.whiteColor;
    RTRootNavigationController * nav = [[RTRootNavigationController alloc] initWithRootViewController:[[ViewController alloc] init]];
    nav.useSystemBackBarButtonItem = YES;
    self.window.rootViewController = nav;
    [self.window makeKeyAndVisible];
    
    //隐藏导航栏底部细线
//    [UINavigationBar appearance].hidesShadow = YES;
    return YES;
}


@end
