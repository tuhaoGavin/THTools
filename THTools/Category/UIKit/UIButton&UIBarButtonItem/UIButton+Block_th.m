//
//  UIButton+Block_th.m
//  THToolsDemo
//
//  Created by 涂浩 on 2017/2/16.
//  Copyright © 2017年 TuHao. All rights reserved.
//

#import "UIButton+Block_th.h"
#import <objc/runtime.h>
static const void *th_UIButtonBlockKey = &th_UIButtonBlockKey;

@implementation UIButton (Block_th)

-(void)th_addActionHandler:(WXBTouchedButtonBlock)touchHandler{
    objc_setAssociatedObject(self, th_UIButtonBlockKey, touchHandler, OBJC_ASSOCIATION_COPY_NONATOMIC);
    [self addTarget:self action:@selector(th_blockActionTouched:) forControlEvents:UIControlEventTouchUpInside];
}

-(void)th_blockActionTouched:(UIButton *)btn{
    WXBTouchedButtonBlock block = objc_getAssociatedObject(self, th_UIButtonBlockKey);
    if (block) {
        block(btn.tag);
    }
}

@end
