//
//  UIView+GestureBlock_th.m
//  THToolsDemo
//
//  Created by weixb on 2017/3/23.
//  Copyright © 2017年 weixb. All rights reserved.
//

#import "UIView+GestureBlock_th.h"
@import ObjectiveC.runtime;

#define th_objcAssociatedGesturekKey (__bridge const void *)(block)
#define th_objcAssociatedBlockkKey (__bridge const void *)(gesture)

@implementation UIView (GestureBlock_th)

/* 轻击手势key */
//static char th_kActionHandlerTapBlockKey;

- (void)th_whenTouches:(NSUInteger)numberOfTouches taps:(NSUInteger)numberOfTaps block:(void (^)(UITapGestureRecognizer * _Nonnull))block {
    UITapGestureRecognizer *gesture = objc_getAssociatedObject(self, th_objcAssociatedGesturekKey);
    if (!gesture)
    {
        gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(th_handleActionForTapGesture:)];
        gesture.numberOfTouchesRequired = numberOfTouches; //触摸手指数
        gesture.numberOfTapsRequired = numberOfTaps; //点击次数
        [self addGestureRecognizer:gesture];
        objc_setAssociatedObject(self, th_objcAssociatedGesturekKey, gesture, OBJC_ASSOCIATION_RETAIN);
    }
    objc_setAssociatedObject(self, th_objcAssociatedBlockkKey, block, OBJC_ASSOCIATION_COPY);
}

- (void)th_handleActionForTapGesture:(UITapGestureRecognizer*)gesture
{
    if (gesture.state == UIGestureRecognizerStateRecognized)
    {
        void(^block)(UITapGestureRecognizer *) = objc_getAssociatedObject(self, th_objcAssociatedBlockkKey);
        if (block) block(gesture);
    }
}

/* 单击 */
- (void)th_whenTapped:(void (^)(UITapGestureRecognizer * _Nonnull))block {
    [self th_whenTouches:1 taps:1 block:block];
}
/* 双击 */
- (void)th_whenDoubleTapped:(void (^)(UITapGestureRecognizer * _Nonnull))block {
    [self th_whenTouches:1 taps:2 block:block];
}

/* 长按手势key */
static char th_kActionHandlerLongPressBlockKey;

- (void)th_whenLongPressed:(void (^)(UILongPressGestureRecognizer * _Nonnull))block
{
    UILongPressGestureRecognizer *gesture = objc_getAssociatedObject(self, th_objcAssociatedGesturekKey);
    if (!gesture)
    {
        gesture = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(th_handleActionForLongPressGesture:)];
        [self addGestureRecognizer:gesture];
        objc_setAssociatedObject(self, th_objcAssociatedGesturekKey, gesture, OBJC_ASSOCIATION_RETAIN);
    }
    objc_setAssociatedObject(self, &th_kActionHandlerLongPressBlockKey, block, OBJC_ASSOCIATION_COPY);
}
- (void)th_handleActionForLongPressGesture:(UILongPressGestureRecognizer*)gesture
{
    void(^block)(UILongPressGestureRecognizer *) = objc_getAssociatedObject(self, &th_kActionHandlerLongPressBlockKey);
    if (block) block(gesture);
}

/* 轻扫手势key */
//static char th_kActionHandlerSwipeBlockKey;

- (void)th_whenSwipedWithTouches:(NSUInteger)numberOfTouches direction:(UISwipeGestureRecognizerDirection)direction block:(void (^)(UISwipeGestureRecognizer * _Nonnull))block {
    UISwipeGestureRecognizer *gesture = objc_getAssociatedObject(self, th_objcAssociatedGesturekKey);
    if (!gesture)
    {
        gesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(th_handleActionForSwipeGesture:)];
        gesture.numberOfTouchesRequired = numberOfTouches; //触摸手指数
        gesture.direction = direction; //轻扫方向
        [self addGestureRecognizer:gesture];
        objc_setAssociatedObject(self, th_objcAssociatedGesturekKey, gesture, OBJC_ASSOCIATION_RETAIN);
    }
    objc_setAssociatedObject(self, th_objcAssociatedBlockkKey, block, OBJC_ASSOCIATION_COPY);
}
/* 单指轻扫 */
- (void)th_whenSwipedWithDirection:(UISwipeGestureRecognizerDirection)direction block:(void (^)(UISwipeGestureRecognizer * _Nonnull))block {
    [self th_whenSwipedWithTouches:1 direction:direction block:block];
}
- (void)th_whenSwipedLeft:(void (^)(UISwipeGestureRecognizer * _Nonnull))block {
    [self th_whenSwipedWithDirection:UISwipeGestureRecognizerDirectionLeft block:block];
}
- (void)th_whenSwipedRight:(void (^)(UISwipeGestureRecognizer * _Nonnull))block {
    [self th_whenSwipedWithDirection:UISwipeGestureRecognizerDirectionRight block:block];
}
- (void)th_whenSwipedUp:(void (^)(UISwipeGestureRecognizer * _Nonnull))block {
    [self th_whenSwipedWithDirection:UISwipeGestureRecognizerDirectionUp block:block];
}
- (void)th_whenSwipedDown:(void (^)(UISwipeGestureRecognizer * _Nonnull))block {
    [self th_whenSwipedWithDirection:UISwipeGestureRecognizerDirectionDown block:block];
}

