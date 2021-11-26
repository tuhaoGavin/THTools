//
//  UIView+AutoLayout_th.h
//  THToolsDemo
//
//  Created by 涂浩 on 2017/12/19.
//  Copyright © 2017年 TuHao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (AutoLayout_th)

- (void)addConstraintToView:(UIView *)view edgeInset:(UIEdgeInsets)edgeInset;

- (void)addConstraintWithView:(UIView *)view topView:(UIView *)topView leftView:(UIView *)leftView
                   bottomView:(UIView *)bottomView rightView:(UIView *)rightView edgeInset:(UIEdgeInsets)edgeInset;

- (void)addConstraintWithLeftView:(UIView *)leftView toRightView:(UIView *)rightView constant:(CGFloat)constant;

- (NSLayoutConstraint *)addConstraintWithTopView:(UIView *)topView toBottomView:(UIView *)bottomView constant:(CGFloat)constant;

- (void)addConstraintWidth:(CGFloat)width height:(CGFloat)height;

- (void)addConstraintEqualWithView:(UIView *)view widthToView:(UIView *)wView heightToView:(UIView *)hView;

- (NSLayoutConstraint *)addConstraintCenterYToView:(UIView *)yView constant:(CGFloat)constant;

- (void)addConstraintCenterXToView:(UIView *)xView centerYToView:(UIView *)yView;

/// 修改约束比例multiplier属性
/// @param constraint 约束对象
/// @param multiplier 比例值
- (void)changeMultiplierOfConstraint:(NSLayoutConstraint *)constraint multiplier:(CGFloat)multiplier;


- (void)removeConstraintWithAttribte:(NSLayoutAttribute)attr;

- (void)removeConstraintWithView:(UIView *)view attribute:(NSLayoutAttribute)attr;

- (void)removeAllConstraints;

@end
