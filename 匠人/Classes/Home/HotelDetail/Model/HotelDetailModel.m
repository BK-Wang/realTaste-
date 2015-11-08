//
//  HotelDetailModel.m
//  匠人
//
//  Created by BK on 15/11/3.
//  Copyright © 2015年 bk. All rights reserved.
//

#import "HotelDetailModel.h"

@implementation HotelListModel

+ (JSONKeyMapper *)keyMapper {
    return [[JSONKeyMapper alloc] initWithDictionary:@{@"id":@"_id"}];
}

@end

@implementation HotelDetailModel
+ (JSONKeyMapper *)keyMapper {
    return [[JSONKeyMapper alloc] initWithDictionary:@{@"restinfo.imgs":@"imgs",@"restinfo.address":@"address",@"restinfo.address_origin":@"address_origin",@"restinfo.cost":@"cost",@"restinfo.open_time":@"open_time",@"restinfo.name_origin":@"name_origin",@"restinfo.phone":@"phone",@"restinfo.reason":@"reason",@"restinfo.desc":@"desc"}];
}
@end
