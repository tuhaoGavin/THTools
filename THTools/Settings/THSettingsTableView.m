//
//  THSettingsTableView.m
//  THSettingsDemo
//
//  Created by 涂浩 on 2017/12/15.
//  Copyright © 2017年 TuHao. All rights reserved.
//

#import "THSettingsTableView.h"
#import "THSettings.h"
#import "THSettingsModel.h"
#import "THSettingsTimeRangView.h"
#import "UIView+Alert_th.h"
#import "THAppMacro.h"

@interface THSettingsTableView ()

@property (nonatomic, strong) THSettingsTableDelegate *delegator;

@end


@implementation THSettingsTableView

- (instancetype)initWithFrame:(CGRect)frame
{
    return [self initWithFrame:frame style:UITableViewStyleGrouped];
}

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    if (self = [super initWithFrame:frame style:style]) {
        [self config];
    }
    return self;
}

- (void)config {
    //设置列表的代理
    __weak __typeof(self)weakSelf = self;
    _delegator = [[THSettingsTableDelegate alloc] initWithTableData:^NSArray *{
        
        return [THSettingsTableSection sectionsWithData:weakSelf.data];
    }];
    self.delegate = _delegator;
    self.dataSource = _delegator;
    [self reloadData];
}

/* 默认列表数据 */
- (NSArray *)defaultListData {
    NSNumber *headerHeight    = @0.01f;
    NSNumber *detailFont      = @13;
    NSString *switchCellClass = THSettingsSwitchCellClass;
    THSettingsModel *model = self.model;
    return @[
             @{
                 HeaderHeight:@1,
                 RowContent :@[
                         @{
                             Title      :@"通知提醒设置",
                             CellAction :@"showNotiRemindVCAction:",
                             RowHeight : @44,
                             ShowAccessory:@(YES),
                             },
                         ],
                 FooterTitle:@""
                 },
             @{
//                 HeaderHeight:headerHeight,
                 RowContent :@[
                         @{
                             CellClass     :switchCellClass,
                             CellAction    :@"testAction:",
                             ExtraAction    :@"msgDetailAction:",
                             Title         :@"通知显示消息详情",
//                             ForbidSelect  : @(YES),
                             ExtraInfo     : @(model.displayInform),
                             RowHeight     : model.displayInform ? @100 : @55
                             },
                         @{
                             CellClass     :switchCellClass,
                             ExtraAction    :@"DNDAction:",
                             Title         :@"免打扰模式",
                             ForbidSelect  : @(YES),
                             ExtraInfo     : @(model.distrub)
                             },
                         @{
                             Title         :@"选择时段",
                             CellAction    :@"DNDTimeAction",
                             DetailTitle   :model.DNDTime,
                             DetailFont    :detailFont,
                             Disable       : @(!model.distrub),
                             ShowAccessory : @(YES),
                             ExtraInfo     : @(YES),
                             },
                         ],
                 FooterTitle:@"",
                 },
             @{
//                 HeaderHeight:headerHeight,
                 RowContent :@[
                         @{
                             CellClass     :switchCellClass,
                             ExtraAction    :@"voiceAction:",
                             Title         :@"声音",
                             ForbidSelect  : @(YES),
                             ExtraInfo     : @(model.voice),
                             },
                         ],
                 FooterTitle:@"正在使用或后台运行时, 声音提示新消息; 关闭后将收不到声音新消息提示",
                 FooterHeight:@44,
                 },
             @{
                 HeaderHeight:headerHeight,
                 RowContent :@[
                         @{
                             CellClass     :switchCellClass,
                             ExtraAction    :@"shakeAction:",
                             Title         :@"震动",
                             ForbidSelect  : @(YES),
                             ExtraInfo     : @(model.shake),
                             },
                         ],
                 FooterTitle:@"正在使用或后台运行时, 震动提示新消息; 关闭后将收不到震动新消息提示",
                 FooterHeight:@44,
                 },
             ];
}
#pragma mark - Action
- (void)showNotiRemindVCAction:(UITableViewCell *)cell {
    UIViewController *vc = [UIViewController new];
    vc.view.backgroundColor = [UIColor whiteColor];
    [THViewController(self).navigationController pushViewController:vc animated:YES];
}

- (void)testAction:(THSettingsSwitchCell *)cell {
    NSLog(@"%@", cell);
}

- (void)msgDetailAction:(UISwitch *)sender {
    _model.displayInform = sender.isOn;
//    [self refresh];
    [self beginUpdates];
    [self endUpdates];
}
- (void)DNDAction:(UISwitch *)sender {
    _model.distrub = sender.isOn;
    [self refresh];
}
//选择时段
- (void)DNDTimeAction {
    THSettingsTimeRangView *view = [[THSettingsTimeRangView alloc] initStartRow:_model.distrubTimeStart endRow:_model.distrubTimeEnd];
    view.sureBtnBlock = ^(NSString *value, NSInteger startH, NSInteger endH) {
        _model.DNDTime = value;
        _model.distrubTimeStart = startH;
        _model.distrubTimeEnd = endH;
        [self refresh];
    };
    [view showInWindowWithBackgoundTapDismissEnable:YES];
}
- (void)voiceAction:(UISwitch *)sender {
    _model.voice = sender.isOn;
    [self refresh];
}
- (void)shakeAction:(UISwitch *)sender {
    _model.shake = sender.isOn;
    [self refresh];
}

#pragma mark - Private
- (NSArray *)data {
    if ([self.delegater respondsToSelector:@selector(dataWithTableView:)]) {
        return [self.delegater dataWithTableView:self];
    }
    return [self defaultListData];
}
- (void)refresh {
    [self reloadData];
    if ([self.delegater respondsToSelector:@selector(refreshTableView:)]) {
        [self.delegater refreshTableView:self];
    }
}

#pragma mark - getter
- (THSettingsModel *)model {
    if (!_model) {
        _model = [THSettingsModel sharedSettings];
    }
    return _model;
}

#pragma mark - setter
-(void)setSeparaterAlignLeft:(BOOL)separaterAlignLeft {
    _separaterAlignLeft = separaterAlignLeft;
    _delegator.separaterAlignLeft = _separaterAlignLeft;
    if (_separaterAlignLeft) {
        if ([self respondsToSelector:@selector(setSeparatorInset:)]) {
            [self setSeparatorInset:UIEdgeInsetsZero];
        }
        if ([self respondsToSelector:@selector(setLayoutMargins:)])  {
            [self setLayoutMargins:UIEdgeInsetsZero];
        }
    }
}

-(void)setDefaultCellHeight:(CGFloat)defaultCellHeight {
    _defaultCellHeight = defaultCellHeight;
    _delegator.defaultCellHeight = _defaultCellHeight;
}
@end
