//
//  UIImageView+Chain.m
//  Single
//
//  Created by 涂浩 on 2020/1/2.
//  Copyright © 2020 lobochat. All rights reserved.
//

#import "UIImageView+Chain.h"
#import <objc/runtime.h>

@implementation UIImageView (Chain)

+ (UIImageView *_Nonnull (^)(void))th_create {
    return ^{
        return [[self alloc] init];
    };
}

- (UIImageView *_Nonnull (^)(UIImage *_Nonnull))th_image {
    return ^(UIImage *image) {
        self.image = image;
        return self;
    };
}

- (UIImageView *_Nonnull (^)(UIImage *_Nonnull))th_highlightedImage {
    return ^(UIImage *highlightedImage) {
        self.highlightedImage = highlightedImage;
        return self;
    };
}

- (UIImageView *_Nonnull (^)(void (^_Nonnull)(UIImageView *_Nonnull)))th_tapBlock {
    return ^(void (^block)(UIImageView *imageView)) {
        self.userInteractionEnabled = YES;
        objc_setAssociatedObject(self, _cmd, block, OBJC_ASSOCIATION_COPY_NONATOMIC);
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(th_tapBlockAction:)];
        [self addGestureRecognizer: tap];
        return self;
    };
}

- (void)th_tapBlockAction:(UIImageView *)imageView {
    void (^block)(UIImageView *imageView) = objc_getAssociatedObject(self, @selector(th_tapBlock));
    !block ?: block(self);
}

@end

