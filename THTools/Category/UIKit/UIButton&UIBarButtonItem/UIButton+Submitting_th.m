//
//  UIButton+Submitting_th.m
//  THToolsDemo
//
//  Created by weixb on 2017/2/16.
//  Copyright © 2017年 weixb. All rights reserved.
//

#import "UIButton+Submitting_th.h"
#import <objc/runtime.h>

@interface UIButton ()

@property(nonatomic, strong) UIView *th_modalView;
@property(nonatomic, strong) UIActivityIndicatorView *th_spinnerView;
@property(nonatomic, strong) UILabel *th_spinnerTitleLabel;

@end

@implementation UIButton (Submitting_th)

- (void)th_beginSubmitting:(NSString *)title {
    [self th_endSubmitting];
    
    self.th_submitting = @YES;
    self.hidden = YES;
    
    self.th_modalView = [[UIView alloc] initWithFrame:self.frame];
    self.th_modalView.backgroundColor =
    [self.backgroundColor colorWithAlphaComponent:0.6];
    self.th_modalView.layer.cornerRadius = self.layer.cornerRadius;
    self.th_modalView.layer.borderWidth = self.layer.borderWidth;
    self.th_modalView.layer.borderColor = self.layer.borderColor;
    
    CGRect viewBounds = self.th_modalView.bounds;
    self.th_spinnerView = [[UIActivityIndicatorView alloc]
                            initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    self.th_spinnerView.tintColor = self.titleLabel.textColor;
    
    CGRect spinnerViewBounds = self.th_spinnerView.bounds;
    self.th_spinnerView.frame = CGRectMake(
                                            15, viewBounds.size.height / 2 - spinnerViewBounds.size.height / 2,
                                            spinnerViewBounds.size.width, spinnerViewBounds.size.height);
    self.th_spinnerTitleLabel = [[UILabel alloc] initWithFrame:viewBounds];
    self.th_spinnerTitleLabel.textAlignment = NSTextAlignmentCenter;
    self.th_spinnerTitleLabel.text = title;
    self.th_spinnerTitleLabel.font = self.titleLabel.font;
    self.th_spinnerTitleLabel.textColor = self.titleLabel.textColor;
    [self.th_modalView addSubview:self.th_spinnerView];
    [self.th_modalView addSubview:self.th_spinnerTitleLabel];
    [self.superview addSubview:self.th_modalView];
    [self.th_spinnerView startAnimating];
}

- (void)th_endSubmitting {
    if (!self.isThSubmitting.boolValue) {
        return;
    }
    
    self.th_submitting = @NO;
    self.hidden = NO;
    
    [self.th_modalView removeFromSuperview];
    self.th_modalView = nil;
    self.th_spinnerView = nil;
    self.th_spinnerTitleLabel = nil;
}

- (NSNumber *)isThSubmitting {
    return objc_getAssociatedObject(self, @selector(setTh_submitting:));
}

- (void)setTh_submitting:(NSNumber *)submitting {
    objc_setAssociatedObject(self, @selector(setTh_submitting:), submitting, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
}

- (UIActivityIndicatorView *)th_spinnerView {
    return objc_getAssociatedObject(self, @selector(setTh_spinnerView:));
}

- (void)setTh_spinnerView:(UIActivityIndicatorView *)spinnerView {
    objc_setAssociatedObject(self, @selector(setTh_spinnerView:), spinnerView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIView *)th_modalView {
    return objc_getAssociatedObject(self, @selector(setTh_modalView:));
    
}

- (void)setTh_modalView:(UIView *)modalView {
    objc_setAssociatedObject(self, @selector(setTh_modalView:), modalView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UILabel *)th_spinnerTitleLabel {
    return objc_getAssociatedObject(self, @selector(setTh_spinnerTitleLabel:));
}

- (void)setTh_spinnerTitleLabel:(UILabel *)spinnerTitleLabel {
    objc_setAssociatedObject(self, @selector(setTh_spinnerTitleLabel:), spinnerTitleLabel, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
