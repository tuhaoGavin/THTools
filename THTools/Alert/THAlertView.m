//
//  THAlertView.m
//  Single
//
//  Created by 涂浩 on 2020/1/17.
//  Copyright © 2020 lobochat. All rights reserved.
//

#import "THAlertView.h"
#if __has_include(<Masonry.h>)
#import <Masonry.h>
#else
#import "Masonry.h"
#endif

@interface THAlertView ()<UIGestureRecognizerDelegate>

@property (nonatomic, strong) UIView *backgroundView;
@property (nonatomic, strong) UITapGestureRecognizer *singleTap;

@end

@implementation THAlertView

+ (instancetype)alertWithWidth:(CGFloat)width height:(CGFloat)height position:(THAlertViewPosition)position {
    return [[self alloc] initWithWidth:width height:height position:position];
}

- (instancetype)initWithWidth:(CGFloat)width height:(CGFloat)height position:(THAlertViewPosition)position {
    if (self = [super init]) {
        _alertWidth = width;
        _alertHeight = height;
        _position = position;
        [self th_setupDefaultConfig];
    }
    return self;
}

+ (instancetype)loadNibWithWidth:(CGFloat)width height:(CGFloat)height position:(THAlertViewPosition)position {
    THAlertView * alert = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil] lastObject];
    alert.alertWidth = width;
    alert.alertHeight = height;
    alert.position = position;
    return alert;
}

- (instancetype)initWithCoder:(NSCoder *)coder {
    if (self = [super initWithCoder:coder]) {
        [self th_setupDefaultConfig];
    }
    return self;
}

- (void)th_setupDefaultConfig {
    _alertOffSet = CGPointZero;
    _maskColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.4];
    _backgoundTapDismissEnable = YES;
    _animation = YES;
    _bounce = YES;
}

- (void)show {
    //默认添加在window上
    UIWindow * window = [UIApplication sharedApplication].keyWindow;
    [self showInView:window];
}

- (void)showInView:(UIView *)superView {
    [superView addSubview:self.backgroundView];
    self.backgroundView.frame = superView.bounds;
    [self.backgroundView addSubview:self];
    
    [self th_setupDefaultLayout];
    [self th_showAnimation];
    [self th_addSingleTapGesture];
}

-(void)hide {
    CGFloat animateDuration = _animation ? 0.25 : 0;
    [UIView animateWithDuration:animateDuration animations:^{
        [self th_setupPositionBeforeAnimate];
    } completion:^(BOOL finished) {
        self->_showStatus = NO;
        [self.backgroundView removeFromSuperview];
        self.backgroundView = nil;
    }];
}

- (void)th_setupDefaultLayout{
    switch (_position) {
        case THAlertViewPositionMid:{
            [self mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.width.mas_equalTo(_alertWidth);
                make.height.mas_equalTo(_alertHeight);
                make.centerX.offset(_alertOffSet.x);
                make.centerY.offset(_alertOffSet.y);
            }];
            break;
        }
        case THAlertViewPositionTop:{
            [self mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.width.mas_equalTo(_alertWidth);
                make.height.mas_equalTo(_alertHeight);
                make.centerX.offset(_alertOffSet.x);
                make.top.offset(_alertOffSet.y);
            }];
            break;
        }
        case THAlertViewPositionBottom:{
            [self mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.width.mas_equalTo(_alertWidth);
                make.height.mas_equalTo(_alertHeight);
                make.centerX.offset(_alertOffSet.x);
                make.bottom.offset(_alertOffSet.y);
            }];
            break;
        }
        default:
            break;
    }
}

-(void)th_showAnimation {
    //开始动画前的位置
    [self th_setupPositionBeforeAnimate];
    
    if (!_animation) {
        _bounce = NO;
    }
    CGFloat animateDuration = _animation ? 0.25 : 0;
    
    [UIView animateWithDuration:animateDuration animations:^{
        self.backgroundView.alpha = 1.0;
        self.alpha = 1.0;
        if (!self.bounce) {
            self.transform = CGAffineTransformIdentity;
        }else {
            switch (self.position) {
                case THAlertViewPositionMid:
                    self.transform = CGAffineTransformMakeScale(1.05, 1.05);
                    break;
                case THAlertViewPositionTop:{
                    self.transform = CGAffineTransformMakeTranslation(0, 10.0);
                    break;
                }
                case THAlertViewPositionBottom:{
                    self.transform = CGAffineTransformMakeTranslation(0, -10.0);
                    break;
                }
                default:
                    break;
            }
        }
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.2 animations:^{
            self->_showStatus = YES;
            self.transform = CGAffineTransformIdentity;
        } completion:nil];
    }];
}

- (void)th_setupPositionBeforeAnimate {
    _backgroundView.alpha = 0.0;
    self.alpha = 0.0;
    switch (_position) {
        case THAlertViewPositionMid:{
            self.transform = CGAffineTransformMakeScale(0.5, 0.5);
            break;
        }
        case THAlertViewPositionTop:{
            self.transform = CGAffineTransformMakeTranslation(0, -_alertHeight);
            break;
        }
        case THAlertViewPositionBottom:{
            self.transform = CGAffineTransformMakeTranslation(0, _alertHeight);
            break;
        }
        default:
            break;
    }
}

- (void)th_addSingleTapGesture
{
    _singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hide)];
    _singleTap.enabled = _backgoundTapDismissEnable;
    _singleTap.delegate = self;
    [self.backgroundView addGestureRecognizer:_singleTap];
}

- (void)setBackgoundTapDismissEnable:(BOOL)backgoundTapDismissEnable
{
    _backgoundTapDismissEnable = backgoundTapDismissEnable;
    _singleTap.enabled = backgoundTapDismissEnable;
}

#pragma mark - UIGestureRecognizerDelegate
-(BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch{
    if ([touch.view isDescendantOfView:self]) {
        return NO;
    }
    return YES;
}


#pragma mark --Getter
-(UIView *)backgroundView {
    if (!_backgroundView) {
        _backgroundView = [[UIView alloc] init];
        _backgroundView.backgroundColor = self.maskColor;
    }
    return _backgroundView;
}

-(void)setMaskColor:(UIColor *)maskColor {
    _maskColor = maskColor;
    self.backgroundView.backgroundColor = _maskColor;
}
@end
