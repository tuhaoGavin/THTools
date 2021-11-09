//
//  ViewController.m
//  THToolsDemo
//
//  Created by Qi on 2021/10/28.
//

#import "ViewController.h"
#import <YQSettings.h>
#import <Masonry.h>

@interface ViewController ()<YQSettingsTableViewDelegate>
@property (nonatomic, strong) YQSettingsTableView * tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.offset(0);
    }];
}

#pragma mark - YQSettingsTableViewDelegate
- (NSArray *)dataWithTableView:(YQSettingsTableView *)tableView {
    return @[
        @{
            HeaderHeight: @(10),
            FooterHeight: @(15),
            RowContent: @[
                @{
                    Title: @"黑名单列表",
                    TitleFont: @(14),
                    ShowAccessory: @(YES),
                    CellAction: @"nl_blackListAction"
                }
            ]
        }
    ];
}



#pragma mark - getter
- (YQSettingsTableView *)tableView {
    if (!_tableView) {
        _tableView = [[YQSettingsTableView alloc] init];
        _tableView.delegater = self;
    }
    return _tableView;
}


@end
