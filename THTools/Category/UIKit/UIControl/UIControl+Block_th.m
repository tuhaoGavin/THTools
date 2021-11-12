//
//  UIControl+Block_th.m
//  THToolsDemo
//
//  Created by weixb on 2017/2/16.
//  Copyright © 2017年 weixb. All rights reserved.
//

#import "UIControl+Block_th.h"
#import <objc/runtime.h>

NS_ASSUME_NONNULL_BEGIN

// UIControlEventTouchDown           = 1 <<  0,      // on all touch downs
// UIControlEventTouchDownRepeat     = 1 <<  1,      // on multiple touchdowns
// (tap count > 1)
// UIControlEventTouchDragInside     = 1 <<  2,
// UIControlEventTouchDragOutside    = 1 <<  3,
// UIControlEventTouchDragEnter      = 1 <<  4,
// UIControlEventTouchDragExit       = 1 <<  5,
// UIControlEventTouchUpInside       = 1 <<  6,
// UIControlEventTouchUpOutside      = 1 <<  7,
// UIControlEventTouchCancel         = 1 <<  8,
//
// UIControlEventValueChanged        = 1 << 12,     // sliders, etc.
//
// UIControlEventEditingDidBegin     = 1 << 16,     // UITextField
// UIControlEventEditingChanged      = 1 << 17,
// UIControlEventEditingDidEnd       = 1 << 18,
// UIControlEventEditingDidEndOnExit = 1 << 19,     // 'return key' ending
// editing
//
// UIControlEventAllTouchEvents      = 0x00000FFF,  // for touch events
// UIControlEventAllEditingEvents    = 0x000F0000,  // for UITextField
// UIControlEventApplicationReserved = 0x0F000000,  // range available for
// application use
// UIControlEventSystemReserved      = 0xF0000000,  // range reserved for
// internal framework use
// UIControlEventAllEvents           = 0xFFFFFFFF

#define th_UICONTROL_EVENT(methodName, eventName)                                \
-(void)methodName : (void (^)(void))eventBlock {                              \
objc_setAssociatedObject(self, @selector(methodName:), eventBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);\
[self addTarget:self                                                        \
action:@selector(methodName##Action:)                                       \
forControlEvents:UIControlEvent##eventName];                                \
}                                                                               \
-(void)methodName##Action:(id)sender {                                        \
void (^block)() = objc_getAssociatedObject(self, @selector(methodName:));  \
if (block) {                                                                \
block();                                                                \
}                                                                           \
}
@implementation UIControl (Block_th)

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wstrict-prototypes"
th_UICONTROL_EVENT(th_touchDown, TouchDown)
th_UICONTROL_EVENT(th_touchDownRepeat, TouchDownRepeat)
th_UICONTROL_EVENT(th_touchDragInside, TouchDragInside)
th_UICONTROL_EVENT(th_touchDragOutside, TouchDragOutside)
th_UICONTROL_EVENT(th_touchDragEnter, TouchDragEnter)
th_UICONTROL_EVENT(th_touchDragExit, TouchDragExit)
th_UICONTROL_EVENT(th_touchUpInside, TouchUpInside)
th_UICONTROL_EVENT(th_touchUpOutside, TouchUpOutside)
th_UICONTROL_EVENT(th_touchCancel, TouchCancel)
th_UICONTROL_EVENT(th_valueChanged, ValueChanged)
th_UICONTROL_EVENT(th_editingDidBegin, EditingDidBegin)
th_UICONTROL_EVENT(th_editingChanged, EditingChanged)
th_UICONTROL_EVENT(th_editingDidEnd, EditingDidEnd)
th_UICONTROL_EVENT(th_editingDidEndOnExit, EditingDidEndOnExit)
#pragma clang diagnostic pop

@end

NS_ASSUME_NONNULL_END
