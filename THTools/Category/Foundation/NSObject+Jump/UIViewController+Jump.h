//
//  UIViewController+Jump.h
//  Single
//
//  Created by 涂浩 on 2019/12/26.
//  Copyright © 2019 lobochat. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NSObject+Jump.h"
NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (Jump)<THJumpDelegate>

/// 添加基于CAAnimation转场动画
/// @param type 转场动画名
/// (fade,push,moveIn,reveal,pageCurl,pageUnCurl,rippleEffect,suckEffect,cube,oglFlip)
/// @param subType 转场动画方向 fg:kCATransitionFromLeft
/// @param timingFunctionName 动画节奏名 fg:kCAMediaTimingFunctionEaseIn
/// @param duration 动画时间
- (void)th_addTransitionAnimationWithType:(CATransitionType)type
                             subType:(CATransitionSubtype)subType
                       timingFunctionName:(CAMediaTimingFunctionName)timingFunctionName
                            duration:(CFTimeInterval)duration;

@end

NS_ASSUME_NONNULL_END
