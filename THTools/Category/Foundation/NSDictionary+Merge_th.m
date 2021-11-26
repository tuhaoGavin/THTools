//
//  NSDictionary+Merge_th.m
//  THToolsDemo
//
//  Created by 涂浩 on 2017/2/16.
//  Copyright © 2017年 TuHao. All rights reserved.
//

#import "NSDictionary+Merge_th.h"

@implementation NSDictionary (Merge_th)

/**
 *  @brief  合并两个NSDictionary
 *
 *  @param dict1 NSDictionary
 *  @param dict2 NSDictionary
 *
 *  @return 合并后的NSDictionary
 */
+ (NSDictionary *)th_dictionaryByMerging:(NSDictionary *)dict1 with:(NSDictionary *)dict2 {
    NSMutableDictionary * result = [NSMutableDictionary dictionaryWithDictionary:dict1];
    NSMutableDictionary * resultTemp = [NSMutableDictionary dictionaryWithDictionary:dict1];
    [resultTemp addEntriesFromDictionary:dict2];
    [resultTemp enumerateKeysAndObjectsUsingBlock: ^(id key, id obj, BOOL *stop) {
        if ([dict1 objectForKey:key]) {
            if ([obj isKindOfClass:[NSDictionary class]]) {
                NSDictionary * newVal = [[dict1 objectForKey: key] th_dictionaryByMergingWith: (NSDictionary *) obj];
                [result setObject: newVal forKey: key];
            } else {
                [result setObject: obj forKey: key];
            }
        }
        else if([dict2 objectForKey:key])
        {
            if ([obj isKindOfClass:[NSDictionary class]]) {
                NSDictionary * newVal = [[dict2 objectForKey: key] th_dictionaryByMergingWith: (NSDictionary *) obj];
                [result setObject: newVal forKey: key];
            } else {
                [result setObject: obj forKey: key];
            }
        }
    }];
    return (NSDictionary *) [result mutableCopy];
    
}
/**
 *  @brief  并入一个NSDictionary
 *
 *  @param dict NSDictionary
 *
 *  @return 增加后的NSDictionary
 */
- (NSDictionary *)th_dictionaryByMergingWith:(NSDictionary *)dict {
    return [[self class] th_dictionaryByMerging:self with: dict];
}

#pragma mark - Manipulation
- (NSDictionary *)th_dictionaryByAddingEntriesFromDictionary:(NSDictionary *)dictionary {
    NSMutableDictionary *result = [self mutableCopy];
    [result addEntriesFromDictionary:dictionary];
    return result;
}

- (NSDictionary *)th_dictionaryByRemovingEntriesWithKeys:(NSSet *)keys {
    NSMutableDictionary *result = [self mutableCopy];
    [result removeObjectsForKeys:keys.allObjects];
    return result;
}

@end
