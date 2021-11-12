//
//  NSTimer+Addition_th.h
//  THToolsDemo
//
//  Created by weixb on 2017/2/16.
//  Copyright © 2017年 weixb. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSTimer (Addition_th)

/**
 *  @brief  暂停NSTimer
 */
- (void)th_pauseTimer;
/**
 *  @brief  开始NSTimer
 */
- (void)th_resumeTimer;
/**
 *  @brief  延迟开始NSTimer
 */
- (void)th_resumeTimerAfterTimeInterval:(NSTimeInterval)interval;

@end
