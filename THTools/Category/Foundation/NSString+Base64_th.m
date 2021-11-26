//
//  NSString+Base64_th.m
//  THToolsDemo
//
//  Created by 涂浩 on 2017/2/16.
//  Copyright © 2017年 TuHao. All rights reserved.
//

#import "NSString+Base64_th.h"
#import "NSData+Base64_th.h"

@implementation NSString (Base64_th)

+ (NSString *)th_stringWithBase64EncodedString:(NSString *)string
{
    NSData *data = [NSData th_dataWithBase64EncodedString:string];
    if (data)
    {
        return [[self alloc] initWithData:data encoding:NSUTF8StringEncoding];
    }
    return nil;
}
- (NSString *)th_base64EncodedStringWithWrapWidth:(NSUInteger)wrapWidth
{
    NSData *data = [self dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:YES];
    return [data th_base64EncodedStringWithWrapWidth:wrapWidth];
}
- (NSString *)th_base64EncodedString
{
    NSData *data = [self dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:YES];
    return [data th_base64EncodedString];
}
- (NSString *)th_base64DecodedString
{
    return [NSString th_stringWithBase64EncodedString:self];
}
- (NSData *)th_base64DecodedData
{
    return [NSData th_dataWithBase64EncodedString:self];
}

@end
