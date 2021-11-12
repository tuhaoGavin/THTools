//
//  NSString+Base64_th.h
//  THToolsDemo
//
//  Created by weixb on 2017/2/16.
//  Copyright © 2017年 weixb. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Base64_th)

+ (NSString *)th_stringWithBase64EncodedString:(NSString *)string;
- (NSString *)th_base64EncodedStringWithWrapWidth:(NSUInteger)wrapWidth;
- (NSString *)th_base64EncodedString;
- (NSString *)th_base64DecodedString;
- (NSData *)th_base64DecodedData;

@end
