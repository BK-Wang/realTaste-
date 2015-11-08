//
//  FoodRecordModel.m
//  匠人
//
//  Created by BK on 15/11/4.
//  Copyright © 2015年 bk. All rights reserved.
//

#import "FoodRecordModel.h"

@implementation FoodContentModel
+ (JSONKeyMapper *)keyMapper {
    return [[JSONKeyMapper alloc] initWithDictionary:@{@"id":@"_id",@"ext.desc":@"desc",@"ext.ratio":@"ratio"}];
}

@end

@implementation FoodRecordModel
+ (JSONKeyMapper *)keyMapper {
    return [[JSONKeyMapper alloc] initWithDictionary:@{@"author.header":@"header",@"author.uname":@"uname"}];
}
@end
