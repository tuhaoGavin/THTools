//
//  UIImage+SuperCompress_th.h
//  THToolsDemo
//
//  Created by 涂浩 on 2017/2/16.
//  Copyright © 2017年 TuHao. All rights reserved.
//
//  https://github.com/CompletionHandler/CYImageCompress

//usage      [UIImage compressImage:image toMaxLength:512*1024*8 maxWidth:1024];

#import <UIKit/UIKit.h>

@interface UIImage (SuperCompress_th)

/**
 *  压缩上传图片到指定字节
 *
 *  @param image     压缩的图片
 *  @param maxLength 压缩后最大字节大小
 *
 *  @return 压缩后图片的二进制
 */
+ (NSData *)th_compressImage:(UIImage *)image toMaxLength:(NSInteger) maxLength maxWidth:(NSInteger)maxWidth;

/**
 *  获得指定size的图片
 *
 *  @param image   原始图片
 *  @param newSize 指定的size
 *
 *  @return 调整后的图片
 */
+ (UIImage *)th_resizeImage:(UIImage *) image withNewSize:(CGSize) newSize;

/**
 *  通过指定图片最长边，获得等比例的图片size
 *
 *  @param image       原始图片
 *  @param imageLength 图片允许的最长宽度（高度）
 *
 *  @return 获得等比例的size
 */
+ (CGSize)th_scaleImage:(UIImage *) image withLength:(CGFloat) imageLength;


+ (UIImage*)th_resizableHalfImage:(NSString *)name;


//压缩图片质量到指定字节(该方法效率更高)
+ (NSData *)th_compressImageQuality:(UIImage *)image toByte:(NSInteger)maxLength;
@end
