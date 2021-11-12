//
//  SwizzlingDefine.h
//  LongGuanJia
//
//  Created by Qi on 2021/4/28.
//  Copyright © 2021 waging. All rights reserved.
//

#ifndef SwizzlingDefine_h
#define SwizzlingDefine_h

#import <objc/runtime.h>

static inline void swizzling_exchangeMethod(Class clazz, SEL originalSelector, SEL swizzledSelector) {
    Method originalMethod = class_getInstanceMethod(clazz, originalSelector);
    Method swizzledMethod = class_getInstanceMethod(clazz, swizzledSelector);

    BOOL success = class_addMethod(clazz, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod));
    if (success) {
        class_replaceMethod(clazz, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
    } else {
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
}




#endif /* SwizzlingDefine_h */
