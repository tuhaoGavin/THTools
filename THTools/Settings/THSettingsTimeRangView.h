//
//  THSettingsTimeRangView.h
//  THSettingsDemo
//
//  Created by 涂浩 on 2017/12/18.
//  Copyright © 2017年 TuHao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface THSettingsTimeRangView : UIView

@property (nonatomic, copy) void(^sureBtnBlock)(NSString *value, NSInteger startH, NSInteger endH);
@property (nonatomic, copy) void(^cancelBtnBlock)(void);

- (instancetype)initStartRow:(NSInteger)startRow endRow:(NSInteger)endRow;

@end
