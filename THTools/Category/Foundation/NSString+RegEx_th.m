//
//  NSString+RegEx_th.m
//  Tools
//
//  Created by 涂浩 on 16/12/19.
//  Copyright © 2016年 TuHao. All rights reserved.
//

#import "NSString+RegEx_th.h"
#import "THAppMacro.h"

@implementation NSString (RegEx_th)

/*! 自己写正则传入进行判断*/
+ (BOOL)th_validateData:(NSString *)data withRegEx: (NSString *)RegEx {
    NSPredicate * predicate = [NSPredicate predicateWithFormat: @"SELF MATCHES %@", RegEx];
    return [predicate evaluateWithObject: data];
}
//邮箱
+ (BOOL)th_validateEmail:(NSString *)data
{
    NSString *RegEx = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    return [self th_baseValidateForRegEx:RegEx data:data];
}

//手机号码验证
+ (BOOL)th_validateMobile:(NSString *)data
{
    //手机号以1开头，10个 \d 数字字符
    NSString *RegEx = @"^(1)\\d{10}$";
    return [self th_baseValidateForRegEx:RegEx data:data];
}

//车牌号验证
+ (BOOL)th_validateCarNo:(NSString *)data
{
    NSString *RegEx = @"^[\u4e00-\u9fa5]{1}[a-zA-Z]{1}[a-zA-Z_0-9]{4}[a-zA-Z_0-9_\u4e00-\u9fa5]$";
    return [self th_baseValidateForRegEx:RegEx data:data];
}

//车型
+ (BOOL)th_validateCarType:(NSString *)data
{
    NSString *RegEx = @"^[\u4E00-\u9FFF]+$";
    return [self th_baseValidateForRegEx:RegEx data:data];
}

//用户名
+ (BOOL)th_validateUserName:(NSString *)data
{
    NSString *RegEx = @"^[A-Za-z0-9]{6,20}+$";
    return [self th_baseValidateForRegEx:RegEx data:data];
}
//密码
+ (BOOL)th_validatePassword:(NSString *)data
{
    NSString *RegEx = @"^[a-zA-Z0-9]{6,20}+$";
    return [self th_baseValidateForRegEx:RegEx data:data];
}

//昵称
+ (BOOL)th_validateNickname:(NSString *)data
{
    NSString *RegEx = @"^[\u4e00-\u9fa5]{4,8}$";
    return [self th_baseValidateForRegEx:RegEx data:data];
}

//身份证号
+ (BOOL)th_validateIdentityCard: (NSString *)data
{
    NSString *RegEx = @"^(\\d{14}|\\d{17})(\\d|[xX])$";
    return [self th_baseValidateForRegEx:RegEx data:data];
}

//手机验证码
+ (BOOL)th_validateCheckCode:(NSString *)data {
    NSString *RegEx = @"\\d{4}";
    return [self th_baseValidateForRegEx:RegEx data:data];
}
//判断URL是否能够打开
+ (void)th_validateUrl:(NSString *)url block:(void(^)(BOOL))block {
    NSURL *candidate = [NSURL URLWithString:url];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:candidate];
    [request setHTTPMethod:@"HEAD"];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSLog(@"error %@",error);
        if (!request && error) {
            NSLog(@"URL不可用");
            block(NO);
        }else{
            NSLog(@"URL可用:%@",request);
            block(YES);
        }
    }];
    [task resume];
}

#pragma mark - private
+ (BOOL)th_baseValidateForRegEx:(NSString *)RegEx data:(NSString *)data
{
    NSPredicate *card = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", RegEx];
    if (([card evaluateWithObject:data])) {
        return YES;
    }
    return NO;
}

@end
