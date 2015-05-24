//
//  ViewController.m
//  JKDataManage
//
//  Created by bingjie-macbookpro on 15/5/23.
//  Copyright (c) 2015年 Bingjie. All rights reserved.
//

#import "ViewController.h"
#import "Student.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self saveEntityArray];
    
    [self saveSingleEntity];

}

- (void)saveEntityArray
{
    NSMutableArray *boyArray = @[].mutableCopy;
    NSMutableArray *girlArray = @[].mutableCopy;
    for (NSInteger i = 0; i < 80; i++) {
        Student *temp = [[Student alloc]init];
        temp.name = [NSString stringWithFormat:@"学生%ld",i + 100];
        temp.uid = i + 1000;
        temp.score = ( arc4random() % 100) + 50;
        temp.gender = ( arc4random() % 2);
        temp.age = ( arc4random() % 3) + 10;
        
        if (temp.gender) {
            [boyArray addObject:temp];
        }else{
            [girlArray addObject:temp];
        }
    }
    
    [Student saveEntityList:girlArray byMainKey:@"girlList"];
    [Student saveEntityList:boyArray byMainKey:@"boyList"];
    
    NSArray *boyDatabase = [Student getEntityListByMainKey:@"boyList"];
    NSArray *girlDatabase = [Student getEntityListByMainKey:@"girlList"];
    
    [boyDatabase enumerateObjectsUsingBlock:^(Student *obj, NSUInteger idx, BOOL *stop) {
        NSLog(@"男学生 %@",[obj description]);
    }];
    
    [girlDatabase enumerateObjectsUsingBlock:^(Student *obj, NSUInteger idx, BOOL *stop) {
        NSLog(@"女学生 %@",[obj description]);
    }];
}

- (void)saveSingleEntity
{
    NSMutableArray *datasource = @[].mutableCopy;
    
    [Student clearTable];
    for (NSInteger i = 0; i < 30; i++) {
        Student *temp = [[Student alloc]init];
        temp.name = [NSString stringWithFormat:@"学生%ld",i + 100];
        temp.uid = i + 1000;
        temp.score = ( arc4random() % 100) + 50;
        temp.gender = ( arc4random() % 2);
        temp.age = ( arc4random() % 3) + 10;
        [temp save];
        [datasource addObject:temp];
    }
    
    NSArray *databaseArray = [Student getAllObjects];
    [databaseArray enumerateObjectsUsingBlock:^(Student *obj, NSUInteger idx, BOOL *stop) {
        NSLog(@"%@",[obj description]);
    }];
    
    NSLog(@"getObjcByid %@",[[Student getObjcByid:[@(1001) stringValue]] description]);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
