//
//  THSettingsSwitchCell.m
//  THSettingsDemo
//
//  Created by 涂浩 on 2017/12/15.
//  Copyright © 2017年 TuHao. All rights reserved.
//

#import "THSettingsSwitchCell.h"
#import "THSettings.h"
@implementation THSettingsSwitchCell

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


- (void)refreshData:(THSettingsTableRow *)rowData tableView:(THSettingsTableView *)tableView indexPath:(NSIndexPath *)indexPath {
    self.textLabel.text       = rowData.title;
    self.textLabel.font       = [UIFont systemFontOfSize:rowData.titleFont];
    //    self.detailTextLabel.text = rowData.detailTitle;
    NSString *actionName      = rowData.extraActionName;
    [self.switcher setOn:[rowData.extraInfo boolValue] animated:NO];
    [self.switcher removeTarget:nil action:nil forControlEvents:UIControlEventValueChanged];
    if (actionName.length) {
        SEL sel = NSSelectorFromString(actionName);

        if ([tableView.cellEventResponder respondsToSelector:sel]) {
            [self.switcher addTarget:tableView.cellEventResponder action:sel forControlEvents:UIControlEventValueChanged];
        } else if ([THViewController(tableView) respondsToSelector:sel]) {
            [self.switcher addTarget:THViewController(tableView) action:sel forControlEvents:UIControlEventValueChanged];
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
