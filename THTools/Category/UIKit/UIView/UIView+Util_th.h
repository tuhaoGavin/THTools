//
//  UIView+Util_th.h
//  Tools
//
//  Created by weixb on 16/12/19.
//  Copyright © 2016年 weixb. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Util_th)

@property (nonatomic) CGFloat left;        ///< Shortcut for frame.origin.x.
@property (nonatomic) CGFloat top;         ///< Shortcut for frame.origin.y
@property (nonatomic) CGFloat right;       ///< Shortcut for frame.origin.x + frame.size.width
@property (nonatomic) CGFloat bottom;      ///< Shortcut for frame.origin.y + frame.size.height

@property (nonatomic) CGFloat width;       ///< Shortcut for frame.size.width.
@property (nonatomic) CGFloat height;      ///< Shortcut for frame.size.height.
@property (nonatomic) CGSize  size;        ///< Shortcut for frame.size.

@property (nonatomic) CGFloat centerX;     ///< Shortcut for center.x
@property (nonatomic) CGFloat centerY;     ///< Shortcut for center.y
@property (nonatomic) CGPoint origin;      ///< Shortcut for frame.origin.
@property (nonatomic) CGFloat x;           ///< Shortcut for frame.origin.x.
@property (nonatomic) CGFloat y;           ///< Shortcut for frame.origin.y.

@property (nonatomic, readonly) CGPoint bottomLeft;
@property (nonatomic, readonly) CGPoint bottomRight;
@property (nonatomic, readonly) CGPoint topRight;

/* 圆角半径 */
@property (nonatomic, assign) IBInspectable CGFloat cornerRadius;
/* 边框宽度 */
@property (nonatomic, assign) IBInspectable CGFloat borderWidth;
/* 边框颜色 */
@property (nonatomic, weak) IBInspectable UIColor * _Nullable borderColor;

/**
 Returns the view's viewController (may be nil).
 */
@property (nullable, nonatomic, readonly) UIViewController *viewController;

/** 从xib加载View */
+ (instancetype _Nullable)loadFromNib;

/// 添加渐变色
/// @param start 开始位置
/// @param end 结束位置
/// @param colors CGColor的颜色数组
- (CAGradientLayer *_Nonnull)addGradientLayerWithStart:(CGPoint)start end:(CGPoint)end colors:(NSArray *_Nonnull)colors;

/**
 添加阴影
 
 @param color  阴影颜色
 @param offset 阴影offset
 @param radius 阴影圆角
 */
- (void)addShadowWithColor:(nullable UIColor*)color offset:(CGSize)offset radius:(CGFloat)radius;

/// 添加默认阴影
/// @param theColor 阴影颜色
- (void)addNormalShadowWithColor:(nullable UIColor *)theColor;


/// 绘制六边形
/// @param width 六边形宽度
- (void)drawSexangleWithWidth:(CGFloat)width;
@end
