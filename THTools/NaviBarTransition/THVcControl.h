//
//  THVcControl.h
//  TestDemo
//
//  Created by 涂浩 on 2021/11/25.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface THVcControl : NSObject

+ (UIViewController *)getCurrentVC;

+(UIViewController *)getCurrentVCFrom:(UIViewController *)rootVC;

@end

NS_ASSUME_NONNULL_END
