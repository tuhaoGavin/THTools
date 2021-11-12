//
//  UIBarButtonItem+Badge_th.m
//  THToolsDemo
//
//  Created by weixb on 2017/2/16.
//  Copyright © 2017年 weixb. All rights reserved.
//

#import "UIBarButtonItem+Badge_th.h"
#import <objc/runtime.h>

NSString const *th_UIBarButtonItem_badgeKey = @"th_UIBarButtonItem_badgeKey";

NSString const *th_UIBarButtonItem_badgeBGColorKey = @"th_UIBarButtonItem_badgeBGColorKey";
NSString const *th_UIBarButtonItem_badgeTextColorKey = @"th_UIBarButtonItem_badgeTextColorKey";
NSString const *th_UIBarButtonItem_badgeFontKey = @"th_UIBarButtonItem_badgeFontKey";
NSString const *th_UIBarButtonItem_badgePaddingKey = @"th_UIBarButtonItem_badgePaddingKey";
NSString const *th_UIBarButtonItem_badgeMinSizeKey = @"th_UIBarButtonItem_badgeMinSizeKey";
NSString const *th_UIBarButtonItem_badgeOriginXKey = @"th_UIBarButtonItem_badgeOriginXKey";
NSString const *th_UIBarButtonItem_badgeOriginYKey = @"th_UIBarButtonItem_badgeOriginYKey";
NSString const *th_UIBarButtonItem_shouldHideBadgeAtZeroKey = @"th_UIBarButtonItem_shouldHideBadgeAtZeroKey";
NSString const *th_UIBarButtonItem_shouldAnimateBadgeKey = @"th_UIBarButtonItem_shouldAnimateBadgeKey";
NSString const *th_UIBarButtonItem_badgeValueKey = @"th_UIBarButtonItem_badgeValueKey";

@implementation UIBarButtonItem (Badge_th)

@dynamic th_badgeValue, th_badgeBGColor, th_badgeTextColor, th_badgeFont;
@dynamic th_badgePadding, th_badgeMinSize, th_badgeOriginX, th_badgeOriginY;
@dynamic th_shouldHideBadgeAtZero, th_shouldAnimateBadge;

- (void)th_badgeInit
{
    UIView *superview = nil;
    CGFloat defaultOriginX = 0;
    if (self.customView) {
        superview = self.customView;
        defaultOriginX = superview.frame.size.width - self.th_badge.frame.size.width/2;
        // Avoids badge to be clipped when animating its scale
        superview.clipsToBounds = NO;
    } else if ([self respondsToSelector:@selector(view)] && [(id)self view]) {
        superview = [(id)self view];
        defaultOriginX = superview.frame.size.width - self.th_badge.frame.size.width;
    }
    [superview addSubview:self.th_badge];
    
    // Default design initialization
    self.th_badgeBGColor   = [UIColor redColor];
    self.th_badgeTextColor = [UIColor whiteColor];
    self.th_badgeFont      = [UIFont systemFontOfSize:12.0];
    self.th_badgePadding   = 6;
    self.th_badgeMinSize   = 8;
    self.th_badgeOriginX   = defaultOriginX;
    self.th_badgeOriginY   = -4;
    self.th_shouldHideBadgeAtZero = YES;
    self.th_shouldAnimateBadge = YES;
}

#pragma mark - Utility methods

// Handle badge display when its properties have been changed (color, font, ...)
- (void)th_refreshBadge
{
    // Change new attributes
    self.th_badge.textColor        = self.th_badgeTextColor;
    self.th_badge.backgroundColor  = self.th_badgeBGColor;
    self.th_badge.font             = self.th_badgeFont;
    
    if (!self.th_badgeValue || [self.th_badgeValue isEqualToString:@""] || ([self.th_badgeValue isEqualToString:@"0"] && self.th_shouldHideBadgeAtZero)) {
        self.th_badge.hidden = YES;
    } else {
        self.th_badge.hidden = NO;
        [self th_updateBadgeValueAnimated:YES];
    }
    
}

- (CGSize)th_badgeExpectedSize
{
    // When the value changes the badge could need to get bigger
    // Calculate expected size to fit new value
    // Use an intermediate label to get expected size thanks to sizeToFit
    // We don't call sizeToFit on the true label to avoid bad display
    UILabel *frameLabel = [self th_duplicateLabel:self.th_badge];
    [frameLabel sizeToFit];
    
    CGSize expectedLabelSize = frameLabel.frame.size;
    return expectedLabelSize;
}

