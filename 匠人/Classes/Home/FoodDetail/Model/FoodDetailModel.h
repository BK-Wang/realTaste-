//
//  FoodDetailModel.h
//  匠人
//
//  Created by BK on 15/11/2.
//  Copyright © 2015年 bk. All rights reserved.
//

#import "JSONModel.h"

@protocol FoodListModel <NSObject>

@end

@interface FoodListModel : JSONModel
@property (nonatomic,copy) NSString<Optional> *cover;
@property (nonatomic,copy) NSString<Optional> *sum;
@property (nonatomic,copy) NSString<Optional> *_id;
@property (nonatomic,copy) NSString<Optional> *name;
@end

@interface FoodDetailModel : JSONModel
@property (nonatomic,copy) NSString<Optional> *imgs;
@property (nonatomic,copy) NSString<Optional> *title;
@property (nonatomic,copy) NSString<Optional> *sum;
@property (nonatomic,copy) NSArray<Optional,FoodListModel> *list;
@end
