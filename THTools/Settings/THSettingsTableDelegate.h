//
//  THSettingsTableDelegate.h
//  THSettingsDemo
//
//  Created by 涂浩 on 2017/12/15.
//  Copyright © 2017年 TuHao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface THSettingsTableDelegate : NSObject<UITableViewDelegate, UITableViewDataSource>

- (instancetype) initWithTableData:(NSArray *(^)(void))data;

@property (nonatomic, assign) BOOL separaterAlignLeft; //分割线左对齐

@property (nonatomic, assign) CGFloat defaultCellHeight; //默认55.0

@end
