//
//  FoodDetailModel.m
//  匠人
//
//  Created by BK on 15/11/2.
//  Copyright © 2015年 bk. All rights reserved.
//

#import "FoodDetailModel.h"

@implementation FoodListModel
+ (JSONKeyMapper *)keyMapper {
    return [[JSONKeyMapper alloc] initWithDictionary:@{@"id":@"_id"}];
}
@end

@implementation FoodDetailModel
+ (JSONKeyMapper *)keyMapper {
    return [[JSONKeyMapper alloc] initWithDictionary:@{@"dish.imgs":@"imgs",@"dish.sum":@"sum",@"dish.title":@"title"}];
}
@end
