//
//  UITextView+InputLimit_th.m
//  THToolsDemo
//
//  Created by 涂浩 on 2017/2/16.
//  Copyright © 2017年 TuHao. All rights reserved.
//

#import "UITextView+InputLimit_th.h"
#import <objc/runtime.h>

static const void *JKTextViewInputLimitMaxLength = &JKTextViewInputLimitMaxLength;

@implementation UITextView (InputLimit_th)

- (NSInteger)th_maxLength {
    return [objc_getAssociatedObject(self, JKTextViewInputLimitMaxLength) integerValue];
}
- (void)setTh_maxLength:(NSInteger)maxLength {
    objc_setAssociatedObject(self, JKTextViewInputLimitMaxLength, @(maxLength), OBJC_ASSOCIATION_ASSIGN);
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(th_textViewTextDidChange:)
                                                name:@"UITextViewTextDidChangeNotification" object:self];
    
}
- (void)th_textViewTextDidChange:(NSNotification *)notification {
    NSString *toBeString = self.text;
    //获取高亮部分
    UITextRange *selectedRange = [self markedTextRange];
    UITextPosition *position = [self positionFromPosition:selectedRange.start offset:0];
    
    //没有高亮选择的字，则对已输入的文字进行字数统计和限制
    //在iOS7下,position对象总是不为nil
    if ( (!position ||!selectedRange) && (self.th_maxLength > 0 && toBeString.length > self.th_maxLength))
    {
        NSRange rangeIndex = [toBeString rangeOfComposedCharacterSequenceAtIndex:self.th_maxLength];
        if (rangeIndex.length == 1)
        {
            self.text = [toBeString substringToIndex:self.th_maxLength];
        }
        else
        {
            NSRange rangeRange = [toBeString rangeOfComposedCharacterSequencesForRange:NSMakeRange(0, self.th_maxLength)];
            NSInteger tmpLength;
            if (rangeRange.length > self.th_maxLength) {
                tmpLength = rangeRange.length - rangeIndex.length;
            }else{
                tmpLength = rangeRange.length;
            }
            self.text = [toBeString substringWithRange:NSMakeRange(0, tmpLength)];
        }
    }
}
- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
