//
//  UITextField+Chain.h
//  Single
//
//  Created by 涂浩 on 2020/1/2.
//  Copyright © 2020 lobochat. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITextField (Chain)

+ (UITextField * (^)(void))th_create;

- (UITextField * (^)(UIFont *font))th_font;

- (UITextField * (^)(UIColor *color))th_textColor;

- (UITextField * (^)(NSString *placeholder))th_placeholder;

- (UITextField * (^)(UIColor *color))th_placeholderColor;
/**
 *  左边距
 */
- (UITextField * (^)(CGFloat space))th_leftSpace;
/**
 *  右边距
 */
- (UITextField * (^)(CGFloat space))th_rightSpace;

- (UITextField * (^)(NSTextAlignment))th_textAlignment;

@end

NS_ASSUME_NONNULL_END

