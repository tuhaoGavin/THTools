//
//  UIView+Border_th.h
//  THToolsDemo
//
//  Created by weixb on 2017/7/24.
//  Copyright © 2017年 weixb. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger, THViewBorderType) {
    THViewBorderTop = 1<<1,
    THViewBorderLeft = 1<<2,
    THViewBorderBottom = 1<<3,
    THViewBorderRight = 1<<4,
    THViewBorderLeftAndBottom = 1<<5,
    THViewBorderRightAndBottom = 1<<6,
};

@interface UIView (Border_th)

/** 边框类型(在view的frame确定后设置该属性) */
@property (nonatomic, assign) THViewBorderType th_borderType;

@end
