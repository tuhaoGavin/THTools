//
//  THSettingsTableDelegate.m
//  THSettingsDemo
//
//  Created by 涂浩 on 2017/12/15.
//  Copyright © 2017年 TuHao. All rights reserved.
//

#import "THSettingsTableDelegate.h"
#import "THSettings.h"
#import "THUIKit.h"
#if __has_include(<Masonry.h>)
#import <Masonry.h>
#else
#import "Masonry.h"
#endif

#define DefaultUIRowHeight  55.f
static NSInteger const KRedPointTag = 88999;

@interface THSettingsTableDelegate ()
@property (nonatomic, copy) NSArray *(^THSettingsDataReceiver)(void);
@end


@implementation THSettingsTableDelegate

- (instancetype) initWithTableData:(NSArray *(^)(void))data {
    self = [super init];
    if (self) {
        _defaultCellHeight = DefaultUIRowHeight;
        _THSettingsDataReceiver = data;
    }
    return self;
}

- (NSArray *)data {
    return self.THSettingsDataReceiver();
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.data.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    THSettingsTableSection *tableSection = self.data[section];
    return tableSection.rows.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    THSettingsTableSection *tableSection = self.data[indexPath.section];
    THSettingsTableRow     *tableRow     = tableSection.rows[indexPath.row];
    NSString *defaultTableCell = NSStringFromClass([UITableViewCell class]);
    NSString *identity = tableRow.cellClassName.length ? tableRow.cellClassName : defaultTableCell;
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identity];
    if (!cell) {
        Class clazz = NSClassFromString(identity);
        cell = [[clazz alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identity];
    }
    cell.accessoryType = tableRow.showAccessory ? UITableViewCellAccessoryDisclosureIndicator : UITableViewCellAccessoryNone;
    //THHT
//    if (!cell.accessoryView) {
//        cell.accessoryView = tableRow.showAccessory ? [[UIImageView alloc] initWithImage:THImage(@"icon_arrow")] : nil;
//    }
    
    
    if (![cell respondsToSelector:@selector(refreshData:tableView:indexPath:)]) {
        UITableViewCell *defaultCell = (UITableViewCell *)cell;
        [self refreshData:tableRow cell:defaultCell];
    }else{
        [(id<THSettingsCellDelegate>)cell refreshData:tableRow tableView:tableView indexPath:indexPath];
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (_separaterAlignLeft) {
        if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
            [cell setLayoutMargins:UIEdgeInsetsZero];
        }
        if ([cell respondsToSelector:@selector(setSeparatorInset:)]){
            [cell setSeparatorInset:UIEdgeInsetsZero];
        }
    }
    
}

#pragma mark - UITableViewDelegate

// 预测cell的高度
//- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    THSettingsTableSection *tableSection = self.data[indexPath.section];
//    THSettingsTableRow     *tableRow     = tableSection.rows[indexPath.row];
//
//    return tableRow.uiEstimatedRowHeight ? : (tableRow.uiRowHeight ? : _defaultCellHeight);
//}

// 自动布局后cell的高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    //    return UITableViewAutomaticDimension;
    THSettingsTableSection *tableSection = self.data[indexPath.section];
    THSettingsTableRow     *tableRow     = tableSection.rows[indexPath.row];
    if (tableRow.uiEstimatedRowHeight) {
        return UITableViewAutomaticDimension;
    } else {
        return tableRow.uiRowHeight ? : _defaultCellHeight;
    }
}

