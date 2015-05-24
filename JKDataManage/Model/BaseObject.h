//
//  BaseObject.h
//  Orimuse
//
//  Created by Bingjie on 15/1/21.
//  Copyright (c) 2015年 Bingjie. All rights reserved.
//




#import <Foundation/Foundation.h>
#import "YTKKeyValueStore.h"
#import "JKDatabaseManager.h"


/**
 *  BaseObject 为所有实体的基类，所有数据存储必须继承基类方法实现
 *  其中JSON <-> Model , 默认使用 MJExtension ，也可在子类自行实现
 
 *  数据存储方式分为两种
    1:      save 方法可以存单个实体
    2：     saveEntityList:byMainKey: 方法可存一个一组实体，根据实际需求自行使用
 *
 */

@interface BaseObject : NSObject

/**
 *  扩展字段 , 非特殊情况不得使用
 */
@property (nonatomic, strong) NSDictionary  *extParameter;

/**
 *  模型转化为JSON,默认使用MJExtension
 *
 *  @return JSON
 */
- (id)convertedToJson;

/**
 *  JSON转化为一个实体,默认使用MJExtension
 *
 *  @param jsonObjc json array or dictionary
 *
 *  @return 实体
 */
+ (id)convertedToEntityByJsonObjc:(id)jsonObjc;

/**
 *  保存一个模型数据，必须在子类实现
 */
- (void)save;


/**
 *  存储一个实体数组
 *
 *  @param array 实体数组
 *  @param key   主键
 */
+ (void)saveEntityList:(NSArray*)array byMainKey:(NSString*)key;

/**
 *  根据主键获取一个实体数组
 *
 *  @param key 主键
 *
 *  @return 实体数组
 */
+ (NSArray*)getEntityListByMainKey:(NSString*)key;

/**
 *  获取当前模型的所有存储在数据库的信息
 *
 *  @return 实体数组
 */
+ (NSArray*)getAllObjects;

/**
 *  根据id查询数据库，并返回一个实体
 *
 *  @param objc_id 主键
 *
 *  @return 实体
 */
+ (id)getObjcByid:(NSString*)objc_id;

/**
 *  清空一张表
 */
+ (void)clearTable;

/**
 *  表名 , 默认使用类名作为表名，可在子类继承修改
 *
 *  @return 表名
 */
+ (NSString*)tableName;

/**
 *  解析服务器数据，一般用于列表形式的数据解析使用
 *
 *  @param data 服务器返回的dada
 *
 *  @return 实体数组
 */
+ (NSArray*)saveDataFromHttp:(id)data;

@end
