//
//  UIButton+CountDown_th.m
//  THToolsDemo
//
//  Created by 涂浩 on 2017/2/16.
//  Copyright © 2017年 TuHao. All rights reserved.
//

#import "UIButton+CountDown_th.h"
#import <objc/runtime.h>
#import "NSString+Util_th.h"

@interface UIButton ()

@property (nonatomic, strong)dispatch_source_t countDownTimer;

@end

@implementation UIButton (CountDown_th)

-(void)th_startTime:(NSInteger)timeout title:(NSString *)tittle waitPreTittle:(NSString *)preTittle waitSufTitle:(NSString *)sufTitle disEnableWhenCountDown:(BOOL)disEnableWhenCountDown {
    if (self.isCountDown) {
        dispatch_source_cancel(self.countDownTimer);
    }
    __block NSInteger timeOut=timeout; //倒计时时间
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    self.countDownTimer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0,queue);
    dispatch_source_set_timer(self.countDownTimer,dispatch_walltime(NULL, 0),1.0*NSEC_PER_SEC, 0); //每秒执行
    dispatch_source_set_event_handler(self.countDownTimer, ^{
        if (timeOut<=0){ //倒计时结束，关闭
            dispatch_source_cancel(self.countDownTimer);
            dispatch_async(dispatch_get_main_queue(), ^{
                //设置界面的按钮显示 根据自己需求设置
                [self setTitle:tittle forState:UIControlStateNormal];
                self.enabled = YES;
                self.isCountDown = NO;
            });
        } else {
            NSString *strTime = [NSString stringWithFormat:@"%.2ld", (long)timeOut];
            dispatch_async(dispatch_get_main_queue(), ^{
                //设置界面的按钮显示 根据自己需求设置
                [self setTitle:[NSString stringWithFormat:@"%@%@%@", preTittle, strTime, sufTitle] forState:UIControlStateNormal];
                self.enabled = disEnableWhenCountDown ? NO : YES;
                self.isCountDown = YES;
            });
            timeOut--;
            
        }
    });
    dispatch_resume(self.countDownTimer);
}


-(void)th_startMMSSTime:(NSInteger)timeout title:(NSString *)tittle waitPreTittle:(NSString *)preTittle waitSufTitle:(NSString *)sufTitle disEnableWhenCountDown:(BOOL)disEnableWhenCountDown {
    if (self.isCountDown) {
        dispatch_source_cancel(self.countDownTimer);
    }
    __block NSInteger timeOut=timeout; //倒计时时间
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    self.countDownTimer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0,queue);
    dispatch_source_set_timer(self.countDownTimer,dispatch_walltime(NULL, 0),1.0*NSEC_PER_SEC, 0); //每秒执行
    dispatch_source_set_event_handler(self.countDownTimer, ^{
        if (timeOut<=0){ //倒计时结束，关闭
            dispatch_source_cancel(self.countDownTimer);
            dispatch_async(dispatch_get_main_queue(), ^{
                //设置界面的按钮显示 根据自己需求设置
                [self setTitle:tittle forState:UIControlStateNormal];
                self.enabled = YES;
                self.isCountDown = NO;
            });
        } else {
            NSString *strTime = [NSString stringWithFormat:@"%.2ld", (long)timeOut];
            dispatch_async(dispatch_get_main_queue(), ^{
                //设置界面的按钮显示 根据自己需求设置
                [self setTitle:[NSString stringWithFormat:@"%@%@%@", preTittle, [NSString th_getMMSSFromSS:strTime], sufTitle] forState:UIControlStateNormal];
                self.enabled = disEnableWhenCountDown ? NO : YES;
                self.isCountDown = YES;
            });
            timeOut--;
            
        }
    });
    dispatch_resume(self.countDownTimer);
}

- (void)th_endCountDown {
    if (self.isCountDown) {
        dispatch_source_cancel(self.countDownTimer);
        self.countDownTimer = nil;
        self.enabled = YES;
        self.isCountDown = NO;
    }
}

-(BOOL)isCountDown {
    return [objc_getAssociatedObject(self, _cmd) boolValue];
}

-(void)setIsCountDown:(BOOL)isCountDown{
    objc_setAssociatedObject(self, @selector(isCountDown), @(isCountDown), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (dispatch_source_t)countDownTimer {
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setCountDownTimer:(dispatch_source_t)countDownTimer {
    objc_setAssociatedObject(self, @selector(countDownTimer), countDownTimer, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
