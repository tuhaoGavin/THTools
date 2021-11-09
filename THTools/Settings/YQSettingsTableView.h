//
//  YQSettingsTableView.h
//  YQSettingsDemo
//
//  Created by weixb on 2017/12/15.
//  Copyright © 2017年 weixb. All rights reserved.
//

#import <UIKit/UIKit.h>
@class YQSettingsTableView, YQSettingsModel;

@protocol YQSettingsTableViewDelegate <NSObject>

@required
/** 配置列表数据 */
- (NSArray *)dataWithTableView:(YQSettingsTableView *)tableView;
@optional
/** 刷新列表 */
- (void)refreshTableView:(YQSettingsTableView *)tableView;

@end

@interface YQSettingsTableView : UITableView

@property (nonatomic, assign) CGFloat defaultCellHeight; //默认55.0

@property (nonatomic, weak) id<YQSettingsTableViewDelegate> delegater;

@property (nonatomic, weak) id cellEventResponder; //cell事件的响应者，若未设置则为当前viewController

@property (nonatomic, assign) BOOL separaterAlignLeft; //分割线左对齐

/* 默认列表模型 */
@property (nonatomic, strong) YQSettingsModel *model;


/* 默认列表数据 */
- (NSArray *)defaultListData;

@end
