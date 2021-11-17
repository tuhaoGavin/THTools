//
//  TestAlert.h
//  THToolsDemo
//
//  Created by Qi on 2021/11/16.
//

#import <UIKit/UIKit.h>
#import <THAlertView.h>

NS_ASSUME_NONNULL_BEGIN

@interface TestAlert : THAlertView

+ (instancetype)alertWithPosition:(THAlertViewPosition)position;

@end

NS_ASSUME_NONNULL_END
