//
//  UINavigationController+Transitions_th.h
//  THToolsDemo
//
//  Created by weixb on 2017/2/16.
//  Copyright © 2017年 weixb. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationController (Transitions_th)

- (void)th_pushViewController:(UIViewController *)controller withTransition:(UIViewAnimationTransition)transition;

- (UIViewController *)th_popViewControllerWithTransition:(UIViewAnimationTransition)transition;

@end
