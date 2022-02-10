//
//  NSObject+Jump.h
//  Single
//
//  Created by 涂浩 on 2019/12/26.
//  Copyright © 2019 lobochat. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol THJumpDelegate <NSObject>

- (void)th_pushToVC:(UIViewController *)viewController;

- (void)th_presentToVC:(UIViewController *)viewController;

- (void)th_pop;

- (void)th_dismiss;

- (void)th_popToRootVC;

@end


@interface NSObject (Jump)

@property (nonatomic, strong) UIViewController <THJumpDelegate>* jumpDelegate;


@end

NS_ASSUME_NONNULL_END
