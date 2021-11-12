//
//  UIApplication+Service_th.m
//  THToolsDemo
//
//  Created by WeiXinbing on 2019/1/22.
//  Copyright © 2019 weixb. All rights reserved.
//

#import "UIApplication+Service_th.h"
#import <WebKit/WebKit.h>

@implementation UIApplication (Service_th)

+ (void)th_directPhoneCallWithPhoneNum:(NSString *)phoneNum {
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[@"tel:" stringByAppendingString:phoneNum]] options:@{} completionHandler:nil];
}

+ (void)th_phoneCallWithPhoneNum:(NSString *)phoneNum contentView:(UIView *)view {
    
    WKWebView * callWebview = [[WKWebView alloc] init];
    [callWebview loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:[@"tel:" stringByAppendingString:phoneNum]]]];
    [view addSubview:callWebview];
}

+ (void)th_jumpToAppReviewPageWithAppId:(NSString *)appId {
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[@"itms-apps://itunes.apple.com/WebObjects/MZStore.woa/wa/viewContentsUserReviews?type=Purple+Software&id=" stringByAppendingString:appId]] options:@{} completionHandler:nil];
}

+ (void)th_sendEmailToAddress:(NSString *)address {
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[@"mailto://" stringByAppendingString:address]] options:@{} completionHandler:nil];
}

@end
