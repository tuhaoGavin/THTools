//
//  NSUserDefaults+iCloudSync_th.h
//  THToolsDemo
//
//  Created by weixb on 2017/2/16.
//  Copyright © 2017年 weixb. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSUserDefaults (iCloudSync_th)

- (void)th_setValue:(id)value  forKey:(NSString *)key iCloudSync:(BOOL)sync;
- (void)th_setObject:(id)value forKey:(NSString *)key iCloudSync:(BOOL)sync;

- (id)th_valueForKey:(NSString *)key  iCloudSync:(BOOL)sync;
- (id)th_objectForKey:(NSString *)key iCloudSync:(BOOL)sync;

- (BOOL)th_synchronizeAlsoiCloudSync:(BOOL)sync;

@end
