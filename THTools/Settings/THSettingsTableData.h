//
//  THSettingsTableData.h
//  THSettingsDemo
//
//  Created by weixb on 2017/12/15.
//  Copyright © 2017年 weixb. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

//section key
#define HeaderTitle  @"headerTitle"
#define FooterTitle  @"footerTitle"
#define HeaderHeight @"headerHeight"
#define FooterHeight @"footerHeight"
#define RowContent   @"row"

//row key
#define Title                @"title"
#define TitleColor           @"titleColor"
#define TitleFont            @"titleFont"
#define DetailTitle          @"detailTitle"
#define DetailFont           @"detailFont"
#define DetailColor          @"detailColor"
#define Image                @"image"
#define CellClass            @"cellClass"
#define CellAction           @"cellAction"
#define ExtraAction          @"extraAction"
#define KeyCode              @"keyCode"
#define ExtraInfo            @"extraInfo"
#define RowHeight            @"rowHeight"
#define EstimatedRowHeight   @"estimatedRowHeight"
#define ShowRedPoint         @"redPoint"

//common key
#define Disable       @"disable"      //cell不可见
#define ShowAccessory @"accessory"    //cell显示>箭头
#define ForbidSelect  @"forbidSelect" //cell不响应select事件


/************************* Section **************************/
@interface THSettingsTableSection : NSObject

@property (nonatomic,copy  ) NSArray  *rows;
@property (nonatomic,copy  ) NSString *headerTitle;
@property (nonatomic,copy  ) NSString *footerTitle;
@property (nonatomic,assign) CGFloat  uiHeaderHeight;
@property (nonatomic,assign) CGFloat  uiFooterHeight;

- (instancetype) initWithDict:(NSDictionary *)dict;
+ (NSArray *)sectionsWithData:(NSArray *)data;

@end

/************************* Row **************************/
@interface THSettingsTableRow : NSObject

@property (nonatomic,strong ) NSString *title;
@property (nonatomic,strong ) NSString *titleColor;
@property (nonatomic,assign ) NSInteger titleFont;
@property (nonatomic,copy   ) NSString *detailTitle;
@property (nonatomic, assign) CGFloat  detailFont;
@property (nonatomic,strong ) NSString *detailColor;
@property (nonatomic, strong) UIImage  *image;
@property (nonatomic,copy   ) NSString *cellClassName;
@property (nonatomic,copy   ) NSString *cellActionName;
@property (nonatomic,copy   ) NSString *extraActionName;
@property (nonatomic, assign) NSInteger keyCode;
@property (nonatomic,assign ) CGFloat  uiRowHeight;
@property (nonatomic,assign ) CGFloat  uiEstimatedRowHeight;
@property (nonatomic,assign ) BOOL     showAccessory;
@property (nonatomic,assign ) BOOL     forbidSelect;
@property (nonatomic, assign) BOOL     showRedPoint;
@property (nonatomic,strong ) id       extraInfo;

- (instancetype) initWithDict:(NSDictionary *)dict;
+ (NSArray *)rowsWithData:(NSArray *)data;

@end