- (void)th_updateBadgeFrame
{
    
    CGSize expectedLabelSize = [self th_badgeExpectedSize];
    
    // Make sure that for small value, the badge will be big enough
    CGFloat minHeight = expectedLabelSize.height;
    
    // Using a const we make sure the badge respect the minimum size
    minHeight = (minHeight < self.th_badgeMinSize) ? self.th_badgeMinSize : expectedLabelSize.height;
    CGFloat minWidth = expectedLabelSize.width;
    CGFloat padding = self.th_badgePadding;
    
    // Using const we make sure the badge doesn't get too smal
    minWidth = (minWidth < minHeight) ? minHeight : expectedLabelSize.width;
    self.th_badge.layer.masksToBounds = YES;
    self.th_badge.frame = CGRectMake(self.th_badgeOriginX, self.th_badgeOriginY, minWidth + padding, minHeight + padding);
    self.th_badge.layer.cornerRadius = (minHeight + padding) / 2;
}

// Handle the badge changing value
- (void)th_updateBadgeValueAnimated:(BOOL)animated
{
    // Bounce animation on badge if value changed and if animation authorized
    if (animated && self.th_shouldAnimateBadge && ![self.th_badge.text isEqualToString:self.th_badgeValue]) {
        CABasicAnimation * animation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
        [animation setFromValue:[NSNumber numberWithFloat:1.5]];
        [animation setToValue:[NSNumber numberWithFloat:1]];
        [animation setDuration:0.2];
        [animation setTimingFunction:[CAMediaTimingFunction functionWithControlPoints:.4f :1.3f :1.f :1.f]];
        [self.th_badge.layer addAnimation:animation forKey:@"bounceAnimation"];
    }
    
    // Set the new value
    self.th_badge.text = self.th_badgeValue;
    
    // Animate the size modification if needed
    if (animated && self.th_shouldAnimateBadge) {
        [UIView animateWithDuration:0.2 animations:^{
            [self th_updateBadgeFrame];
        }];
    } else {
        [self th_updateBadgeFrame];
    }
}

- (UILabel *)th_duplicateLabel:(UILabel *)labelToCopy
{
    UILabel *duplicateLabel = [[UILabel alloc] initWithFrame:labelToCopy.frame];
    duplicateLabel.text = labelToCopy.text;
    duplicateLabel.font = labelToCopy.font;
    
    return duplicateLabel;
}

- (void)th_removeBadge
{
    // Animate badge removal
    [UIView animateWithDuration:0.2 animations:^{
        self.th_badge.transform = CGAffineTransformMakeScale(0, 0);
    } completion:^(BOOL finished) {
        [self.th_badge removeFromSuperview];
        self.th_badge = nil;
    }];
}

