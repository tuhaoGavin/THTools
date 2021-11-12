//
//  UIView+Chain.m
//  Single
//
//  Created by 涂浩 on 2020/1/2.
//  Copyright © 2020 lobochat. All rights reserved.
//

#import "UIView+Chain.h"

@implementation UIView (Chain)

+ (__kindof UIView *_Nonnull (^)(void))th_create {
    return ^{
        return [[self alloc] init];
    };
}

- (UIView *_Nonnull (^)(UIColor *_Nonnull))th_backgroundColor {
    return ^(UIColor *color) {
        self.backgroundColor = color;
        return self;
    };
}

- (UIView *_Nonnull (^)(CGFloat))th_cornerRadius {
    return ^(CGFloat ridus) {
        self.layer.cornerRadius  = ridus;
        self.layer.masksToBounds = YES;
        return self;
    };
}

- (UIView *_Nonnull (^)(CGFloat))th_alpha {
    return ^(CGFloat alpha) {
        self.alpha = alpha;
        return self;
    };
}

- (UIView *_Nonnull (^)(UIColor *_Nonnull))th_borderColor {
    return ^(UIColor *color) {
        self.layer.borderColor = color.CGColor;
        return self;
    };
}

- (UIView *_Nonnull (^)(CGFloat))th_borderWidth {
    return ^(CGFloat borderWidth) {
        self.layer.borderWidth = borderWidth;
        return self;
    };
}

- (UIView *_Nonnull (^)(BOOL))th_userInteractionEnabled {
    return ^(BOOL userInteractionEnabled) {
        self.userInteractionEnabled = userInteractionEnabled;
        return self;
    };
}

- (UIView *_Nonnull (^)(UIViewContentMode))th_contentMode {
    return ^(UIViewContentMode contentMode) {
        self.contentMode = contentMode;
        return self;
    };
}

@end

