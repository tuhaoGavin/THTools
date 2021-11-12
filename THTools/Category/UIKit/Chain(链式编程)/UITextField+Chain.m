//
//  UITextField+Chain.m
//  Single
//
//  Created by 涂浩 on 2020/1/2.
//  Copyright © 2020 lobochat. All rights reserved.
//

#import "UITextField+Chain.h"

@implementation UITextField (Chain)

+ (UITextField * (^)(void))th_create {
    return ^{
        return [[self alloc] init];
    };
}

- (UITextField * (^)(CGFloat space))th_leftSpace {
    return ^(CGFloat space) {
        self.leftViewMode = UITextFieldViewModeAlways;
        self.leftView     = [[UIView alloc] initWithFrame:CGRectMake(0, 0, space, 0)];
        return self;
    };
}

- (UITextField * (^)(CGFloat space))th_rightSpace {
    return ^(CGFloat space) {
        self.rightViewMode = UITextFieldViewModeAlways;
        self.rightView     = [[UIView alloc] initWithFrame:CGRectMake(0, 0, space, 0)];
        return self;
    };
}

- (UITextField * (^)(UIFont *font))th_font {
    return ^(UIFont *font) {
        self.font = font;
        return self;
    };
}

- (UITextField * _Nonnull (^)(UIColor *))th_textColor {
    return ^(UIColor *color) {
        self.textColor = color;
        return self;
    };
}

- (UITextField * (^)(NSString *placeholder))th_placeholder {
    return ^(NSString *placeholder) {
        self.placeholder = placeholder;
        return self;
    };
}

- (UITextField * (^)(UIColor *color))th_placeholderColor {
    return ^(UIColor *color) {
        NSMutableAttributedString *placeholderString = [[NSMutableAttributedString alloc] initWithString:self.placeholder ?: @"" attributes:@{NSForegroundColorAttributeName: color}];
        self.attributedPlaceholder                   = placeholderString;

        return self;
    };
}

- (UITextField * _Nonnull (^)(NSTextAlignment))th_textAlignment {
    return ^(NSTextAlignment textAlignment) {
        self.textAlignment = textAlignment;
        return self;
    };
}

@end

