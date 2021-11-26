//
//  UIScrollView+Pages_th.h
//  THToolsDemo
//
//  Created by 涂浩 on 2017/2/16.
//  Copyright © 2017年 TuHao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIScrollView (Pages_th)

- (NSInteger)th_pages;
- (NSInteger)th_currentPage;
- (CGFloat)th_scrollPercent;

- (CGFloat)th_pagesY;
- (CGFloat)th_pagesX;
- (CGFloat)th_currentPageY;
- (CGFloat)th_currentPageX;
- (void)th_setPageY:(CGFloat)page;
- (void)th_setPageX:(CGFloat)page;
- (void)th_setPageY:(CGFloat)page animated:(BOOL)animated;
- (void)th_setPageX:(CGFloat)page animated:(BOOL)animated;

@end
