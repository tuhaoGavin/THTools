//
//  YQSettingsSwitchCell.m
//  YQSettingsDemo
//
//  Created by weixb on 2017/12/15.
//  Copyright © 2017年 weixb. All rights reserved.
//

#import "YQSettingsSwitchCell.h"
#import "YQSettings.h"
@implementation YQSettingsSwitchCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _switcher = [[UISwitch alloc] initWithFrame:CGRectZero];
        self.accessoryView = _switcher;
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}


- (void)refreshData:(YQSettingsTableRow *)rowData tableView:(YQSettingsTableView *)tableView indexPath:(NSIndexPath *)indexPath {
    self.textLabel.text       = rowData.title;
    self.textLabel.font       = [UIFont systemFontOfSize:rowData.titleFont];
    //    self.detailTextLabel.text = rowData.detailTitle;
    NSString *actionName      = rowData.extraActionName;
    [self.switcher setOn:[rowData.extraInfo boolValue] animated:NO];
    if (actionName.length) {
        SEL sel = NSSelectorFromString(actionName);

        if ([tableView.cellEventResponder respondsToSelector:sel]) {
            [self.switcher addTarget:tableView.cellEventResponder action:sel forControlEvents:UIControlEventValueChanged];
        } else if ([YQViewController(tableView) respondsToSelector:sel]) {
            [self.switcher addTarget:YQViewController(tableView) action:sel forControlEvents:UIControlEventValueChanged];
        } else if ([tableView respondsToSelector:sel]) {
            [self.switcher addTarget:tableView action:sel forControlEvents:UIControlEventValueChanged];
        }
    }
}

#pragma mark - setter
- (void)setTintColor:(UIColor *)tintColor {
    //tintColor 关状态下的背景颜色
    self.switcher.layer.cornerRadius = self.switcher.bounds.size.height/2;
    self.switcher.layer.masksToBounds = YES;
    self.switcher.backgroundColor = tintColor;
}
- (void)setOnTintColor:(UIColor *)onTintColor {
    //onTintColor 开状态下的背景颜色
    self.switcher.onTintColor = onTintColor;
}
- (void)setThumbTintColor:(UIColor *)thumbTintColor {
    //thumbTintColor 滑块的背景颜色
    self.switcher.thumbTintColor = thumbTintColor;
}


@end
