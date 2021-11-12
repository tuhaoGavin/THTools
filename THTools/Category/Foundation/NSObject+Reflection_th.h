//
//  NSObject+Reflection_th.h
//  THToolsDemo
//
//  Created by weixb on 2017/2/16.
//  Copyright © 2017年 weixb. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Reflection_th)

//类名
- (NSString *)th_className;
+ (NSString *)th_className;
//父类名称
- (NSString *)th_superClassName;
+ (NSString *)th_superClassName;

//实例属性字典
- (NSDictionary *)th_propertyDictionary;

//属性名称列表
- (NSArray*)th_propertyKeys;
+ (NSArray *)th_propertyKeys;

//属性详细信息列表
- (NSArray *)th_propertiesInfo;
+ (NSArray *)th_propertiesInfo;

//格式化后的属性列表
+ (NSArray *)th_propertiesWithCodeFormat;

//方法列表
- (NSArray*)th_methodList;
+ (NSArray*)th_methodList;

- (NSArray*)th_methodListInfo;

//创建并返回一个指向所有已注册类的指针列表
+ (NSArray *)th_registedClassList;
//实例变量
+ (NSArray *)th_instanceVariable;

//协议列表
-(NSDictionary *)th_protocolList;
+ (NSDictionary *)th_protocolList;


- (BOOL)th_hasPropertyForKey:(NSString*)key;
- (BOOL)th_hasIvarForKey:(NSString*)key;

@end
