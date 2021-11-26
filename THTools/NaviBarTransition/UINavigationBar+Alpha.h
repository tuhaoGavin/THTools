//
//  UINavigationBar+Alpha.h
//  CodeStandardsDemo
//
//  Created by 涂浩 on 2020/1/11.
//  Copyright © 2020 太合音乐. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UINavigationBar (Alpha)

/** 是否隐藏导航栏细线 */
@property (nonatomic, assign) BOOL hidesShadow;

- (void)setBarAlpha:(CGFloat)alpha;

@end

NS_ASSUME_NONNULL_END
