//
//  UIViewController+BackButtonHandler.h
//  Single
//
//  Created by 涂浩 on 2019/12/24.
//  Copyright © 2019 lobochat. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol BackButtonHandlerProtocol <NSObject>
@optional
// Override this method in UIViewController derived class to handle 'Back' button click
-(BOOL)navigationShouldPopOnBackButton;
@end


@interface UIViewController (BackButtonHandler) <BackButtonHandlerProtocol>

@end
