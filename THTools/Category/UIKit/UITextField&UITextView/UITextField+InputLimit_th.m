//
//  UITextField+InputLimit_th.m
//  THToolsDemo
//
//  Created by weixb on 2017/2/16.
//  Copyright © 2017年 weixb. All rights reserved.
//

#import "UITextField+InputLimit_th.h"
#import <objc/runtime.h>

static const void *JKTextFieldInputLimitMaxLength = &JKTextFieldInputLimitMaxLength;

@implementation UITextField (InputLimit_th)

- (NSInteger)th_maxLength {
    NSNumber *length = objc_getAssociatedObject(self, JKTextFieldInputLimitMaxLength);
    return length.integerValue;
}
- (void)setTh_maxLength:(NSInteger)maxLength {
    objc_setAssociatedObject(self, JKTextFieldInputLimitMaxLength, @(maxLength), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self addTarget:self action:@selector(th_textFieldTextDidChange) forControlEvents:UIControlEventEditingChanged];
}
- (void)th_textFieldTextDidChange {
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

@end
