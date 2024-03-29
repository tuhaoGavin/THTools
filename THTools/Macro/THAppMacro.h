//
//  THAppMacro.h
//  Tools
//
//  Created by 涂浩 on 16/12/14.
//  Copyright © 2016年 TuHao. All rights reserved.
//

#ifndef THAppMacro_h
#define THAppMacro_h

//APP名字
#define APP_NAME ([[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleName"])
//APP的BundleID
#define APP_BundleID ([[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleIdentifier"])
//APP版本号
#define APP_VERSION ([[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"])
//APP构建版本号
#define APP_BUILD ([[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"])
//APP当前语言
#define APP_CurrentLanguage ([[NSLocale preferredLanguages] objectAtIndex:0])


//获取屏幕宽度, 高度, 尺寸
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREENH_HEIGHT [UIScreen mainScreen].bounds.size.height
#define SCREEN_SIZE [UIScreen mainScreen].bounds.size

//常用缩写
#define kNotificationCenter [NSNotificationCenter defaultCenter]
#define kNSUserDefaults [NSUserDefaults standardUserDefaults]

/**************************************Log***************************************/
// 自定义log
#ifdef DEBUG
#define NSLog(format, ...) printf("\n[%s] %s [第%d行] %s\n", __TIME__, __FUNCTION__, __LINE__, [[NSString stringWithFormat:format, ## __VA_ARGS__] UTF8String]);
#else
#define NSLog(format, ...)
#endif

//debug输出rect，size和point的宏
#define NSLogRect(rect) NSLog(@"%s x:%.4f, y:%.4f, w:%.4f, h:%.4f", #rect, rect.origin.x, rect.origin.y, rect.size.width, rect.size.height)
#define NSLogSize(size) NSLog(@"%s w:%.4f, h:%.4f", #size, size.width, size.height)
#define NSLogPoint(point) NSLog(@"%s x:%.4f, y:%.4f", #point, point.x, point.y)


/**************************************设备***************************************/
//判断是否为iPhone
#define IS_IPhone (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
//判断是否为iPad
#define IS_IPad (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
//判断是否为ipod
#define IS_IPod ([[[UIDevice currentDevice] model] isEqualToString:@"iPod touch"])
// 判断是否为 iPhone 5SE
#define iPhone5SE [[UIScreen mainScreen] bounds].size.width == 320.0f && [[UIScreen mainScreen] bounds].size.height == 568.0f
// 判断是否为iPhone 6/6s
#define iPhone6_6s [[UIScreen mainScreen] bounds].size.width == 375.0f && [[UIScreen mainScreen] bounds].size.height == 667.0f
// 判断是否为iPhone 6Plus/6sPlus
#define iPhone6Plus_6sPlus [[UIScreen mainScreen] bounds].size.width == 414.0f && [[UIScreen mainScreen] bounds].size.height == 736.0f
//获取系统版本
#define IOS_SYSTEM_VERSION [[[UIDevice currentDevice] systemVersion] floatValue]
//判断 iOS 8 或更高的系统版本
#define IOS_VERSION_8_OR_LATER (([[[UIDevice currentDevice] systemVersion] floatValue] >=8.0)? (YES):(NO))


/**************************************沙盒目录文件***************************************/
//获取temp
#define kPathTemp NSTemporaryDirectory()
//获取沙盒 Document
#define kPathDocument [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject]
//获取沙盒 Cache
#define kPathCache [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject]


/**
 *  设置 view 圆角和边框
 */
#define FUNC_BorderRadius(View, Radius, Width, Color)\
\
[View.layer setCornerRadius:(Radius)];\
[View.layer setMasksToBounds:YES];\
[View.layer setBorderWidth:(Width)];\
[View.layer setBorderColor:[Color CGColor]]
/**
 *  结束上下拉刷新
 */
#define FUNC_EndMJRefresh(tableView) \
if ([tableView.mj_header isRefreshing]) { \
[tableView.mj_header endRefreshing]; \
} \
\
if ([tableView.mj_footer isRefreshing]) { \
[tableView.mj_footer endRefreshing]; \
}

#endif /* THAppMacro_h */
