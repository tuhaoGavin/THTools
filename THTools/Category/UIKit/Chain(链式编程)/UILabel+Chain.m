//
//  UILabel+Chain.m
//  Single
//
//  Created by 涂浩 on 2020/1/2.
//  Copyright © 2020 lobochat. All rights reserved.
//

#import "UILabel+Chain.h"

@implementation UILabel (Chain)

+ (UILabel *_Nonnull (^)(NSString *_Nullable))th_create {
    return ^(NSString *text) {
        UILabel *label = [[self alloc] init];
        label.text     = text;
        return label;
    };
}

- (UILabel * _Nonnull (^)(NSString * _Nonnull))th_text {
    return ^(NSString *text) {
        self.text = text;
        return self;
    };
}

- (UILabel *_Nonnull (^)(UIFont *_Nonnull))th_font {
    return ^(UIFont *font) {
        self.font = font;
        return self;
    };
}

- (UILabel *_Nonnull (^)(UIColor *_Nonnull))th_textColor {
    return ^(UIColor *color) {
        self.textColor = color;
        return self;
    };
}

- (UILabel *_Nonnull (^)(NSInteger))th_numberOfLines {
    return ^(NSInteger numberOfLines) {
        self.numberOfLines = numberOfLines;
        return self;
    };
}

- (UILabel * _Nonnull (^)(NSTextAlignment))th_textAlignment {
    return ^(NSTextAlignment textAlignment) {
        self.textAlignment = textAlignment;
        return self;
    };
}

@end