- (void)th_handleActionForSwipeGesture:(UISwipeGestureRecognizer*)gesture
{
    if (gesture.state == UIGestureRecognizerStateRecognized)
    {
        void(^block)(UISwipeGestureRecognizer *) = objc_getAssociatedObject(self, th_objcAssociatedBlockkKey);
        if (block) block(gesture);
    }
}

/* 捏合手势key */
static char th_kActionHandlerPinchBlockKey;

- (void)th_whenPinch:(void (^)(UIPinchGestureRecognizer * _Nonnull))block {
    UIPinchGestureRecognizer *gesture = objc_getAssociatedObject(self, th_objcAssociatedGesturekKey);
    if (!gesture)
    {
        gesture = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(th_handleActionForPinchGesture:)];
        [self addGestureRecognizer:gesture];
        objc_setAssociatedObject(self, th_objcAssociatedGesturekKey, gesture, OBJC_ASSOCIATION_RETAIN);
    }
    objc_setAssociatedObject(self, &th_kActionHandlerPinchBlockKey, block, OBJC_ASSOCIATION_COPY);
}
- (void)th_handleActionForPinchGesture:(UIPinchGestureRecognizer*)gesture
{
    void(^block)(UIPinchGestureRecognizer *) = objc_getAssociatedObject(self, &th_kActionHandlerPinchBlockKey);
    if (block) block(gesture);
}

/* 拖动手势key */
static char th_kActionHandlerPanBlockKey;

- (void)th_whenPan:(void (^)(UIPanGestureRecognizer * _Nonnull))block {
    UIPanGestureRecognizer *gesture = objc_getAssociatedObject(self, th_objcAssociatedGesturekKey);
    if (!gesture)
    {
        gesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(th_handleActionForPanGesture:)];
        [self addGestureRecognizer:gesture];
        objc_setAssociatedObject(self, th_objcAssociatedGesturekKey, gesture, OBJC_ASSOCIATION_RETAIN);
    }
    objc_setAssociatedObject(self, &th_kActionHandlerPanBlockKey, block, OBJC_ASSOCIATION_COPY);
}
- (void)th_handleActionForPanGesture:(UIPanGestureRecognizer*)gesture
{
    void(^block)(UIPanGestureRecognizer *) = objc_getAssociatedObject(self, &th_kActionHandlerPanBlockKey);
    if (block) block(gesture);
}

/* 旋转手势key */
static char th_kActionHandlerRotationBlockKey;

- (void)th_whenRotation:(void (^)(UIRotationGestureRecognizer * _Nonnull))block {
    UIRotationGestureRecognizer *gesture = objc_getAssociatedObject(self, th_objcAssociatedGesturekKey);
    if (!gesture)
    {
        gesture = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(th_handleActionForRotationGesture:)];
        [self addGestureRecognizer:gesture];
        objc_setAssociatedObject(self, th_objcAssociatedGesturekKey, gesture, OBJC_ASSOCIATION_RETAIN);
    }
    objc_setAssociatedObject(self, &th_kActionHandlerRotationBlockKey, block, OBJC_ASSOCIATION_COPY);
}
- (void)th_handleActionForRotationGesture:(UIRotationGestureRecognizer*)gesture
{
    void(^block)(UIRotationGestureRecognizer *) = objc_getAssociatedObject(self, &th_kActionHandlerRotationBlockKey);
    if (block) block(gesture);
}

@end








