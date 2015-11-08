//
//  CountryDetailModel.m
//  匠人
//
//  Created by BK on 15/11/3.
//  Copyright © 2015年 bk. All rights reserved.
//

#import "CountryDetailModel.h"

@implementation CountryDetailModel
+ (JSONKeyMapper *)keyMapper {
    return [[JSONKeyMapper alloc] initWithDictionary:@{@"id":@"_id"}];
}
@end
