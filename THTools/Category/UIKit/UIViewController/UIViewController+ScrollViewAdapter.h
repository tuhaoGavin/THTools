//
//  UIViewController+ScrollViewAdapter.h
//  Single
//
//  Created by 涂浩 on 2019/12/24.
//  Copyright © 2019 lobochat. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (ScrollViewAdapter)


/**
 * 不需要系统自动调整tableViewInset
 * @param scrollView 不需要自动调整Inset的scrollView
 */
- (void)setScrollViewInsetAdjustmentNever:(UIScrollView *)scrollView;

@end

NS_ASSUME_NONNULL_END
