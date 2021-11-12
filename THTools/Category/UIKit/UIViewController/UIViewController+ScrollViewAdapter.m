//
//  UIViewController+ScrollViewAdapter.m
//  Single
//
//  Created by 涂浩 on 2019/12/24.
//  Copyright © 2019 lobochat. All rights reserved.
//

#import "UIViewController+ScrollViewAdapter.h"

@implementation UIViewController (ScrollViewAdapter)

-(void)setScrollViewInsetAdjustmentNever:(UIScrollView *)scrollView {
    if (@available(iOS 11.0, *)) {
        scrollView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    } else {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
}

@end
