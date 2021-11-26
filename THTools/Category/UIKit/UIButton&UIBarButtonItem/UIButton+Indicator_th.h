//
//  UIButton+Indicator_th.h
//  THToolsDemo
//
//  Created by 涂浩 on 2017/2/16.
//  Copyright © 2017年 TuHao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (Indicator_th)

/**
 This method will show the activity indicator in place of the button text.
 */
- (void)th_showIndicator;

/**
 This method will remove the indicator and put thebutton text back in place.
 */
- (void)th_hideIndicator;

@end
