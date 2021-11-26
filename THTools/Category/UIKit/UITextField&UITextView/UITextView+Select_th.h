//
//  UITextView+Select_th.h
//  THToolsDemo
//
//  Created by 涂浩 on 2017/2/16.
//  Copyright © 2017年 TuHao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextView (Select_th)

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



//https://github.com/pclion/TextViewCalculateLength
// 用于计算textview输入情况下的字符数，解决实现限制字符数时，计算不准的问题
- (NSInteger)th_getInputLengthWithText:(NSString *)text;


@end
