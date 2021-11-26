//
//  THSettingsModel.h
//  THSettingsDemo
//
//  Created by 涂浩 on 2017/12/15.
//  Copyright © 2017年 TuHao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface THSettingsModel : NSObject

@property (nonatomic, assign) BOOL displayInform;//显示通知详情
@property (nonatomic, assign) BOOL distrub;//勿扰模式开关
@property (nonatomic, assign) NSInteger distrubTimeStart;//勿扰开始时间 (小时)
@property (nonatomic, assign) NSInteger distrubTimeEnd;//勿扰结束时间 (小时)
@property (nonatomic, assign) BOOL voice;//是否开启声音
@property (nonatomic, assign) BOOL shake;//是否开启震动

@property (nonatomic, copy)   NSString *DNDTime;//勿扰时间

@property (nonatomic, assign) NSInteger systemMessageInform;//是否开启系统消息推送

/** 单例方法 */
+ (instancetype)sharedSettings;

@end
