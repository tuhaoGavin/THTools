//
//  THBaseArchiveModel.h
//  THToolsDemo
//
//  Created by weixb on 2017/7/27.
//  Copyright © 2017年 weixb. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface THBaseArchiveModel : NSObject

+ (instancetype)sharedModel;
- (void)archive;
- (void)deleteData;

@end
