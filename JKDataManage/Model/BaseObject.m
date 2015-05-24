//
//  BaseObject.m
//  Orimuse
//
//  Created by Bingjie on 15/1/21.
//  Copyright (c) 2015年 Bingjie. All rights reserved.
//

#import "BaseObject.h"
#import "MJExtension.h"

@implementation BaseObject

+ (void)initialize
{
    [[JKDatabaseManager sharedInstance] createTableWithEntityName:NSStringFromClass([self class])];
}

- (id)convertedToJson
{
    return self.keyValues;
}

+ (id)convertedToEntityByJsonObjc:(id)jsonObjc;
{
    return [[self class] objectWithKeyValues:jsonObjc];
}

- (void)save
{
    NSAssert(NO, @"必须在子类实现 save 方法");
}

+ (void)saveEntityList:(NSArray*)array byMainKey:(NSString*)key
{
    NSAssert(NO, @"必须在子类实现 getEntityListByMainKey:byMainKey: 方法");
}

+ (NSArray*)getEntityListByMainKey:(NSString*)key
{
    NSAssert(NO, @"必须在子类实现 getEntityListByMainKey: 方法");
    return nil;
}

+ (NSArray*)getAllObjects
{
    NSAssert(NO, @"必须在子类实现 getAllObjects 方法");
    return nil;
}

+ (id)getObjcByid:(NSString*)objc_id
{
    NSAssert(NO, @"必须在子类实现 getObjcByid: 方法");
    return nil;
}

+ (void)clearTable
{
    [[JKDatabaseManager sharedInstance] clearTable:[[self class] tableName]];
}

+ (NSString*)tableName
{
    return NSStringFromClass([self class]);
}

+ (NSArray*)saveDataFromHttp:(id)data
{
    NSAssert(NO, @"必须在子类实现 saveDataFromHttp: 方法");
    return nil;
}

- (NSString*)description
{
    id json = [self convertedToJson];
    
    return [[self class] getJSONSStringByJSONObject:json];
}


+ (NSString*)getJSONSStringByJSONObject:(id)jsonObject
{
    NSString *jsonString = nil;
    if ([NSJSONSerialization isValidJSONObject:jsonObject]) {
        NSData *data = [NSJSONSerialization dataWithJSONObject:jsonObject options:NSJSONWritingPrettyPrinted error:nil];
        jsonString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    }
    return jsonString;
}

@end
