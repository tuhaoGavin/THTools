//
//  UIScrollView+Addition_th.h
//  THToolsDemo
//
//  Created by 涂浩 on 2017/2/16.
//  Copyright © 2017年 TuHao. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger, JKScrollDirection) {
    JKScrollDirectionUp,
    JKScrollDirectionDown,
    JKScrollDirectionLeft,
    JKScrollDirectionRight,
    JKScrollDirectionWTF
};

@interface UIScrollView (Addition_th)

@property(nonatomic) CGFloat th_contentWidth;
@property(nonatomic) CGFloat th_contentHeight;
@property(nonatomic) CGFloat th_contentOffsetX;
@property(nonatomic) CGFloat th_contentOffsetY;

- (CGPoint)th_topContentOffset;
- (CGPoint)th_bottomContentOffset;
- (CGPoint)th_leftContentOffset;
- (CGPoint)th_rightContentOffset;

- (JKScrollDirection)th_ScrollDirection;

- (BOOL)th_isScrolledToTop;
- (BOOL)th_isScrolledToBottom;
- (BOOL)th_isScrolledToLeft;
- (BOOL)th_isScrolledToRight;
- (void)th_scrollToTopAnimated:(BOOL)animated;
- (void)th_scrollToBottomAnimated:(BOOL)animated;
- (void)th_scrollToLeftAnimated:(BOOL)animated;
- (void)th_scrollToRightAnimated:(BOOL)animated;

- (NSUInteger)th_verticalPageIndex;
- (NSUInteger)th_horizontalPageIndex;

- (void)th_scrollToVerticalPageIndex:(NSUInteger)pageIndex animated:(BOOL)animated;
- (void)th_scrollToHorizontalPageIndex:(NSUInteger)pageIndex animated:(BOOL)animated;

@end
