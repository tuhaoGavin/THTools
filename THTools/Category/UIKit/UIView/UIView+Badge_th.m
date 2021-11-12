//
//  UIView+Badge_th.m
//  THToolsDemo
//
//  Created by weixb on 2017/7/24.
//  Copyright © 2017年 weixb. All rights reserved.
//

#import "UIView+Badge_th.h"
@import ObjectiveC.runtime;

NSString const *th_UIView_badgeKey = @"th_UIView_badgeKey";

NSString const *th_UIView_badgeBGColorKey = @"th_UIView_badgeBGColorKey";
NSString const *th_UIView_badgeTextColorKey = @"th_UIView_badgeTextColorKey";
NSString const *th_UIView_badgeFontKey = @"th_UIView_badgeFontKey";
NSString const *th_UIView_badgePaddingKey = @"th_UIView_badgePaddingKey";
NSString const *th_UIView_badgeMinSizeKey = @"th_UIView_badgeMinSizeKey";
NSString const *th_UIView_badgeOriginXKey = @"th_UIView_badgeOriginXKey";
NSString const *th_UIView_badgeOriginYKey = @"th_UIView_badgeOriginYKey";
NSString const *th_UIView_shouldHideBadgeAtZeroKey = @"th_UIView_shouldHideBadgeAtZeroKey";
NSString const *th_UIView_shouldAnimateBadgeKey = @"th_UIView_shouldAnimateBadgeKey";
NSString const *th_UIView_badgeValueKey = @"th_UIView_badgeValueKey";

@implementation UIView (Badge_th)

@dynamic th_badgeValue, th_badgeBGColor, th_badgeTextColor, th_badgeFont;
@dynamic th_badgePadding, th_badgeMinSize, th_badgeOriginX, th_badgeOriginY;
@dynamic th_shouldHideBadgeAtZero, th_shouldAnimateBadge;

- (void)th_badgeInit
{
    // Default design initialization
    self.th_badgeBGColor   = [UIColor redColor];
    self.th_badgeTextColor = [UIColor whiteColor];
    self.th_badgeFont      = [UIFont systemFontOfSize:12.0];
    self.th_badgePadding   = 6;
    self.th_badgeMinSize   = 8;
    self.th_badgeOriginX   = self.frame.size.width - self.th_badge.frame.size.width;
    self.th_badgeOriginY   = -4;
    self.th_shouldHideBadgeAtZero = YES;
    self.th_shouldAnimateBadge = YES;
    // Avoids badge to be clipped when animating its scale
    self.clipsToBounds = NO;
}

#pragma mark - Utility methods

// Handle badge display when its properties have been changed (color, font, ...)
- (void)th_refreshBadge
{
    // Change new attributes
    self.th_badge.textColor        = self.th_badgeTextColor;
    self.th_badge.backgroundColor  = self.th_badgeBGColor;
    self.th_badge.font             = self.th_badgeFont;
}

