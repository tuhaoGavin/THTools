//
//  THSettings.h
//  THSettingsDemo
//
//  Created by weixb on 2017/12/15.
//  Copyright © 2017年 weixb. All rights reserved.
//

#ifndef THSettings_h
#define THSettings_h

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "THSettingsTableData.h"
#import "THSettingsTableDelegate.h"
#import "THSettingsCellDelegate.h"
#import "THSettingsSwitchCell.h"
#import "THSettingsTableView.h"



#define THKit_SuppressPerformSelectorLeakWarning(Stuff) \
do { \
_Pragma("clang diagnostic push") \
_Pragma("clang diagnostic ignored \"-Warc-performSelector-leaks\"") \
Stuff; \
_Pragma("clang diagnostic pop") \
} while (0)

/** 默认开关类名 */
static NSString *const THSettingsSwitchCellClass = @"THSettingsSwitchCell";
/** 十六进制颜色 */
static inline UIColor *THSettingsColorWithHex(UInt32 hex) {
    return [UIColor colorWithRed:((hex >> 16) & 0xFF)/255.0
                           green:((hex >> 8) & 0xFF)/255.0
                            blue:(hex & 0xFF)/255.0
                           alpha:1];
}
/** 获取view的VC */
static inline UIViewController *THViewController(UIView *view) {
    for (UIView* next = [view superview]; next; next = next.superview) {
        UIResponder* nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController*)nextResponder;
        }
    }
    return nil;
}

NS_INLINE UIImage * THImage(NSString * imgName) {
    NSString *bundleName = @"Resource";
    //framework
    NSBundle * bundle = [NSBundle bundleForClass:NSClassFromString(@"THSettings")];

    NSString *myBundlePath = [bundle pathForResource:bundleName ofType:@"bundle"];
    //实际bundle
    NSBundle * myBundle = [NSBundle bundleWithPath:myBundlePath];

    UIImage *image = [UIImage imageNamed:imgName inBundle:myBundle compatibleWithTraitCollection:nil];
    return image;
}

#endif /* THSettings_h */
