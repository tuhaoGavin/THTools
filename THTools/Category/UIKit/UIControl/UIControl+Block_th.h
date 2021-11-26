//
//  UIControl+Block_th.h
//  THToolsDemo
//
//  Created by 涂浩 on 2017/2/16.
//  Copyright © 2017年 TuHao. All rights reserved.
//
//  https://github.com/foxsofter/FXCategories
//  http://stackoverflow.com/questions/2437875/target-action-uicontrolevents

#import <UIKit/UIKit.h>

@interface UIControl (Block_th)

- (void)th_touchDown:(void (^)(void))eventBlock;
- (void)th_touchDownRepeat:(void (^)(void))eventBlock;
- (void)th_touchDragInside:(void (^)(void))eventBlock;
- (void)th_touchDragOutside:(void (^)(void))eventBlock;
- (void)th_touchDragEnter:(void (^)(void))eventBlock;
- (void)th_touchDragExit:(void (^)(void))eventBlock;
- (void)th_touchUpInside:(void (^)(void))eventBlock;
- (void)th_touchUpOutside:(void (^)(void))eventBlock;
- (void)th_touchCancel:(void (^)(void))eventBlock;
- (void)th_valueChanged:(void (^)(void))eventBlock;
- (void)th_editingDidBegin:(void (^)(void))eventBlock;
- (void)th_editingChanged:(void (^)(void))eventBlock;
- (void)th_editingDidEnd:(void (^)(void))eventBlock;
- (void)th_editingDidEndOnExit:(void (^)(void))eventBlock;

@end
