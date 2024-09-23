//
//  UITableView+Initialize.m
//  Single
//
//  Created by 涂浩 on 2020/1/6.
//  Copyright © 2020 lobochat. All rights reserved.
//

#import "UITableView+Initialize.h"
#import "SwizzlingDefine.h"
#import "UIView+Radius_th.h"
@implementation UITableView (Initialize)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        swizzling_exchangeMethod([UITableView class], @selector(initWithFrame:style:), @selector(swizzling_initWithFrame:style:));
        swizzling_exchangeMethod([UITableView class], @selector(initWithCoder:), @selector(swizzling_initWithCoder:));
        swizzling_exchangeMethod([UITableView class], @selector(layoutSubviews), @selector(swizzling_layoutSubviews));
    });
}

- (instancetype)swizzling_initWithCoder:(NSCoder *)coder {
    UITableView * tableView = [self swizzling_initWithCoder:coder];
    [tableView th_initialize];
    return tableView;
}

- (instancetype)swizzling_initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    UITableView * tableView = [self swizzling_initWithFrame:frame style:style];
    //处理刷新闪动问题
    [tableView th_initialize];
    return tableView;
}

- (void)th_initialize {
    //处理刷新闪动问题
//    self.estimatedRowHeight = 0;
    //处理设置sectionHeaderHeight与sectionFooterHeight不生效问题
    self.estimatedSectionHeaderHeight = 0;
    self.estimatedSectionFooterHeight = 0;
    if (@available(iOS 15.0, *)) {
        self.sectionHeaderTopPadding = 0;
    }
}

- (void)swizzling_layoutSubviews {
    if (self.superview.window) {
        [self swizzling_layoutSubviews];
    }
}

- (void)cornerRadiusWithCell:(UITableViewCell *)cell
                     radius:(NSInteger)radius
                  indexPath:(nonnull NSIndexPath *)indexPath {
    NSInteger rowsNum = [self numberOfRowsInSection:indexPath.section];
    if (rowsNum == 1) {
        [cell radiusWithRadius:radius corner:UIRectCornerAllCorners];
    } else {
        if (indexPath.row == 0) {
            [cell radiusWithRadius:radius corner:UIRectCornerTopLeft|UIRectCornerTopRight];
        } else if (indexPath.row == rowsNum - 1) {
            [cell radiusWithRadius:radius corner:UIRectCornerBottomLeft|UIRectCornerBottomRight];
        } else {
            [cell radiusWithRadius:0 corner:UIRectCornerBottomLeft|UIRectCornerBottomRight];
        }
    }
    
}

@end
