//
//  UILabel+Chain.h
//  Single
//
//  Created by 涂浩 on 2020/1/2.
//  Copyright © 2020 lobochat. All rights reserved.
//
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UILabel (Chain)

+ (UILabel * (^)(NSString *_Nullable))th_create;

- (UILabel * (^)(NSString *text))th_text;

- (UILabel * (^)(UIFont *font))th_font;

- (UILabel * (^)(UIColor *color))th_textColor;

- (UILabel * (^)(NSInteger))th_numberOfLines;

- (UILabel * (^)(NSTextAlignment))th_textAlignment;



@end

NS_ASSUME_NONNULL_END

