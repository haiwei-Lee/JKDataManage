//
//  Student.m
//  JKDataManage
//
//  Created by bingjie-macbookpro on 15/5/24.
//  Copyright (c) 2015年 Bingjie. All rights reserved.
//

#import "Student.h"

@implementation Student


- (void)save
{
    [[JKDatabaseManager sharedInstance] saveAObject:[self convertedToJson] withId:[@(self.uid) stringValue] intoTable:[[self class] tableName]];
}

+ (void)saveEntityList:(NSArray*)array byMainKey:(NSString*)key
{
    NSMutableArray *tempArray = @[].mutableCopy;
    for (Student *temp in array) {
        [tempArray addObject:[temp convertedToJson]];
    }
    [[JKDatabaseManager sharedInstance]saveAObject:tempArray withId:key intoTable:[[self class] tableName]];
}

+ (NSArray*)getEntityListByMainKey:(NSString*)key
{
    NSArray *array = [[JKDatabaseManager sharedInstance] getObjectById:key fromTable:[[self class] tableName]];
    NSMutableArray *temp = [NSMutableArray array];
    for (NSDictionary *dict in array) {
        Student *item = [[self class] convertedToEntityByJsonObjc:dict];
        if (!item) {
            continue;
        }
        [temp addObject:item];
    }
    return temp;
}


+ (id)getObjcByid:(NSString*)objc_id
{
    NSDictionary *info = [[JKDatabaseManager sharedInstance] getObjectById:objc_id fromTable:[[self class] tableName]];
    Student *temp = [[self class] convertedToEntityByJsonObjc:info];
    return temp;
}

+ (NSArray*)getAllObjects
{
    NSArray *array = [[JKDatabaseManager sharedInstance] getAllObjcFromTable:[[self class] tableName]];
    NSMutableArray *all = @[].mutableCopy;
    for (YTKKeyValueItem * item in array) {
        NSDictionary *info = item.itemObject;
        Student *temp = [[self class] convertedToEntityByJsonObjc:info];
        if (temp) {
            [all addObject:temp];
        }
    }
    return all;
}


@end
