//
//  UIButton+Chain.m
//  Single
//
//  Created by 涂浩 on 2020/1/2.
//  Copyright © 2020 lobochat. All rights reserved.
//

#import "UIButton+Chain.h"
#import <objc/runtime.h>
#import "UIView+Chain.h"

static const void *KButtonEventBlockKey = &KButtonEventBlockKey;

@implementation UIButton (Chain)

+ (UIButton *_Nonnull (^)(void))th_create {
    return ^{
        return [[self alloc] init];
    };
}

- (UIButton *_Nonnull (^)(NSString *_Nonnull))th_title {
    return ^(NSString *title) {
        [self setTitle:title forState:UIControlStateNormal];
        return self;
    };
}

- (UIButton *_Nonnull (^)(NSString *_Nonnull))th_highlightedTitle {
    return ^(NSString *title) {
        [self setTitle:title forState:UIControlStateHighlighted];
        return self;
    };
}

- (UIButton *_Nonnull (^)(NSString *_Nonnull))th_disabledTitle {
    return ^(NSString *title) {
        [self setTitle:title forState:UIControlStateDisabled];
        return self;
    };
}

- (UIButton *_Nonnull (^)(NSString *_Nonnull))th_selectededTitle {
    return ^(NSString *title) {
        [self setTitle:title forState:UIControlStateSelected];
        return self;
    };
}

- (UIButton *_Nonnull (^)(UIImage *_Nonnull))th_image {
    return ^(UIImage *image) {
        [self setImage:image forState:UIControlStateNormal];
        return self;
    };
}

- (UIButton *_Nonnull (^)(UIImage *_Nonnull))th_highlightedImage {
    return ^(UIImage *image) {
        [self setImage:image forState:UIControlStateHighlighted];
        return self;
    };
}

- (UIButton *_Nonnull (^)(UIImage *_Nonnull))th_disabledImage {
    return ^(UIImage *image) {
        [self setImage:image forState:UIControlStateDisabled];
        return self;
    };
}

- (UIButton *_Nonnull (^)(UIImage *_Nonnull))th_selectededImage {
    return ^(UIImage *image) {
        [self setImage:image forState:UIControlStateSelected];
        return self;
    };
}

- (UIButton *_Nonnull (^)(UIImage *_Nonnull))th_backgroundImage {
    return ^(UIImage *image) {
        [self setBackgroundImage:image forState:UIControlStateNormal];
        return self;
    };
}

- (UIButton *_Nonnull (^)(UIImage *_Nonnull))th_highlightedBackgroundImage {
    return ^(UIImage *image) {
        [self setBackgroundImage:image forState:UIControlStateHighlighted];
        return self;
    };
}

- (UIButton *_Nonnull (^)(UIImage *_Nonnull))th_disabledBackgroundImage {
    return ^(UIImage *image) {
        [self setBackgroundImage:image forState:UIControlStateDisabled];
        return self;
    };
}

- (UIButton *_Nonnull (^)(UIImage *_Nonnull))th_selectededBackgroundImage {
    return ^(UIImage *image) {
        [self setBackgroundImage:image forState:UIControlStateSelected];
        return self;
    };
}

- (UIButton *_Nonnull (^)(UIFont *_Nonnull))th_titleFont {
    return ^(UIFont *font) {
        self.titleLabel.font = font;
        return self;
    };
}

- (UIButton * _Nonnull (^)(UIColor * _Nonnull))th_titleColor {
    return ^(UIColor *color) {
        [self setTitleColor:color forState:UIControlStateNormal];
        return self;
    };
}

- (UIButton *_Nonnull (^)(void (^_Nonnull)(UIButton *_Nonnull)))th_eventBlock {
    return ^(void (^block)(UIButton *btn)) {
        objc_setAssociatedObject(self, _cmd, block, OBJC_ASSOCIATION_COPY_NONATOMIC);
        [self addTarget:self action:@selector(th_buttonBlockAction:) forControlEvents:UIControlEventTouchUpInside];
        return self;
    };
}

- (void)th_buttonBlockAction:(UIButton *)btn {
    void (^block)(UIButton *btn) = objc_getAssociatedObject(self, @selector(th_eventBlock));
    !block ?: block(self);
}

@end

