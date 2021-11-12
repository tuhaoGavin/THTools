//
//  THSettingsTableView.h
//  THSettingsDemo
//
//  Created by weixb on 2017/12/15.
//  Copyright © 2017年 weixb. All rights reserved.
//

#import <UIKit/UIKit.h>
@class THSettingsTableView, THSettingsModel;

@protocol THSettingsTableViewDelegate <NSObject>

@required
/** 配置列表数据 */
- (NSArray *)dataWithTableView:(THSettingsTableView *)tableView;
@optional
/** 刷新列表 */
- (void)refreshTableView:(THSettingsTableView *)tableView;

@end

@interface THSettingsTableView : UITableView

@property (nonatomic, assign) CGFloat defaultCellHeight; //默认55.0

@property (nonatomic, weak) id<THSettingsTableViewDelegate> delegater;

@property (nonatomic, weak) id cellEventResponder; //cell事件的响应者，若未设置则为当前viewController

@property (nonatomic, assign) BOOL separaterAlignLeft; //分割线左对齐

/* 默认列表模型 */
@property (nonatomic, strong) THSettingsModel *model;


/* 默认列表数据 */
- (NSArray *)defaultListData;

@end
