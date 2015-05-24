//
//  JKDatabaseManager.h
//  JKDataManage
//
//  Created by bingjie-macbookpro on 15/5/23.
//  Copyright (c) 2015年 Bingjie. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YTKKeyValueStore.h"

@class FMDatabaseQueue;
@class FMDatabase;

@interface JKDatabaseManager : NSObject

+ (JKDatabaseManager *)sharedInstance;


/**
 *  创建一个表
 *
 *  @param name 表名字
 */
- (void)createTableWithEntityName:(NSString*)name;


/**
 *  存储一个json对象
 *
 *  @param jsonObjc  JSON对象
 *  @param objectId  主键
 *  @param tableName 表名
 */
- (void)saveAObject:(id)jsonObjc withId:(NSString*)objectId intoTable:(NSString*)tableName;


/**
 *  查询一个json对象
 *
 *  @param objectId  主键
 *  @param tableName 表名
 *
 *  @return JSON Object
 */
- (id)getObjectById:(NSString*)objectId fromTable:(NSString*)tableName;


/**
 *  获取 一个表内的 所有信息
 *
 *  @param tableName 表名
 *
 *  @return JSON Objects
 */
- (NSArray *)getAllObjcFromTable:(NSString *)tableName;

/**
 *  根据id 删除一条数据
 *
 *  @param objectId  主键
 *  @param tableName 表名
 */
- (void)deleteObjectById:(NSString*)objectId fromTable:(NSString *)tableName;


/**
 *  清空一张表
 *
 *  @param tableName 表名
 */
- (void)clearTable:(NSString*)tableName;

@end



@interface YTKKeyValueStore (YTKKeyValueStoreAdditions)

- (FMDatabaseQueue*)databaseQueue;

- (FMDatabase*)database;

@end
