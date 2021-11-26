//
//  TestVC.m
//  THToolsDemo
//
//  Created by 涂浩 on 2021/11/25.
//

#import "TestVC.h"
#import "THTools.h"
#import "THNaviBarTransition.h"
#import "TestAlert.h"

@interface TestVC ()<BackButtonHandlerProtocol>

@end

@implementation TestVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"带导航栏";
    UIViewController * vc = [THVcControl getCurrentVC];
    NSLog(@"%@", vc);
}

- (BOOL)navigationShouldPopOnBackButton {
    [self th_addTransitionAnimationWithType:@"pageUnCurl" subType:kCATransitionFromLeft timingFunctionName:kCAMediaTimingFunctionEaseIn duration:1];
    [self.navigationController popViewControllerAnimated:NO];
    return NO;
}

@end
