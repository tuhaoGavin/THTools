//
//  UIView+GestureBlock_th.h
//  THToolsDemo
//
//  Created by 涂浩 on 2017/3/23.
//  Copyright © 2017年 TuHao. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (GestureBlock_th)
/**
 *  轻击手势
 *
 *  @param numberOfTouches 触摸手指数
 *  @param numberOfTaps    点击次数
 *  @param block           回调
 */
- (void)th_whenTouches:(NSUInteger)numberOfTouches taps:(NSUInteger)numberOfTaps block:(void(^)(UITapGestureRecognizer *tapGesture))block;
/**
 *  @brief  单击手势
 *
 *  @param block 回调
 */
- (void)th_whenTapped:(void(^)(UITapGestureRecognizer *tapGesture))block;
/**
 *  @brief  双击手势
 *
 *  @param block 回调
 */
- (void)th_whenDoubleTapped:(void(^)(UITapGestureRecognizer *tapGesture))block;

/**
 *  @brief  长按手势
 *
 *  @param block 回调
 */
- (void)th_whenLongPressed:(void(^)(UILongPressGestureRecognizer *longPressGesture))block;

/**
 *  轻扫手势
 *
 *  @param numberOfTouches 触摸手指数
 *  @param direction       轻扫方向
 *  @param block           回调
 */
- (void)th_whenSwipedWithTouches:(NSUInteger)numberOfTouches direction:(UISwipeGestureRecognizerDirection)direction block:(void(^)(UISwipeGestureRecognizer *swipeGesture))block;
/**
 *  @brief  单指轻扫
 *
 *  @param block 回调
 */
- (void)th_whenSwipedWithDirection:(UISwipeGestureRecognizerDirection)direction block:(void(^)(UISwipeGestureRecognizer *swipeGesture))block;
- (void)th_whenSwipedLeft:(void(^)(UISwipeGestureRecognizer *swipeGesture))block;
- (void)th_whenSwipedRight:(void(^)(UISwipeGestureRecognizer *swipeGesture))block;
- (void)th_whenSwipedUp:(void(^)(UISwipeGestureRecognizer *swipeGesture))block;
- (void)th_whenSwipedDown:(void(^)(UISwipeGestureRecognizer *swipeGesture))block;

/**
 *  @brief  捏合手势
 *
 *  @param block 回调
 */
- (void)th_whenPinch:(void(^)(UIPinchGestureRecognizer *pinchGesture))block;

/**
 *  @brief  拖动手势
 *
 *  @param block 回调
 */
- (void)th_whenPan:(void(^)(UIPanGestureRecognizer *pinchGesture))block;

/**
 *  @brief  旋转手势
 *
 *  @param block 回调
 */
- (void)th_whenRotation:(void(^)(UIRotationGestureRecognizer *pinchGesture))block;


@end

NS_ASSUME_NONNULL_END
