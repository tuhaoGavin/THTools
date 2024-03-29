//
//  THSettingsModel.m
//  THSettingsDemo
//
//  Created by 涂浩 on 2017/12/15.
//  Copyright © 2017年 TuHao. All rights reserved.
//

#import "THSettingsModel.h"

@implementation THSettingsModel

static id instance; // 单例（全局变量）

/** 单例方法 */
+ (instancetype)sharedSettings {
    // 使用GCD确保只进行一次
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[super allocWithZone:NULL] init];
    });
    return instance;
}

/** alloc 会调用allocWithZone方法 */
+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    return [THSettingsModel sharedSettings];
}

/** copy在底层 会调用copyWithZone方法 */
- (id)copyWithZone:(struct _NSZone *)zone {
    
    return instance;
}

#pragma mark - getter
- (NSString *)DNDTime {
    if (!_DNDTime.length) {
        return [NSString stringWithFormat:@"%zd：00至%zd：00", self.distrubTimeStart, self.distrubTimeEnd];
    }
    return _DNDTime;
}

@end
