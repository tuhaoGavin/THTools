//
//  NSObject+Jump.m
//  Single
//
//  Created by 涂浩 on 2019/12/26.
//  Copyright © 2019 lobochat. All rights reserved.
//

#import "NSObject+Jump.h"
#import <objc/runtime.h>
#import "THWeakWrapper.h"

@implementation NSObject (Jump)
//objc_AssociationPolicy 并不支持weak属性 可以包一层Object来处理这个问题，避免循环引用导致的内存泄漏
-(UIViewController<THJumpDelegate> *)jumpDelegate {
    THWeakWrapper *wrapper = objc_getAssociatedObject(self, @selector(jumpDelegate));
    return wrapper.obj;
}

- (void)setJumpDelegate:(UIViewController<THJumpDelegate> *)jumpDelegate {
    THWeakWrapper *wrapper = nil;
    if (jumpDelegate) {
        wrapper = [[THWeakWrapper alloc] init];
        wrapper.obj = jumpDelegate;
    }
    objc_setAssociatedObject(self, @selector(jumpDelegate), wrapper, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}


@end
