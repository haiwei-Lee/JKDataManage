//
//  Student.h
//  JKDataManage
//
//  Created by bingjie-macbookpro on 15/5/24.
//  Copyright (c) 2015年 Bingjie. All rights reserved.
//

#import "BaseObject.h"

@interface Student : BaseObject

@property (nonatomic, assign) NSInteger         uid;
@property (nonatomic, copy) NSString            *name;
@property (nonatomic, assign) NSInteger         age;
@property (nonatomic, assign) NSInteger         gender;
@property (nonatomic, assign) NSInteger         score;

@end
