//
//  THAlertView.h
//  Single
//
//  Created by 涂浩 on 2020/1/17.
//  Copyright © 2020 lobochat. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, THAlertViewPosition) {
    THAlertViewPositionMid = 0,
    THAlertViewPositionTop = 1,
    THAlertViewPositionBottom = 2,
};

@interface THAlertView : UIView

@property (nonatomic, assign) THAlertViewPosition position;

@property (nonatomic, assign) CGFloat alertWidth;
@property (nonatomic, assign) CGFloat alertHeight;

@property (nonatomic, assign) BOOL animation; //是否需要动画 默认是
@property (nonatomic, assign) BOOL bounce; //是否需要弹簧效果 默认是

@property (nonatomic, strong) UIColor *maskColor; //默认黑色


@property (nonatomic, assign) BOOL backgoundTapDismissEnable;  //默认为YES

@property (nonatomic, assign, readonly) BOOL showStatus; //当前显示状态

@property (nonatomic, assign) CGPoint alertOffSet; //alert偏移量


+ (instancetype)alertWithWidth:(CGFloat)width height:(CGFloat)height position:(THAlertViewPosition)position;


- (instancetype)initWithWidth:(CGFloat)width height:(CGFloat)height position:(THAlertViewPosition)position;

/** xib alert初始化方法 */
+ (instancetype)loadNibWithWidth:(CGFloat)width height:(CGFloat)height position:(THAlertViewPosition)position;

/**
 *  添加在window上
 */
- (void)show;

/**
 *  添加在指定view上
 */
- (void)showInView:(UIView *)superView;

/**
 *  隐藏
 */
- (void)hide;

@end

NS_ASSUME_NONNULL_END
