//
//  UIScrollView+Addition_th.m
//  THToolsDemo
//
//  Created by weixb on 2017/2/16.
//  Copyright © 2017年 weixb. All rights reserved.
//

#import "UIScrollView+Addition_th.h"

@implementation UIScrollView (Addition_th)
//frame
- (CGFloat)th_contentWidth {
    return self.contentSize.width;
}
- (void)setTh_contentWidth:(CGFloat)width {
    self.contentSize = CGSizeMake(width, self.frame.size.height);
}
- (CGFloat)th_contentHeight {
    return self.contentSize.height;
}
- (void)setTh_contentHeight:(CGFloat)height {
    self.contentSize = CGSizeMake(self.frame.size.width, height);
}
- (CGFloat)th_contentOffsetX {
    return self.contentOffset.x;
}
- (void)setTh_contentOffsetX:(CGFloat)x {
    self.contentOffset = CGPointMake(x, self.contentOffset.y);
}
- (CGFloat)th_contentOffsetY {
    return self.contentOffset.y;
}
- (void)setTh_contentOffsetY:(CGFloat)y {
    self.contentOffset = CGPointMake(self.contentOffset.x, y);
}
//


- (CGPoint)th_topContentOffset
{
    return CGPointMake(0.0f, -self.contentInset.top);
}
- (CGPoint)th_bottomContentOffset
{
    return CGPointMake(0.0f, self.contentSize.height + self.contentInset.bottom - self.bounds.size.height);
}
- (CGPoint)th_leftContentOffset
{
    return CGPointMake(-self.contentInset.left, 0.0f);
}
- (CGPoint)th_rightContentOffset
{
    return CGPointMake(self.contentSize.width + self.contentInset.right - self.bounds.size.width, 0.0f);
}
- (JKScrollDirection)th_ScrollDirection
{
    JKScrollDirection direction;
    
    if ([self.panGestureRecognizer translationInView:self.superview].y > 0.0f)
    {
        direction = JKScrollDirectionUp;
    }
    else if ([self.panGestureRecognizer translationInView:self.superview].y < 0.0f)
    {
        direction = JKScrollDirectionDown;
    }
    else if ([self.panGestureRecognizer translationInView:self].x < 0.0f)
    {
        direction = JKScrollDirectionLeft;
    }
    else if ([self.panGestureRecognizer translationInView:self].x > 0.0f)
    {
        direction = JKScrollDirectionRight;
    }
    else
    {
        direction = JKScrollDirectionWTF;
    }
    
    return direction;
}
- (BOOL)th_isScrolledToTop
{
    return self.contentOffset.y <= [self th_topContentOffset].y;
}
- (BOOL)th_isScrolledToBottom
{
    return self.contentOffset.y >= [self th_bottomContentOffset].y;
}
- (BOOL)th_isScrolledToLeft
{
    return self.contentOffset.x <= [self th_leftContentOffset].x;
}
- (BOOL)th_isScrolledToRight
{
    return self.contentOffset.x >= [self th_rightContentOffset].x;
}
- (void)th_scrollToTopAnimated:(BOOL)animated
{
    [self setContentOffset:[self th_topContentOffset] animated:animated];
}
- (void)th_scrollToBottomAnimated:(BOOL)animated
{
    [self setContentOffset:[self th_bottomContentOffset] animated:animated];
}
- (void)th_scrollToLeftAnimated:(BOOL)animated
{
    [self setContentOffset:[self th_leftContentOffset] animated:animated];
}
- (void)th_scrollToRightAnimated:(BOOL)animated
{
    [self setContentOffset:[self th_rightContentOffset] animated:animated];
}
- (NSUInteger)th_verticalPageIndex
{
    return (self.contentOffset.y + (self.frame.size.height * 0.5f)) / self.frame.size.height;
}
- (NSUInteger)th_horizontalPageIndex
{
    return (self.contentOffset.x + (self.frame.size.width * 0.5f)) / self.frame.size.width;
}
- (void)th_scrollToVerticalPageIndex:(NSUInteger)pageIndex animated:(BOOL)animated
{
    [self setContentOffset:CGPointMake(0.0f, self.frame.size.height * pageIndex) animated:animated];
}
- (void)th_scrollToHorizontalPageIndex:(NSUInteger)pageIndex animated:(BOOL)animated
{
    [self setContentOffset:CGPointMake(self.frame.size.width * pageIndex, 0.0f) animated:animated];
}

@end
