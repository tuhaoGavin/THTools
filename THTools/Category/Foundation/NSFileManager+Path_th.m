//
//  NSFileManager+Path_th.m
//  THToolsDemo
//
//  Created by 涂浩 on 2017/2/16.
//  Copyright © 2017年 TuHao. All rights reserved.
//

#import "NSFileManager+Path_th.h"

@implementation NSFileManager (Path_th)

+ (NSURL *)th_URLForDirectory:(NSSearchPathDirectory)directory
{
    return [self.defaultManager URLsForDirectory:directory inDomains:NSUserDomainMask].lastObject;
}

+ (NSString *)th_pathForDirectory:(NSSearchPathDirectory)directory
{
    return NSSearchPathForDirectoriesInDomains(directory, NSUserDomainMask, YES)[0];
}

+ (NSURL *)th_documentsURL
{
    return [self th_URLForDirectory:NSDocumentDirectory];
}

+ (NSString *)th_documentsPath
{
    return [self th_pathForDirectory:NSDocumentDirectory];
}

+ (NSURL *)th_libraryURL
{
    return [self th_URLForDirectory:NSLibraryDirectory];
}

+ (NSString *)th_libraryPath
{
    return [self th_pathForDirectory:NSLibraryDirectory];
}

+ (NSURL *)th_cachesURL
{
    return [self th_URLForDirectory:NSCachesDirectory];
}

+ (NSString *)th_cachesPath
{
    return [self th_pathForDirectory:NSCachesDirectory];
}

+ (BOOL)th_addSkipBackupAttributeToFile:(NSString *)path
{
    return [[NSURL.alloc initFileURLWithPath:path] setResourceValue:@(YES) forKey:NSURLIsExcludedFromBackupKey error:nil];
}

+ (double)th_availableDiskSpace
{
    NSDictionary *attributes = [self.defaultManager attributesOfFileSystemForPath:self.th_documentsPath error:nil];
    
    return [attributes[NSFileSystemFreeSize] unsignedLongLongValue] / (double)0x100000;
}

@end
