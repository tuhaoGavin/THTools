//
//  UIViewController+Swizzling.h
//  LongGuanJia
//
//  Created by Qi on 2021/4/28.
//  Copyright © 2021 waging. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (Swizzling)
/** 是否使用透明的导航栏 */
@property (nonatomic, assign) BOOL isUseClearBar;

/** 返回按钮名称 */
@property (nonatomic, strong) NSString * backImgName;

/** 设置导航栏alpha值 */
- (void)setAlphaForNaviBar:(CGFloat)alpha;

- (void)setNaviBarTintColor:(UIColor *)tintColor titleColor:(UIColor *)titleColor;

@end

NS_ASSUME_NONNULL_END