- (CGSize) th_badgeExpectedSize
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
    self.th_badge.frame = CGRectMake(self.th_badgeOriginX, self.th_badgeOriginY, minWidth + padding, minHeight + padding);
    self.th_badge.layer.cornerRadius = (minHeight + padding) / 2;
    self.th_badge.layer.masksToBounds = YES;
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
    NSTimeInterval duration = animated ? 0.2 : 0;
    [UIView animateWithDuration:duration animations:^{
        [self th_updateBadgeFrame];
    }];
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
    return objc_getAssociatedObject(self, &th_UIView_badgeKey);
}
-(void)setTh_badge:(UILabel *)badgeLabel
{
    objc_setAssociatedObject(self, &th_UIView_badgeKey, badgeLabel, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

// Badge value to be display
-(NSString *)th_badgeValue {
    return objc_getAssociatedObject(self, &th_UIView_badgeValueKey);
}
-(void) setTh_badgeValue:(NSString *)badgeValue
{
    objc_setAssociatedObject(self, &th_UIView_badgeValueKey, badgeValue, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    // When changing the badge value check if we need to remove the badge
    if (!badgeValue || [badgeValue isEqualToString:@""] || ([badgeValue isEqualToString:@"0"] && self.th_shouldHideBadgeAtZero)) {
        [self th_removeBadge];
    } else if (!self.th_badge) {
        // Create a new badge because not existing
        self.th_badge                      = [[UILabel alloc] initWithFrame:CGRectMake(self.th_badgeOriginX, self.th_badgeOriginY, 20, 20)];
        self.th_badge.textColor            = self.th_badgeTextColor;
        self.th_badge.backgroundColor      = self.th_badgeBGColor;
        self.th_badge.font                 = self.th_badgeFont;
        self.th_badge.textAlignment        = NSTextAlignmentCenter;
        [self th_badgeInit];
        [self addSubview:self.th_badge];
        [self th_updateBadgeValueAnimated:NO];
    } else {
        [self th_updateBadgeValueAnimated:YES];
    }
}

// Badge background color
-(UIColor *)th_badgeBGColor {
    return objc_getAssociatedObject(self, &th_UIView_badgeBGColorKey);
}
-(void)setTh_badgeBGColor:(UIColor *)badgeBGColor
{
    objc_setAssociatedObject(self, &th_UIView_badgeBGColorKey, badgeBGColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    if (self.th_badge) {
        [self th_refreshBadge];
    }
}

// Badge text color
-(UIColor *)th_badgeTextColor {
    return objc_getAssociatedObject(self, &th_UIView_badgeTextColorKey);
}
-(void)setTh_badgeTextColor:(UIColor *)badgeTextColor
{
    objc_setAssociatedObject(self, &th_UIView_badgeTextColorKey, badgeTextColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    if (self.th_badge) {
        [self th_refreshBadge];
    }
}

// Badge font
-(UIFont *)th_badgeFont {
    return objc_getAssociatedObject(self, &th_UIView_badgeFontKey);
}
-(void)setTh_badgeFont:(UIFont *)badgeFont
{
    objc_setAssociatedObject(self, &th_UIView_badgeFontKey, badgeFont, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    if (self.th_badge) {
        [self th_refreshBadge];
    }
}

// Padding value for the badge
-(CGFloat) th_badgePadding {
    NSNumber *number = objc_getAssociatedObject(self, &th_UIView_badgePaddingKey);
    return number.floatValue;
}
-(void) setTh_badgePadding:(CGFloat)badgePadding
{
    NSNumber *number = [NSNumber numberWithDouble:badgePadding];
    objc_setAssociatedObject(self, &th_UIView_badgePaddingKey, number, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    if (self.th_badge) {
        [self th_updateBadgeFrame];
    }
}

// Minimum size badge to small
-(CGFloat) th_badgeMinSize {
    NSNumber *number = objc_getAssociatedObject(self, &th_UIView_badgeMinSizeKey);
    return number.floatValue;
}
-(void) setTh_badgeMinSize:(CGFloat)badgeMinSize
{
    NSNumber *number = [NSNumber numberWithDouble:badgeMinSize];
    objc_setAssociatedObject(self, &th_UIView_badgeMinSizeKey, number, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    if (self.th_badge) {
        [self th_updateBadgeFrame];
    }
}

// Values for offseting the badge over the BarButtonItem you picked
-(CGFloat) th_badgeOriginX {
    NSNumber *number = objc_getAssociatedObject(self, &th_UIView_badgeOriginXKey);
    return number.floatValue;
}
-(void) setTh_badgeOriginX:(CGFloat)badgeOriginX
{
    NSNumber *number = [NSNumber numberWithDouble:badgeOriginX];
    objc_setAssociatedObject(self, &th_UIView_badgeOriginXKey, number, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    if (self.th_badge) {
        [self th_updateBadgeFrame];
    }
}

-(CGFloat) th_badgeOriginY {
    NSNumber *number = objc_getAssociatedObject(self, &th_UIView_badgeOriginYKey);
    return number.floatValue;
}
-(void) setTh_badgeOriginY:(CGFloat)badgeOriginY
{
    NSNumber *number = [NSNumber numberWithDouble:badgeOriginY];
    objc_setAssociatedObject(self, &th_UIView_badgeOriginYKey, number, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    if (self.th_badge) {
        [self th_updateBadgeFrame];
    }
}

// In case of numbers, remove the badge when reaching zero
-(BOOL) th_shouldHideBadgeAtZero {
    NSNumber *number = objc_getAssociatedObject(self, &th_UIView_shouldHideBadgeAtZeroKey);
    return number.boolValue;
}
- (void)setTh_shouldHideBadgeAtZero:(BOOL)shouldHideBadgeAtZero
{
    NSNumber *number = [NSNumber numberWithBool:shouldHideBadgeAtZero];
    objc_setAssociatedObject(self, &th_UIView_shouldHideBadgeAtZeroKey, number, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

// Badge has a bounce animation when value changes
-(BOOL) th_shouldAnimateBadge {
    NSNumber *number = objc_getAssociatedObject(self, &th_UIView_shouldAnimateBadgeKey);
    return number.boolValue;
}
- (void)setTh_shouldAnimateBadge:(BOOL)shouldAnimateBadge
{
    NSNumber *number = [NSNumber numberWithBool:shouldAnimateBadge];
    objc_setAssociatedObject(self, &th_UIView_shouldAnimateBadgeKey, number, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
