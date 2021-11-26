//
//  NSNotificationCenter+MainThread_th.h
//  THToolsDemo
//
//  Created by 涂浩 on 2017/2/16.
//  Copyright © 2017年 TuHao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSNotificationCenter (MainThread_th)

/**
 *  @brief  在主线程中发送一条通知
 *
 *  @param notification NSNotification对象
 */
- (void)th_postNotificationOnMainThread:(NSNotification *)notification;
/**
 *  @brief  在主线程中发送一条通知
 *
 *  @param aName    用来生成新通知的通知名称
 *  @param anObject 通知携带的对象
 */
- (void)th_postNotificationOnMainThreadName:(NSString *)aName object:(id)anObject;
/**
 *  @brief  在主线程中发送一条通知
 *
 *  @param aName     用来生成新通知的通知名称
 *  @param anObject  通知携带的对象
 *  @param aUserInfo 通知携带的用户信息
 */
- (void)th_postNotificationOnMainThreadName:(NSString *)aName object:(id)anObject userInfo:(NSDictionary *)aUserInfo;

@end
