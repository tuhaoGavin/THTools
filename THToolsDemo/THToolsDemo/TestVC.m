//
//  TestVC.m
//  THToolsDemo
//
//  Created by 涂浩 on 2021/11/25.
//

#import "TestVC.h"
#import <THTools.h>
#import <THNaviBarTransition.h>
#import <Masonry.h>
#import "TestAlert.h"

@interface TestVC ()<BackButtonHandlerProtocol>
@property (nonatomic, strong) UIButton * alertBtn;

@end

@implementation TestVC

- (void)viewDidLoad {
    [super viewDidLoad];
    UIViewController * vc = [THVcControl getCurrentVC];
    NSLog(@"%@", vc);
    
    [self createUI];
}

- (void)createUI {
    self.title = @"带导航栏";
    
    [self.view addSubview:self.alertBtn];
    
    [self.alertBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_offset(0);
    }];
    
    [self.view layoutIfNeeded];
    [self.alertBtn th_setImagePosition:THImagePositionTop spacing:20];
    [self.alertBtn.imageView th_reflect];
}

/** 展示自定义弹窗 */
- (void)showAlert {
    TestAlert * alert = [TestAlert alertWithPosition:THAlertViewPositionMid];
    [alert show];
}

#pragma mark - BackButtonHandlerProtocol
- (BOOL)navigationShouldPopOnBackButton {
    [self th_addTransitionAnimationWithType:@"pageUnCurl" subType:kCATransitionFromLeft timingFunctionName:kCAMediaTimingFunctionEaseIn duration:1];
    [self.navigationController popViewControllerAnimated:NO];
    return NO;
}

#pragma mark - Getter
- (UIButton *)alertBtn {
    if (!_alertBtn) {
        _alertBtn = UIButton.th_create()
        .th_title(@"全局弹窗")
        .th_titleColor(UIColor.blackColor)
        .th_image([UIImage imageNamed:@"ico_success"])
        .th_titleFont([UIFont systemFontOfSize:25 weight:UIFontWeightBold]);
        __weak typeof(self) weakSelf = self;
        [_alertBtn th_addActionHandler:^(NSInteger tag) {
            [weakSelf showAlert];
        }];
    }
    return _alertBtn;
}

@end
