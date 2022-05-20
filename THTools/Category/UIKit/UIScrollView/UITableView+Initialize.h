//
//  UITableView+Initialize.h
//  Single
//
//  Created by 涂浩 on 2020/1/6.
//  Copyright © 2020 lobochat. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITableView (Initialize)

/// 给第一行和最后一行cell添加圆角 在willDisplayCell下调用
/// @param cell cell
/// @param radius 圆角半径
/// @param indexPath indexPath
- (void)cornerRadiusWithCell:(UITableViewCell *)cell
                     radius:(NSInteger)radius
                  indexPath:(NSIndexPath *)indexPath;

@end

NS_ASSUME_NONNULL_END
