//
//  UIView+Badge_th.h
//  THToolsDemo
//
//  Created by weixb on 2017/7/24.
//  Copyright © 2017年 weixb. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Badge_th)

@property (strong, nonatomic) UILabel *th_badge;

// Badge value to be display
@property (nonatomic) NSString *th_badgeValue;
// Badge background color
@property (nonatomic) UIColor *th_badgeBGColor;
// Badge text color
@property (nonatomic) UIColor *th_badgeTextColor;
// Badge font
@property (nonatomic) UIFont *th_badgeFont;
// Padding value for the badge
@property (nonatomic) CGFloat th_badgePadding;
// Minimum size badge to small
@property (nonatomic) CGFloat th_badgeMinSize;
// Values for offseting the badge over the BarButtonItem you picked
@property (nonatomic) CGFloat th_badgeOriginX;
@property (nonatomic) CGFloat th_badgeOriginY;
// In case of numbers, remove the badge when reaching zero
@property BOOL th_shouldHideBadgeAtZero;
// Badge has a bounce animation when value changes
@property BOOL th_shouldAnimateBadge;


@end
