//
//  THSettingsSwitchCell.h
//  THSettingsDemo
//
//  Created by 涂浩 on 2017/12/15.
//  Copyright © 2017年 TuHao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "THSettingsCellDelegate.h"

@interface THSettingsSwitchCell : UITableViewCell<THSettingsCellDelegate>

@property (nonatomic, strong, readonly) UISwitch *switcher;//开关
@property (nonatomic, strong) UIColor *tintColor;//关状态下的背景颜色
@property (nonatomic, strong) UIColor *onTintColor;//开状态下的背景颜色
@property (nonatomic, strong) UIColor *thumbTintColor;//滑块的背景颜色

@end
