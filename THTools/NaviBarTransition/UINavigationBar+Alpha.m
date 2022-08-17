//
//  UINavigationBar+Alpha.m
//  CodeStandardsDemo
//
//  Created by 涂浩 on 2020/1/11.
//  Copyright © 2020 太合音乐. All rights reserved.
//

#import "UINavigationBar+Alpha.h"
#import "UIImage+Color_th.h"
#import "SwizzlingDefine.h"
#import "UIImage+Util_th.h"

@interface UINavigationBar ()

@property (nonatomic, assign) CGFloat barAlpha; //Navibar透明度

@end

@implementation UINavigationBar (Alpha)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        swizzling_exchangeMethod([self class], @selector(setBarTintColor:), @selector(swizzling_setBarTintColor:));
    });
}

- (void)swizzling_setBarTintColor:(UIColor *)barTintColor {
    [self swizzling_setBarTintColor:barTintColor];
    [self setBarAlpha:self.barAlpha];
}

-(void)setBarAlpha:(CGFloat)barAlpha {
    barAlpha = barAlpha > 1 ? 1 : barAlpha;
    objc_setAssociatedObject(self, @selector(barAlpha), @(barAlpha), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    UIColor * color = self.barTintColor ? self.barTintColor : UIColor.whiteColor;
    if (@available(iOS 13.0, *)) {
        UINavigationBarAppearance *barApp = self.standardAppearance ?: [UINavigationBarAppearance new];
        [barApp setBackgroundImage:[UIImage th_imageWithColor:[color colorWithAlphaComponent:barAlpha]]];
        [barApp setShadowColor:nil];
        if (self.hidesShadow) {
            [barApp setShadowImage:[UIImage new]];
        } else {
            [barApp setShadowImage:[[UIImage th_imageWithColor:[UIColor colorWithWhite:0.5 alpha:barAlpha/2.5]] th_changeImageSize:CGSizeMake([UIScreen mainScreen].bounds.size.width, 0.5)]];
        }
        barApp.backgroundEffect = nil;
        self.scrollEdgeAppearance = barApp;
        self.standardAppearance = barApp;
    } else {
        [self setBackgroundImage:[UIImage th_imageWithColor:[color colorWithAlphaComponent:barAlpha]] forBarMetrics:UIBarMetricsDefault];
        if (self.hidesShadow) {
            [self setShadowImage:[UIImage new]];
        } else {
            [self setShadowImage:[[UIImage th_imageWithColor:[UIColor colorWithWhite:0.5 alpha:barAlpha/2.5]] th_changeImageSize:CGSizeMake([UIScreen mainScreen].bounds.size.width, 0.5)]];
        }
    }
    
}

- (CGFloat)barAlpha {
    return [objc_getAssociatedObject(self, _cmd) floatValue];
}

-(BOOL)hidesShadow {
    return [objc_getAssociatedObject(self, _cmd) boolValue];
}

-(void)setHidesShadow:(BOOL)hidesShadow {
    objc_setAssociatedObject(self, @selector(hidesShadow), @(hidesShadow), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self setBarAlpha:self.barAlpha];
}



@end
