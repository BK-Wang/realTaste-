//
//  HomeModel.m
//  匠人
//
//  Created by BK on 15/10/31.
//  Copyright © 2015年 bk. All rights reserved.
//

#import "HomeModel.h"

@implementation ContentModel
+(JSONKeyMapper *)keyMapper {
    return [[JSONKeyMapper alloc] initWithDictionary:@{@"id":@"_id",@"author.header":@"header",@"author.uid":@"uid",@"author.uname":@"uname"}];
}
@end

@implementation ListModel

@end

@implementation HomeModel

@end
