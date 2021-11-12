//
//  WeakWrapper.h
//  Single
//
//  Created by 涂浩 on 2019/12/31.
//  Copyright © 2019 lobochat. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface THWeakWrapper : NSObject
@property (nonatomic, weak) id obj;

@end

NS_ASSUME_NONNULL_END
