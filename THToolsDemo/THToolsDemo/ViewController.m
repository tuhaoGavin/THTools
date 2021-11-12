//
//  ViewController.m
//  THToolsDemo
//
//  Created by Qi on 2021/10/28.
//

#import "ViewController.h"
#import <THSettings.h>
#import <Masonry.h>

@interface ViewController ()<THSettingsTableViewDelegate>
@property (nonatomic, strong) THSettingsTableView * tableView;

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
- (NSArray *)dataWithTableView:(THSettingsTableView *)tableView {
    return @[
        @{
            HeaderHeight: @(10),
            FooterHeight: @(15),
            RowContent: @[
                @{
                    Title: @"黑名单列表",
                    TitleFont: @(14),
                    ShowAccessory: @(YES),
                    CellAction: @"blackListAction"
                }
            ]
        }
    ];
}

- (void)blackListAction {
    NSLog(@"点击了黑名单列表");
}

#pragma mark - getter
- (THSettingsTableView *)tableView {
    if (!_tableView) {
        _tableView = [[THSettingsTableView alloc] init];
        _tableView.delegater = self;
    }
    return _tableView;
}


@end
