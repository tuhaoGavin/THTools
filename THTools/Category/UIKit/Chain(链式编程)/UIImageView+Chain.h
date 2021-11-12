//
//  UIImageView+Chain.h
//  Single
//
//  Created by 涂浩 on 2020/1/2.
//  Copyright © 2020 lobochat. All rights reserved.
//
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImageView (Chain)

+ (UIImageView * (^)(void))th_create;

- (UIImageView * (^)(UIImage *))th_image;

- (UIImageView * (^)(UIImage *))th_highlightedImage;

- (UIImageView *_Nonnull (^)(void (^_Nonnull)(UIImageView *_Nonnull)))th_tapBlock;

@end

NS_ASSUME_NONNULL_END

