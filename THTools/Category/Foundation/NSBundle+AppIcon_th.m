//
//  NSBundle+AppIcon_th.m
//  THToolsDemo
//
//  Created by 涂浩 on 2017/2/16.
//  Copyright © 2017年 TuHao. All rights reserved.
//

#import "NSBundle+AppIcon_th.h"

@implementation NSBundle (AppIcon_th)

- (NSString*)th_appIconPath {
    NSString* iconFilename = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleIconFile"] ;
    NSString* iconBasename = [iconFilename stringByDeletingPathExtension] ;
    NSString* iconExtension = [iconFilename pathExtension] ;
    return [[NSBundle mainBundle] pathForResource:iconBasename
                                           ofType:iconExtension] ;
}

- (UIImage*)th_appIcon {
    UIImage*appIcon = [[UIImage alloc] initWithContentsOfFile:[self th_appIconPath]] ;
    return appIcon;
}

@end