#pragma mark - getters/setters
-(UILabel*)th_badge {
    UILabel* lbl = objc_getAssociatedObject(self, &th_UIBarButtonItem_badgeKey);
    if(lbl==nil) {
        lbl = [[UILabel alloc] initWithFrame:CGRectMake(self.th_badgeOriginX, self.th_badgeOriginY, 20, 20)];
        [self setTh_badge:lbl];
        [self th_badgeInit];
        [self.customView addSubview:lbl];
        lbl.textAlignment = NSTextAlignmentCenter;
    }
    return lbl;
}
-(void)setTh_badge:(UILabel *)badgeLabel
{
    objc_setAssociatedObject(self, &th_UIBarButtonItem_badgeKey, badgeLabel, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

// Badge value to be display
-(NSString *)th_badgeValue {
    return objc_getAssociatedObject(self, &th_UIBarButtonItem_badgeValueKey);
}
-(void)setTh_vadgeValue:(NSString *)badgeValue
{
    objc_setAssociatedObject(self, &th_UIBarButtonItem_badgeValueKey, badgeValue, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    // When changing the badge value check if we need to remove the badge
    [self th_updateBadgeValueAnimated:YES];
    [self th_refreshBadge];
}

// Badge background color
-(UIColor *)badgeBGColor {
    return objc_getAssociatedObject(self, &th_UIBarButtonItem_badgeBGColorKey);
}
-(void)setBadgeBGColor:(UIColor *)badgeBGColor
{
    objc_setAssociatedObject(self, &th_UIBarButtonItem_badgeBGColorKey, badgeBGColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    if (self.th_badge) {
        [self th_refreshBadge];
    }
}

// Badge text color
-(UIColor *)badgeTextColor {
    return objc_getAssociatedObject(self, &th_UIBarButtonItem_badgeTextColorKey);
}
-(void)setBadgeTextColor:(UIColor *)badgeTextColor
{
    objc_setAssociatedObject(self, &th_UIBarButtonItem_badgeTextColorKey, badgeTextColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    if (self.th_badge) {
        [self th_refreshBadge];
    }
}

// Badge font
-(UIFont *)badgeFont {
    return objc_getAssociatedObject(self, &th_UIBarButtonItem_badgeFontKey);
}
-(void)setBadgeFont:(UIFont *)badgeFont
{
    objc_setAssociatedObject(self, &th_UIBarButtonItem_badgeFontKey, badgeFont, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    if (self.th_badge) {
        [self th_refreshBadge];
    }
}

// Padding value for the badge
-(CGFloat) badgePadding {
    NSNumber *number = objc_getAssociatedObject(self, &th_UIBarButtonItem_badgePaddingKey);
    return number.floatValue;
}
-(void) setBadgePadding:(CGFloat)badgePadding
{
    NSNumber *number = [NSNumber numberWithDouble:badgePadding];
    objc_setAssociatedObject(self, &th_UIBarButtonItem_badgePaddingKey, number, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    if (self.th_badge) {
        [self th_updateBadgeFrame];
    }
}

// Minimum size badge to small
-(CGFloat)th_badgeMinSize {
    NSNumber *number = objc_getAssociatedObject(self, &th_UIBarButtonItem_badgeMinSizeKey);
    return number.floatValue;
}
-(void) setTh_badgeMinSize:(CGFloat)badgeMinSize
{
    NSNumber *number = [NSNumber numberWithDouble:badgeMinSize];
    objc_setAssociatedObject(self, &th_UIBarButtonItem_badgeMinSizeKey, number, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    if (self.th_badge) {
        [self th_updateBadgeFrame];
    }
}

// Values for offseting the badge over the BarButtonItem you picked
-(CGFloat)th_badgeOriginX {
    NSNumber *number = objc_getAssociatedObject(self, &th_UIBarButtonItem_badgeOriginXKey);
    return number.floatValue;
}
-(void) setTh_badgeOriginX:(CGFloat)badgeOriginX
{
    NSNumber *number = [NSNumber numberWithDouble:badgeOriginX];
    objc_setAssociatedObject(self, &th_UIBarButtonItem_badgeOriginXKey, number, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    if (self.th_badge) {
        [self th_updateBadgeFrame];
    }
}

-(CGFloat)th_badgeOriginY {
    NSNumber *number = objc_getAssociatedObject(self, &th_UIBarButtonItem_badgeOriginYKey);
    return number.floatValue;
}
-(void) setTh_badgeOriginY:(CGFloat)badgeOriginY
{
    NSNumber *number = [NSNumber numberWithDouble:badgeOriginY];
    objc_setAssociatedObject(self, &th_UIBarButtonItem_badgeOriginYKey, number, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    if (self.th_badge) {
        [self th_updateBadgeFrame];
    }
}

// In case of numbers, remove the badge when reaching zero
-(BOOL) shouldHideBadgeAtZero {
    NSNumber *number = objc_getAssociatedObject(self, &th_UIBarButtonItem_shouldHideBadgeAtZeroKey);
    return number.boolValue;
}
- (void)setShouldHideBadgeAtZero:(BOOL)shouldHideBadgeAtZero
{
    NSNumber *number = [NSNumber numberWithBool:shouldHideBadgeAtZero];
    objc_setAssociatedObject(self, &th_UIBarButtonItem_shouldHideBadgeAtZeroKey, number, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    if(self.th_badge) {
        [self th_refreshBadge];
    }
}

// Badge has a bounce animation when value changes
-(BOOL) th_shouldAnimateBadge {
    NSNumber *number = objc_getAssociatedObject(self, &th_UIBarButtonItem_shouldAnimateBadgeKey);
    return number.boolValue;
}
- (void)setTh_shouldAnimateBadge:(BOOL)shouldAnimateBadge
{
    NSNumber *number = [NSNumber numberWithBool:shouldAnimateBadge];
    objc_setAssociatedObject(self, &th_UIBarButtonItem_shouldAnimateBadgeKey, number, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    if(self.th_badge) {
        [self th_refreshBadge];
    }
}

@end
