//
//  NSKeyedUnarchiver+Util.m
//  NewLife
//
//  Created by 涂浩 on 2020/5/12.
//  Copyright © 2020 NB. All rights reserved.
//

#import "NSKeyedUnarchiver+Util.h"
#import "SwizzlingDefine.h"

@implementation NSKeyedUnarchiver (Util)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        swizzling_exchangeMethod(object_getClass(self), @selector(unarchiveObjectWithData:), @selector(swizzling_unarchiveObjectWithData:));
        swizzling_exchangeMethod(object_getClass(self), @selector(unarchiveObjectWithFile:), @selector(swizzling_unarchiveObjectWithFile:));
    });
}

+ (id)swizzling_unarchiveObjectWithData:(NSData *)data {
    id obj;
    @try {
        obj = [self swizzling_unarchiveObjectWithData:data];
    } @catch (NSException *exception) {
        obj = nil;
    } @finally {
        return obj;
    }
}

+ (id)swizzling_unarchiveObjectWithFile:(NSString *)path {
    id obj;
    @try {
        obj = [self swizzling_unarchiveObjectWithFile:path];
    } @catch (NSException *exception) {
        obj = nil;
    } @finally {
        return obj;
    }
}

@end
