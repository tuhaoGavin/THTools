//
//  THScreenHelpers.h
//  FansApp
//
//  Created by legendry on 2019/7/4.
//  Copyright © 2019 legendry. All rights reserved.
//

#ifndef THScreenHelpers_h
#define THScreenHelpers_h


//屏幕宽度
#define KUIScreenWidth          [UIScreen mainScreen].bounds.size.width

//屏幕高度
#define KUIScreenHeight         [UIScreen mainScreen].bounds.size.height

//状态栏高度
#define KStatusBarHeight        (SafeAreaInsets().top ?: 20)

//当前设备安全区域（状态栏以下）
#define KApplicationSafeArea    getApplicationSafeArea()

//状态栏和导航栏总高度
#define KNavBarHAbove           getNavBarHAbove()

//刘海屏与非刘海屏底部安全区域远离高度(刘海屏34，非刘海屏0)
#define KBottomSafeHeight       getBottomSafeHeight()

//TabBar高度 49
#define KTabBarHeight           49

//TabBar总高度(刘海屏83，非刘海屏49)
#define KTabBarHAbove           getTabBarHAbove()

#define KAPPDelegate ((AppDelegate*)[[UIApplication sharedApplication] delegate])

//window
NS_INLINE UIWindow *ApplicationMainWindow() {
    return [UIApplication sharedApplication].keyWindow;
}

//安全区域Insets
NS_INLINE UIEdgeInsets SafeAreaInsets() {
    if (@available(iOS 11.0, *)) {
        return ApplicationMainWindow().safeAreaInsets;
    } else {
        return UIEdgeInsetsZero;
    }
}

//获取当前设备安全区域（状态栏以下）
NS_INLINE CGRect getApplicationSafeArea() {
    if (@available(iOS 11.0, *)) {
        CGRect safeRect = [UIApplication sharedApplication].keyWindow.safeAreaLayoutGuide.layoutFrame;
        return safeRect;
    } else {
        CGRect safeRect = CGRectMake(0, KStatusBarHeight, KUIScreenWidth, KUIScreenHeight - KStatusBarHeight);
        return safeRect;
    }
}

///获取状态栏和导航栏总高度
NS_INLINE CGFloat getNavBarHAbove() {
    return (SafeAreaInsets().top ?: 20) + 44;
}


///获取刘海屏与非刘海屏底部安全区域远离高度(刘海屏34，非刘海屏0)
NS_INLINE CGFloat getBottomSafeHeight() {
    CGFloat bottomSafeHeight = 0;
    if (@available(iOS 11.0, *)) {
        bottomSafeHeight = [UIApplication sharedApplication].keyWindow.safeAreaInsets.bottom;
    }
    return bottomSafeHeight;
}

//获取TabBar高度(刘海屏83，非刘海屏49)
NS_INLINE CGFloat getTabBarHAbove() {
    return KTabBarHeight + getBottomSafeHeight();
}


#endif /* THScreenHelpers_h */
