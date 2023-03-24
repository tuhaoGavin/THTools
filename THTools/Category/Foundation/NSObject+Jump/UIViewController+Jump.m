//
//  UIViewController+Jump.m
//  Single
//
//  Created by 涂浩 on 2019/12/26.
//  Copyright © 2019 lobochat. All rights reserved.
//

#import "UIViewController+Jump.h"

@implementation UIViewController (Jump)

-(void)th_pushToVC:(UIViewController *)viewController {
    [self.navigationController pushViewController:viewController animated:YES];
}

- (void)th_presentToVC:(nonnull UIViewController *)viewController {
    viewController.modalPresentationStyle = UIModalPresentationOverFullScreen;
    [self presentViewController:viewController animated:YES completion:nil];
}

- (void)th_pop {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)th_dismiss {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)th_popToRootVC {
    [self.navigationController popToRootViewControllerAnimated:NO];
}

- (void)th_addTransitionAnimationWithType:(CATransitionType)type subType:(CATransitionSubtype)subType timingFunctionName:(CAMediaTimingFunctionName)timingFunctionName duration:(CFTimeInterval)duration {
    CATransition *animation = [CATransition animation];
    animation.type = type;
    animation.subtype = subType;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:timingFunctionName];
    animation.duration = duration;
    [self.view.window.layer addAnimation:animation forKey:nil];
}



@end
