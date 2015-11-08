//
//  FoodModel.h
//  匠人
//
//  Created by BK on 15/11/2.
//  Copyright © 2015年 bk. All rights reserved.
//

#import "JSONModel.h"

@interface FoodModel : JSONModel
@property (nonatomic,copy) NSString<Optional> *header;
@property (nonatomic,copy) NSString<Optional> *uid;/**< 用户id */
@property (nonatomic,copy) NSString<Optional> *uname;
@property (nonatomic,copy) NSString<Optional> *city;
@property (nonatomic,copy) NSString<Optional> *cover;
@property (nonatomic,copy) NSString<Optional> *_id;/**< 跳转id */
@property (nonatomic,copy) NSString<Optional> *name;
@end
