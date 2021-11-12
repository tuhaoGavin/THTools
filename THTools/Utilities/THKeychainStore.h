//
//  NLKeychainStore.h
//  Single
//
//  Created by 涂浩 on 2020/1/22.
//  Copyright © 2020 lobochat. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface THKeychainStore : NSObject

+ (void)save:(NSString*)service data:(id)data;
+ (id)load:(NSString*)service;
+ (void)deleteKeyData:(NSString*)service;

/**  获取用户唯一标志UUID 该值为此设备第一次安装本app时的idfv，获取后会存至钥匙串*/
+ (NSString *)getUUIDByKeyChain;

@end

NS_ASSUME_NONNULL_END
