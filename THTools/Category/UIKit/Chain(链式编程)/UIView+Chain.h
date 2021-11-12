//
//  UIView+Chain.h
//  Single
//
//  Created by 涂浩 on 2020/1/2.
//  Copyright © 2020 lobochat. All rights reserved.
//
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (Chain)
+ (__kindof UIView * (^)(void))th_create;

- (UIView * (^)(UIColor *))th_backgroundColor;

- (UIView * (^)(CGFloat))th_cornerRadius;

- (UIView * (^)(CGFloat))th_alpha;

- (UIView * (^)(UIColor *color))th_borderColor;

- (UIView * (^)(CGFloat))th_borderWidth;

- (UIView * (^)(BOOL))th_userInteractionEnabled;

- (UIView * (^)(UIViewContentMode))th_contentMode;

@end

NS_ASSUME_NONNULL_END

