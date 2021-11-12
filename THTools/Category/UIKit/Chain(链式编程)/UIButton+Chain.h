//
//  UIButton+Chain.h
//  Single
//
//  Created by 涂浩 on 2020/1/2.
//  Copyright © 2020 lobochat. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIButton (Chain)

+ (UIButton * (^)(void))th_create;

- (UIButton * (^)(NSString *))th_title;

- (UIButton * (^)(NSString *))th_highlightedTitle;

- (UIButton * (^)(NSString *))th_disabledTitle;

- (UIButton * (^)(NSString *))th_selectededTitle;

- (UIButton * (^)(UIImage *))th_image;

- (UIButton * (^)(UIImage *))th_highlightedImage;

- (UIButton * (^)(UIImage *))th_disabledImage;

- (UIButton * (^)(UIImage *))th_selectededImage;

- (UIButton * (^)(UIImage *))th_backgroundImage;

- (UIButton * (^)(UIImage *))th_highlightedBackgroundImage;

- (UIButton * (^)(UIImage *))th_disabledBackgroundImage;

- (UIButton * (^)(UIImage *))th_selectededBackgroundImage;

- (UIButton * (^)(UIFont *))th_titleFont;

- (UIButton * (^)(UIColor *))th_titleColor;

/** 点击事件block */
- (UIButton * (^)(void (^)(UIButton *)))th_eventBlock;

@end

NS_ASSUME_NONNULL_END

