//
//  ViewController.m
//  THToolsDemo
//
//  Created by Qi on 2021/10/28.
//

#import "ViewController.h"
#import <THTools.h>
#import <THSettings.h>
#import <Masonry.h>
#import "TestAlert.h"

@interface ViewController ()<THSettingsTableViewDelegate>
@property (nonatomic, strong) THSettingsTableView * tableView;

@end

@implementation ViewController

- (void)dealloc {
    if (self.view) {
        [self.tableView removeObserver:self forKeyPath:@"contentOffset"];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createUI];
    [self setupEventBinding];
}

- (void)createUI {
    self.title = @"Test Demo";
    self.isUseClearBar = YES;
    self.navigationController.navigationBar.hidesShadow = NO;
    
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.offset(0);
    }];
}

- (void)setupEventBinding {
    [self.tableView addObserver:self forKeyPath:@"contentOffset" options:NSKeyValueObservingOptionNew context:nil];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    CGFloat alpha = (self.tableView.contentOffset.y + KNavBarHAbove) / 10;
    NSLog(@"%.2f", alpha);
    [self setAlphaForNaviBar:alpha];
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
                    TitleColor: @"FF0000",
                    ShowAccessory: @(YES),
                    CellAction: @"blackListAction"
                },
                @{
                    Title: @"黑名单列表",
                    TitleFont: @(14),
                    TitleColor: @"FF0000",
                    ShowAccessory: @(YES),
                    CellAction: @"blackListAction"
                }
            ]
        }
    ];
}

- (void)blackListAction {
    NSLog(@"点击了黑名单列表%@", [THDeviceInfoHelper phoneName]);
    TestAlert * alert = [TestAlert alertWithPosition:THAlertViewPositionMid];
    [alert show];
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
