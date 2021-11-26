//
//  UITableView+Initialize.m
//  Single
//
//  Created by 涂浩 on 2020/1/6.
//  Copyright © 2020 lobochat. All rights reserved.
//

#import "UITableView+Initialize.h"
#import "SwizzlingDefine.h"
@implementation UITableView (Initialize)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        swizzling_exchangeMethod([UITableView class], @selector(initWithFrame:style:), @selector(swizzling_initWithFrame:style:));
    });
}

- (instancetype)swizzling_initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    UITableView * tableView = [self swizzling_initWithFrame:frame style:style];
    //处理刷新闪动问题
    tableView.estimatedRowHeight = 0;
    //处理设置sectionHeaderHeight与sectionFooterHeight不生效问题
    tableView.estimatedSectionHeaderHeight = 0;
    tableView.estimatedSectionFooterHeight = 0;
    if (@available(iOS 15.0, *)) {
        tableView.sectionHeaderTopPadding = 0;
    }
    return tableView;
}

@end
