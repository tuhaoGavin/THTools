//
//  NSIndexPath+Offset_th.m
//  THToolsDemo
//
//  Created by 涂浩 on 2017/2/16.
//  Copyright © 2017年 TuHao. All rights reserved.
//

#import "NSIndexPath+Offset_th.h"

@implementation NSIndexPath (Offset_th)

- (NSIndexPath *)th_previousRow
{
    return [NSIndexPath indexPathForRow:self.row - 1
                              inSection:self.section];
}

- (NSIndexPath *)th_nextRow
{
    return [NSIndexPath indexPathForRow:self.row + 1
                              inSection:self.section];
}

- (NSIndexPath *)th_previousItem
{
    return [NSIndexPath indexPathForItem:self.item - 1
                               inSection:self.section];
}

- (NSIndexPath *)th_nextItem
{
    return [NSIndexPath indexPathForItem:self.item + 1
                               inSection:self.section];
}

- (NSIndexPath *)th_nextSection
{
    return [NSIndexPath indexPathForRow:self.row
                              inSection:self.section + 1];
}

- (NSIndexPath *)th_previousSection
{
    return [NSIndexPath indexPathForRow:self.row
                              inSection:self.section - 1];
}

@end
