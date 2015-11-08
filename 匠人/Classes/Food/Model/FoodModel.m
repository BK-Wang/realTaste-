//
//  FoodModel.m
//  匠人
//
//  Created by BK on 15/11/2.
//  Copyright © 2015年 bk. All rights reserved.
//

#import "FoodModel.h"

@implementation FoodModel
+(JSONKeyMapper *)keyMapper {
    return [[JSONKeyMapper alloc] initWithDictionary:@{@"author.header":@"header",@"author.uid":@"uid",@"author.uname":@"uname",@"id":@"_id"}];
}
@end
