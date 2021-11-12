//
//  UIImage+Util_th.h
//  Tools
//
//  Created by weixb on 16/12/19.
//  Copyright © 2016年 weixb. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Util_th)

/**
 *  合成加半透明水印
 *
 *  @param maskImage 水印图
 *  @param rect      水印图位置
 *
 *  @return 图片
 */
- (UIImage *)th_addMsakImage:(UIImage *)maskImage msakRect:(CGRect)rect;

/**
 *  压缩图片
 *
 *  @return 压缩后的图片
 */
- (UIImage *)th_compressImage;

/**
 *  获取图片压缩后data
 *
 *  @return 压缩后的data
 */
- (NSData *)th_compressToData;

/**
 *  改变图片大小
 *
 *  @param size 改变后的尺寸
 *
 *  @return 改变后的图片
 */
- (UIImage *)th_changeImageSize:(CGSize)size;

/**
 *  等比例缩放
 *
 *  @param size 缩放尺寸
 *
 *  @return 缩放后的图片
 */
- (UIImage*)th_scaleToSize:(CGSize)size;

//图片切成圆形
- (instancetype)th_circleImage;
+ (instancetype)th_circleImage:(NSString *)image;

@end
