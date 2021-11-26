//
//  UIImage+Orientation_th.h
//  THToolsDemo
//
//  Created by 涂浩 on 2017/2/16.
//  Copyright © 2017年 TuHao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Orientation_th)
//CGFloat DegreesToRadiansForOrientation(CGFloat degrees) {return degrees * M_PI / 180;};
//CGFloat RadiansToDegreesForOrientation(CGFloat radians) {return radians * 180/M_PI;};

/**
 *  @brief  修正图片的方向
 *
 *  @param srcImg 图片
 *
 *  @return 修正方向后的图片
 */
+ (UIImage *)th_fixOrientation:(UIImage *)srcImg;
/**
 *  @brief  旋转图片
 *
 *  @param degrees 角度
 *
 *  @return 旋转后图片
 */
- (UIImage *)th_imageRotatedByDegrees:(CGFloat)degrees;

/**
 *  @brief  旋转图片
 *
 *  @param radians 弧度
 *
 *  @return 旋转后图片
 */
- (UIImage *)th_imageRotatedByRadians:(CGFloat)radians;

/**
 *  @brief  垂直翻转
 *
 *  @return  翻转后的图片
 */
- (UIImage *)th_flipVertical;
/**
 *  @brief  水平翻转
 *
 *  @return 翻转后的图片
 */
- (UIImage *)th_flipHorizontal;

/**
 *  @brief  角度转弧度
 *
 *  @param degrees 角度
 *
 *  @return 弧度
 */
+(CGFloat)th_degreesToRadians:(CGFloat)degrees;
/**
 *  @brief  弧度转角度
 *
 *  @param radians 弧度
 *
 *  @return 角度
 */
+(CGFloat)th_radiansToDegrees:(CGFloat)radians;

@end
