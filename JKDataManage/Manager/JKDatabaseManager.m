//
//  JKDatabaseManager.m
//  JKDataManage
//
//  Created by bingjie-macbookpro on 15/5/23.
//  Copyright (c) 2015年 Bingjie. All rights reserved.
//

#import "JKDatabaseManager.h"
#import "FMDB.h"

@interface JKDatabaseManager ()
@property(nonatomic,strong)YTKKeyValueStore *dataBase;
@property(nonatomic,assign)NSInteger       lastUid;
@end

@implementation JKDatabaseManager

+ (JKDatabaseManager *)sharedInstance
{
    static JKDatabaseManager *controller = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        controller = [[self alloc] init];
    });
    return controller;
}


- (instancetype)init
{
    self = [super init];
    if (self) {
        self.dataBase = [[YTKKeyValueStore alloc] initDBWithName:@"joke_database.db"];
        [self createDefaultTable];
    }
    return self;
}

- (void)createTableWithEntityName:(NSString*)name
{
    if ([[self.dataBase database] tableExists:name]) {
        return;
    }
    [self.dataBase createTableWithName:name];
}

- (void)createDefaultTable
{
    [self.tableNames enumerateObjectsUsingBlock:^(NSString *name, NSUInteger idx, BOOL *stop) {
        [self createTableWithEntityName:name];
    }];
}

- (void)saveAObject:(id)jsonObjc withId:(NSString*)objectId intoTable:(NSString*)tableName
{
    [self createTableWithEntityName:tableName];
    [self.dataBase putObject:jsonObjc withId:objectId intoTable:tableName];
}

- (id)getObjectById:(NSString*)objectId fromTable:(NSString*)tableName
{
    return [self.dataBase getObjectById:objectId fromTable:tableName];
}

- (NSArray *)getAllObjcFromTable:(NSString *)tableName
{
    return [self.dataBase getAllItemsFromTable:tableName];
}

- (void)deleteObjectById:(NSString*)objectId fromTable:(NSString *)tableName
{
    [self.dataBase deleteObjectById:objectId fromTable:tableName];
}

- (void)clearTable:(NSString*)tableName
{
    [self.dataBase clearTable:tableName];
}


@end




@implementation YTKKeyValueStore (YTKKeyValueStoreAdditions)

- (FMDatabaseQueue*)databaseQueue
{
    return [self valueForKey:@"dbQueue"];
}

- (FMDatabase*)database
{
    return [[self databaseQueue] valueForKey:@"_db"];
}

@end
