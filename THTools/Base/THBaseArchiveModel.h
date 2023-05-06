//
//  THBaseArchiveModel.h
//  THToolsDemo
//
//  Created by 涂浩 on 2017/7/27.
//  Copyright © 2017年 TuHao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface THBaseArchiveModel : NSObject

+ (instancetype)shared;
- (void)archive;
- (void)deleteData;

//- (instancetype)init __attribute__((deprecated));
//+ (instancetype)new NS_UNAVAILABLE;
@end
