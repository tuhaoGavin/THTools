//
//  UIViewController+Swizzling.m
//  LongGuanJia
//
//  Created by Qi on 2021/4/28.
//  Copyright © 2021 waging. All rights reserved.
//

#import "UIViewController+Swizzling.h"
#import "SwizzlingDefine.h"
#import "UINavigationBar+Alpha.h"
#import "THAppMacro.h"

@interface UIViewController ()
@property (nonatomic, assign) CGFloat defaultAlphaForNaviBar; //Navibar默认透明度
@end

@implementation UIViewController (Swizzling)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        swizzling_exchangeMethod([UIViewController class], @selector(initWithNibName:bundle:), @selector(swizzling_initWithNibName:bundle:));
        swizzling_exchangeMethod([UIViewController class], @selector(viewDidLoad), @selector(swizzling_viewDidLoad));
        swizzling_exchangeMethod([UIViewController class], @selector(viewWillAppear:), @selector(swizzling_viewWillAppear:));
        swizzling_exchangeMethod([UIViewController class], @selector(viewWillDisappear:), @selector(swizzling_viewWillDisappear:));
    });
}


#pragma mark - InitWithNibName:bundle:
//如果希望vchidesBottomBarWhenPushed为NO的话，请在vc init方法之后调用vc.hidesBottomBarWhenPushed = NO;
- (instancetype)swizzling_initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    id instance = [self swizzling_initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (instance) {
        self.hidesBottomBarWhenPushed = YES;
    }
    return instance;
}

- (void)swizzling_viewDidLoad {
    self.defaultAlphaForNaviBar = 1.0;
    NSString * className = NSStringFromClass(self.class);
    if (![className containsString:@"UI"] &&
        ![className containsString:@"PU"]) {
        if (!self.view.backgroundColor) {
            self.view.backgroundColor = [UIColor whiteColor];
        }
    }
    [self swizzling_viewDidLoad];
}

- (void)swizzling_viewWillAppear:(BOOL)animated {
    
    if (self.isUseClearBar) {
        [self setAlphaForNaviBar:0];
    } else {
        [self setAlphaForNaviBar:self.defaultAlphaForNaviBar];
    }
    if (![NSStringFromClass(self.class) containsString:@"UI"] &&
        ![NSStringFromClass(self.class) containsString:@"PU"]) {
        NSLog(@"currentVcIs:%@", self.class);
    }
    [self swizzling_viewWillAppear:animated];
}

- (void)swizzling_viewWillDisappear:(BOOL)animated {
    self.isUseClearBar = NO;
    [self swizzling_viewWillDisappear:animated];
}

#pragma mark - 公共方法
-(void)setNaviBarTintColor:(UIColor *)tintColor titleColor:(UIColor *)titleColor {
    if (self.navigationController) {
        if (@available(iOS 13.0, *)) {
            UINavigationBarAppearance *barApp = self.navigationController.navigationBar.standardAppearance ?: [UINavigationBarAppearance new];
            barApp.titleTextAttributes = @{NSForegroundColorAttributeName : titleColor};
            self.navigationController.navigationBar.scrollEdgeAppearance = barApp;
            self.navigationController.navigationBar.standardAppearance = barApp;
        } else {
            self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName : titleColor};
        }
        self.navigationController.navigationBar.tintColor = tintColor;
    }
}

- (void)setAlphaForNaviBar:(CGFloat)alpha {
    // 导航栏背景透明度设置,默认alpha为1，translucent为NO
    self.navigationController.navigationBar.translucent = (alpha < 1);
    [self.navigationController.navigationBar setBarAlpha:alpha];
    if (alpha < 1) {
        //避免透明导航朗alpha为变化至1时导航栏translucent变为no产生的布局错乱
        self.extendedLayoutIncludesOpaqueBars = YES;
    }
    self.defaultAlphaForNaviBar = alpha;
}


-(NSString *)backImgName {
    return objc_getAssociatedObject(self, _cmd);
}

-(void)setBackImgName:(NSString *)backImgName{
    objc_setAssociatedObject(self, @selector(backImgName), backImgName, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    UIImage * buttonNormal = [[UIImage imageNamed:backImgName] imageWithRenderingMode:UIImageRenderingModeAutomatic];
    if (@available(iOS 13.0, *)) {
        UINavigationBarAppearance * barApp = self.navigationController.navigationBar.standardAppearance ?: [UINavigationBarAppearance new];
        [barApp setBackIndicatorImage:buttonNormal transitionMaskImage:buttonNormal];
        self.navigationController.navigationBar.scrollEdgeAppearance = barApp;
        self.navigationController.navigationBar.standardAppearance = barApp;
    } else {
        [self.navigationController.navigationBar setBackIndicatorImage:buttonNormal];
        [self.navigationController.navigationBar setBackIndicatorTransitionMaskImage:buttonNormal];
    }
    UIBarButtonItem * backItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
    self.navigationItem.backBarButtonItem = backItem;
}

-(BOOL)isUseClearBar {
    return [objc_getAssociatedObject(self, _cmd) boolValue];
}

-(void)setIsUseClearBar:(BOOL)isUseClearBar{
    objc_setAssociatedObject(self, @selector(isUseClearBar), @(isUseClearBar), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (CGFloat)defaultAlphaForNaviBar {
    return [objc_getAssociatedObject(self, _cmd) floatValue];
}

-(void)setDefaultAlphaForNaviBar:(CGFloat)defaultAlphaForNaviBar {
    objc_setAssociatedObject(self, @selector(defaultAlphaForNaviBar), @(defaultAlphaForNaviBar), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