- (void)tableView:(THSettingsTableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    THSettingsTableSection *tableSection = self.data[indexPath.section];
    THSettingsTableRow     *tableRow     = tableSection.rows[indexPath.row];
    if (!tableRow.forbidSelect) {
        UIViewController *vc = THViewController(tableView);
        NSString *actionName = tableRow.cellActionName;
        if (actionName.length) {
            SEL sel = NSSelectorFromString(actionName);
            UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
            if ([tableView.cellEventResponder respondsToSelector:sel]) {
                THKit_SuppressPerformSelectorLeakWarning([tableView.cellEventResponder performSelector:sel withObject:cell]);
            } else if ([vc respondsToSelector:sel]) {
                THKit_SuppressPerformSelectorLeakWarning([vc performSelector:sel withObject:cell]);
            } else if ([tableView respondsToSelector:sel]) {
                THKit_SuppressPerformSelectorLeakWarning([tableView performSelector:sel withObject:cell]);
            }
        }
    }
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    THSettingsTableSection *tableSection = self.data[section];
    return tableSection.headerTitle;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    THSettingsTableSection *tableSection = self.data[section];
    return tableSection.uiHeaderHeight ?: 0.01f;
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section{
    THSettingsTableSection *tableSection = self.data[section];
    return tableSection.footerTitle;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    
    THSettingsTableSection *tableSection = self.data[section];
    return tableSection.uiFooterHeight ?: 0.01f;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    THSettingsTableSection *tableSection = self.data[section];
    if (tableSection.headerTitle.length) {
        return nil;
    }
    UIView *view = [[UIView alloc] initWithFrame:CGRectZero];
    return view;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    THSettingsTableSection *tableSection = self.data[section];
    if (tableSection.footerTitle.length) {
        return nil;
    }
    UIView *view = [[UIView alloc] initWithFrame:CGRectZero];
    return view;
}

- (void)tableView:(UITableView *)tableView willDisplayHeaderView:(UIView *)view forSection:(NSInteger)section {
    
    THSettingsTableSection *tableSection = self.data[section];
    if (tableSection.headerTitle.length) {
        UITableViewHeaderFooterView *header = (UITableViewHeaderFooterView *)view;
        [header.textLabel setTextColor:THSettingsColorWithHex(0x888888)];
        header.textLabel.font = [UIFont systemFontOfSize:13];
    }
}
- (void)tableView:(UITableView *)tableView willDisplayFooterView:(UIView *)view forSection:(NSInteger)section {
    THSettingsTableSection *tableSection = self.data[section];
    if (tableSection.footerTitle.length) {
        UITableViewHeaderFooterView *footer = (UITableViewHeaderFooterView *)view;
        [footer.textLabel setTextColor:THSettingsColorWithHex(0xaaaaaa)];
        footer.textLabel.font = [UIFont systemFontOfSize:13];
    }
}
#pragma mark - Private
- (void)refreshData:(THSettingsTableRow *)rowData cell:(UITableViewCell *)cell{
    cell.textLabel.text = rowData.title;
    cell.detailTextLabel.text = rowData.detailTitle;
    if (rowData.titleColor) {
        cell.textLabel.textColor = [UIColor th_colorWithHexString:rowData.titleColor];
    }
    if (rowData.titleFont) {
        cell.textLabel.font = [UIFont systemFontOfSize:rowData.titleFont];
    }
    if (rowData.detailFont) {
        cell.detailTextLabel.font = [UIFont systemFontOfSize:rowData.detailFont];
    }
    if (rowData.detailColor) {
        cell.detailTextLabel.textColor = [UIColor th_colorWithHexString:rowData.detailColor];
    }
    cell.imageView.image = rowData.image;
    
    [self addRedpointWithRowData:rowData cell:cell];
}

- (void)addRedpointWithRowData:(THSettingsTableRow *)rowData cell:(UITableViewCell *)cell{
    UIView * redView = [cell.contentView viewWithTag:KRedPointTag];
    if (!redView) {
        redView = [[UIView alloc] init];
        redView.tag = KRedPointTag;
        redView.backgroundColor = [UIColor redColor];
        redView.layer.masksToBounds = YES;
        redView.layer.cornerRadius = 4;
        [cell.contentView addSubview:redView];
        
        [redView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(cell);
            make.width.height.mas_equalTo(8);
            make.right.mas_offset(-8);
        }];
    }
    redView.hidden = !rowData.showRedPoint;
}

@end
