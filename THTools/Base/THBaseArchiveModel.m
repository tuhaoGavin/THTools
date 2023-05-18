//
//  THBaseArchiveModel.m
//  THToolsDemo
//
//  Created by 涂浩 on 2017/7/27.
//  Copyright © 2017年 TuHao. All rights reserved.
//

#import "THBaseArchiveModel.h"
#import <objc/runtime.h>

static const void *InstanceKey = &InstanceKey;

@implementation THBaseArchiveModel

static id instance; // 单例（全局变量）

/** 单例方法 */
+ (instancetype)shared {
/** 这样声明的单例不能被继承，否则会出错 */
//    // 使用GCD确保只进行一次
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        instance = [self unarchive];
//    });
//    return instance;

    @synchronized (self) {
        instance = objc_getAssociatedObject(self, InstanceKey);
        if (!instance) {
            instance = [self unarchive];
        }
    }
    return instance;
}

//** alloc 会调用allocWithZone方法 .h中直接废弃init和new方法，可不重写
+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    /** 可继承单例写法 */
    @synchronized (self) {
        instance = objc_getAssociatedObject(self, InstanceKey);
        if (!instance) {
            instance = [super allocWithZone:zone];
            objc_setAssociatedObject(self, InstanceKey, instance, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        }
    }
    return instance;
}

///** copy在底层 会调用copyWithZone方法 */
- (id)copyWithZone:(struct _NSZone *)zone {
    return instance;
}

#pragma mark - 私有方法
/** 归档路径 */
+ (NSString *)archivePath {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *basePath = paths.firstObject;
    NSString *filePath = [basePath stringByAppendingPathComponent:[[self class] fileName]];
    return filePath;
}

/** 归档文件名 */
+ (NSString *)fileName {
    NSString *name = [NSString stringWithFormat:@"%@.model",NSStringFromClass([self class])];
    return name;
}

// 因为在解档的时候,还没有任何的model实例.所以写成类方法,并把解档的对象返回
// 在model创建的时候调用
+ (instancetype)unarchive {
    id obj = [NSKeyedUnarchiver unarchiveObjectWithFile:[self archivePath]];
    if (!obj) {
        obj = [[self alloc] init];
    }
    return obj;
}

#pragma mark - 接口方法
/** 归档 */
- (void)archive {
    [NSKeyedArchiver archiveRootObject:[self.class shared] toFile:[[self class] archivePath]];
}

/** 删除归档数据 */
- (void)deleteData {
    // 创建文件管理器
    NSFileManager *fileManager = [NSFileManager defaultManager];
    // 删除文件
    [fileManager removeItemAtPath:[[self class] archivePath] error:nil];
}


@end
