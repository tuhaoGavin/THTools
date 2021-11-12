//
//  UIView+Util_th.m
//  Tools
//
//  Created by weixb on 16/12/19.
//  Copyright © 2016年 weixb. All rights reserved.
//

#import "UIView+Util_th.h"
#import "UIImage+Capture_th.h"

@implementation UIView (Util_th)

#pragma mark - edges
- (CGFloat)top {
    return self.frame.origin.y;
}

- (void)setTop:(CGFloat)newtop {
    CGRect newframe = self.frame;
    newframe.origin.y = newtop;
    self.frame = newframe;
}

- (CGFloat)left {
    return self.frame.origin.x;
}

- (void)setLeft:(CGFloat)newleft {
    CGRect newframe = self.frame;
    newframe.origin.x = newleft;
    self.frame =newframe;
}

- (CGFloat)bottom {
    return self.frame.origin.y + self.frame.size.height;
}

- (void)setBottom:(CGFloat)newbottom {
    CGRect newframe = self.frame;
    newframe.origin.y = newbottom - self.frame.size.height;
    self.frame = newframe;
}

- (CGFloat)right {
    return self.frame.origin.x + self.frame.size.width;
}

- (void)setRight:(CGFloat)newright {
    CGFloat delta = newright - (self.frame.origin.x + self.frame.size.width);
    CGRect newframe = self.frame;
    newframe.origin.x +=delta;
    self.frame =newframe;
}

#pragma mark - size
- (CGSize)size {
    return self.frame.size;
}

- (void)setSize:(CGSize)asize {
    CGRect newFrame = self.frame;
    newFrame.size =asize;
    self.frame = newFrame;
}

- (CGFloat)height {
    return self.frame.size.height;
}

- (void)setHeight:(CGFloat)newHeight {
    CGRect newframe = self.frame;
    newframe.size.height = newHeight;
    self.frame = newframe;
}

- (CGFloat)width {
    return self.frame.size.width;
}

- (void)setWidth:(CGFloat)newWidth {
    CGRect newframe = self.frame;
    newframe.size.width = newWidth;
    self.frame = newframe;
}

#pragma mark - center
- (CGFloat)centerX {
    return self.center.x;
}

- (void)setCenterX:(CGFloat)centerX {
    self.center = CGPointMake(centerX, self.center.y);
}

- (CGFloat)centerY {
    return self.center.y;
}

- (void)setCenterY:(CGFloat)centerY {
    self.center = CGPointMake(self.center.x, centerY);
}

- (CGPoint)origin {
    return self.frame.origin;
}

- (void)setOrigin:(CGPoint)aPoint {
    CGRect newFrame = self.frame;
    newFrame.origin = aPoint;
    self.frame = newFrame;
}

- (CGFloat)x{
    return self.frame.origin.x;
}

- (void)setX:(CGFloat)x{
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (CGFloat)y {
    return self.frame.origin.y;
}

- (void)setY:(CGFloat)y{
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (CGPoint)bottomRight {
    CGFloat x= self.frame.origin.x + self.frame.size.width;
    CGFloat y =self.frame.origin.y + self.frame.size.height;
    return CGPointMake(x, y);
}

- (CGPoint)bottomLeft {
    CGFloat x= self.frame.origin.x;
    CGFloat y =self.frame.origin.y + self.frame.size.height;
    return CGPointMake(x, y);
}

- (CGPoint)topRight {
    CGFloat x= self.frame.origin.x + self.frame.size.width;
    CGFloat y =self.frame.origin.y;
    return CGPointMake(x, y);
}

#pragma mark - -- borderColor
-(void)setBorderColor:(UIColor *)borderColor
{
    self.layer.borderColor = borderColor.CGColor;
}
-(UIColor *)borderColor
{
    return [UIColor colorWithCGColor:self.layer.borderColor];
}
#pragma mark - -- borderWidth
-(void)setBorderWidth:(CGFloat)borderWidth
{
    self.layer.borderWidth = borderWidth;
}
-(CGFloat)borderWidth
{
    return self.layer.borderWidth;
}
#pragma mark - -- cornerRadius
-(void)setCornerRadius:(CGFloat)cornerRadius
{
    if (cornerRadius) {
        self.layer.masksToBounds = YES;
    }
    self.layer.cornerRadius = cornerRadius;
}
-(CGFloat)cornerRadius
{
    return self.layer.cornerRadius;
}

#pragma mark - viewController

- (UIViewController *)viewController {
    for (UIView *view = self; view; view = view.superview) {
        UIResponder *nextResponder = [view nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)nextResponder;
        }
    }
    return nil;
}

+ (instancetype)loadFromNib {
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil] lastObject];
}

-(CAGradientLayer *)addGradientLayerWithStart:(CGPoint)start end:(CGPoint)end colors:(NSArray *)colors {
    self.backgroundColor = nil;
    CAGradientLayer * gradientLayer = [CAGradientLayer layer];
    gradientLayer.frame = self.bounds;
    gradientLayer.colors = colors;
    gradientLayer.startPoint = start;
    gradientLayer.endPoint = end;
    [self.layer addSublayer:gradientLayer];
    return gradientLayer;
}

- (void)addShadowWithColor:(UIColor*)color offset:(CGSize)offset radius:(CGFloat)radius {
    self.layer.masksToBounds = NO;
    self.layer.shadowColor = color.CGColor;
    self.layer.shadowOffset = offset;
    self.layer.shadowRadius = radius;
    self.layer.shadowOpacity = 1;
    self.layer.shouldRasterize = YES;
    self.layer.rasterizationScale = [UIScreen mainScreen].scale;
}

- (void)addShadowWithColor:(UIColor *)theColor {
    [self addShadowWithColor:theColor offset:CGSizeMake(1, 1) radius:3];
}

/** 绘制六边形*/
- (void)drawSexangleWithwWidth:(CGFloat)width {
    
    //在绘制layer之前先把之前添加的layer移除掉，如果不这么做，你就会发现设置多次image 之后，本view的layer上就会有多个子layer，
    [self.layer.sublayers enumerateObjectsUsingBlock:^(CALayer * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [obj removeFromSuperlayer];
    }];
    
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.path = [self getCGPath:width];
    shapeLayer.fillColor = [UIColor clearColor].CGColor;
    
    CAShapeLayer *shapLayer = [CAShapeLayer layer];
    shapLayer.path = [self getCGPath:width];
    self.layer.mask = shapLayer;
    /** 将shapeLayer添加到shapLayer上方*/
    [self.layer insertSublayer:shapeLayer above:shapLayer];
    
}

/** 计算菱形的UIBezierPath*/
- (CGPathRef)getCGPath:(CGFloat)width {
    
    UIBezierPath * path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake((sin(M_1_PI / 180 * 60)) * (width / 2), (width / 4))];
    [path addLineToPoint:CGPointMake((width / 2), 0)];
    [path addLineToPoint:CGPointMake(width - ((sin(M_1_PI / 180 * 60)) * (width / 2)), (width / 4))];
    [path addLineToPoint:CGPointMake(width - ((sin(M_1_PI / 180 * 60)) * (width / 2)), (width / 2) + (width / 4))];
    [path addLineToPoint:CGPointMake((width / 2), width)];
    [path addLineToPoint:CGPointMake((sin(M_1_PI / 180 * 60)) * (width / 2), (width / 2) + (width / 4))];
    [path closePath];
    return path.CGPath;
    
}
@end
