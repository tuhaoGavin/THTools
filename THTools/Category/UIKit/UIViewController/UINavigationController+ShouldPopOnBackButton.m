//
//  UINavigationController+ShouldPopOnBackButton.m
//  Single
//
//  Created by 涂浩 on 2019/12/24.
//  Copyright © 2019 lobochat. All rights reserved.
//

#import "UINavigationController+ShouldPopOnBackButton.h"
#import "UIViewController+BackButtonHandler.h"
#import "SwizzlingDefine.h"

@implementation UINavigationController (ShouldPopOnBackButton)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        swizzling_exchangeMethod([self class], @selector(navigationBar:shouldPopItem:), @selector(swizzling_navigationBar:shouldPopItem:));
    });
}

- (BOOL)swizzling_navigationBar:(UINavigationBar *)navigationBar shouldPopItem:(UINavigationItem*)item {
    if([self.viewControllers count] < [navigationBar.items count]) {
        return YES;
    }
    
    BOOL shouldPop = [self swizzling_navigationBar:navigationBar shouldPopItem:item];
    UIViewController* vc = [self topViewController];
    if([vc respondsToSelector:@selector(navigationShouldPopOnBackButton)]) {
        shouldPop = [vc navigationShouldPopOnBackButton];
    }
    
    if(shouldPop) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [self popViewControllerAnimated:YES];
        });
    } else {
        // Workaround for iOS7.1. Thanks to @boliva - http://stackoverflow.com/posts/comments /34452906
        for(UIView *subview in [navigationBar subviews]) {
            if(subview.alpha < 1.) {
                [UIView animateWithDuration:.25 animations:^{  
                    subview.alpha = 1.;  
                }];  
            }  
        }  
    }  
    
    return NO;  
}



@end
