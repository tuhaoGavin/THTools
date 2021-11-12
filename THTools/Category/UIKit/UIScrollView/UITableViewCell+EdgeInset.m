//
//  UITableViewCell+EdgeInset.m
//  LongGuanJia
//
//  Created by Qi on 2021/9/6.
//  Copyright © 2021 waging. All rights reserved.
//

#import "UITableViewCell+EdgeInset.h"
#import "SwizzlingDefine.h"

@implementation UITableViewCell (EdgeInset)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        swizzling_exchangeMethod(self, @selector(setFrame:), @selector(swizzling_setFrame:));
    });
}

- (void)swizzling_setFrame:(CGRect)frame {
    if (self.edgeInsets) {
        UIEdgeInsets insets = self.edgeInsets.UIEdgeInsetsValue;
        frame.origin.x = frame.origin.x + insets.left;
        frame.size.width -= insets.left + insets.right;
        frame.origin.y = frame.origin.y + insets.top;
        frame.size.height -= insets.top + insets.bottom;
    }
    [self swizzling_setFrame:frame];
}

- (NSValue *)edgeInsets {
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setEdgeInsets:(NSValue *)edgeInsets {
    objc_setAssociatedObject(self, @selector(edgeInsets), edgeInsets, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
