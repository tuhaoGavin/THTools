//
//  UIImage+GIF_th.h
//  THToolsDemo
//
//  Created by weixb on 2017/2/16.
//  Copyright © 2017年 weixb. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <ImageIO/ImageIO.h>

@interface UIImage (GIF_th)

+ (UIImage *)th_animatedGIFNamed:(NSString *)name;

+ (UIImage *)th_animatedGIFWithData:(NSData *)data;

- (UIImage *)th_animatedImageByScalingAndCroppingToSize:(CGSize)size;

@end
