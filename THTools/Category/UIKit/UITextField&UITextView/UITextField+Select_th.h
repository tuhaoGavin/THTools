//
//  UITextField+Select_th.h
//  THToolsDemo
//
//  Created by 涂浩 on 2017/2/16.
//  Copyright © 2017年 TuHao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextField (Select_th)

/**
 *  @brief  当前选中的字符串范围
 *
 *  @return NSRange
 */
- (NSRange)th_selectedRange;
/**
 *  @brief  选中所有文字
 */
- (void)th_selectAllText;
/**
 *  @brief  选中指定范围的文字
 *
 *  @param range NSRange范围
 */
- (void)th_setSelectedRange:(NSRange)range;

@end
