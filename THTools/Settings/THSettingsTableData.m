//
//  THSettingsTableData.m
//  THSettingsDemo
//
//  Created by 涂浩 on 2017/12/15.
//  Copyright © 2017年 TuHao. All rights reserved.
//

#import "THSettingsTableData.h"


#define DefaultUIHeaderHeight  0.01f
#define DefaultUIFooterHeight  0.01f

/************************* Section **************************/
@implementation THSettingsTableSection

- (instancetype) initWithDict:(NSDictionary *)dict{
    if ([dict[Disable] boolValue]) {
        return nil;
    }
    self = [super init];
    if (self) {
        _headerTitle = dict[HeaderTitle];
        _footerTitle = dict[FooterTitle];
        _uiFooterHeight = [dict[FooterHeight] floatValue];
        _uiHeaderHeight = [dict[HeaderHeight] floatValue];
        _uiHeaderHeight = _uiHeaderHeight ? _uiHeaderHeight : DefaultUIHeaderHeight;
        _uiFooterHeight = _uiFooterHeight ? _uiFooterHeight : DefaultUIFooterHeight;
        _rows = [THSettingsTableRow rowsWithData:dict[RowContent]];
    }
    return self;
}

+ (NSArray *)sectionsWithData:(NSArray *)data{
    NSMutableArray *array = [[NSMutableArray alloc] initWithCapacity:data.count];
    for (NSDictionary *dict in data) {
        if ([dict isKindOfClass:[NSDictionary class]]) {
            THSettingsTableSection * section = [[THSettingsTableSection alloc] initWithDict:dict];
            if (section) {
                [array addObject:section];
            }
        }
    }
    return array;
}

@end

/************************* Row **************************/
@implementation THSettingsTableRow

- (instancetype) initWithDict:(NSDictionary *)dict{
    if ([dict[Disable] boolValue]) {
        return nil;
    }
    self = [super init];
    if (self) {
        _title                  = dict[Title];
        _titleColor             = dict[TitleColor];
        _titleFont              = [dict[TitleFont] integerValue];
        _detailTitle            = dict[DetailTitle];
        _detailFont             = [dict[DetailFont] floatValue];
        _detailColor            = dict[DetailColor];
        _image                  = dict[Image];
        _cellClassName          = dict[CellClass];
        _cellActionName         = dict[CellAction];
        _extraActionName        = dict[ExtraAction];
        _keyCode                = [dict[KeyCode] integerValue];
        _uiRowHeight            = [dict[RowHeight] floatValue];
        _uiEstimatedRowHeight   = [dict[EstimatedRowHeight] floatValue];
        _extraInfo              = dict[ExtraInfo];
        _showAccessory          = [dict[ShowAccessory] boolValue];
        _forbidSelect           = [dict[ForbidSelect] boolValue];
        _showRedPoint           = [dict[ShowRedPoint] boolValue];
    }
    return self;
}

+ (NSArray *)rowsWithData:(NSArray *)data{
    NSMutableArray *array = [[NSMutableArray alloc] initWithCapacity:data.count];
    for (NSDictionary *dict in data) {
        if ([dict isKindOfClass:[NSDictionary class]]) {
            THSettingsTableRow * row = [[THSettingsTableRow alloc] initWithDict:dict];
            if (row) {
                [array addObject:row];
            }
        }
    }
    return array;
}

@end
