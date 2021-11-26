//
//  THSettingsCellDelegate.h
//  THSettingsDemo
//
//  Created by 涂浩 on 2017/12/15.
//  Copyright © 2017年 TuHao. All rights reserved.
//

#import <Foundation/Foundation.h>
@class THSettingsTableRow;

@protocol THSettingsCellDelegate <NSObject>

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier;
@optional
- (void)refreshData:(THSettingsTableRow *)rowData tableView:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath;

@end
