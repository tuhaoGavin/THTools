//
//  NSNumber+CGFloat_th.h
//  THToolsDemo
//
//  Created by weixb on 2017/2/16.
//  Copyright © 2017年 weixb. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSNumber (CGFloat_th)

- (CGFloat)th_CGFloatValue;

- (id)initWithyqCGFloat:(CGFloat)value;

+ (NSNumber *)th_numberWithCGFloat:(CGFloat)value;

@end
