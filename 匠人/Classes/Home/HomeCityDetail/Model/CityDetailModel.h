//
//  CityDetailModel.h
//  匠人
//
//  Created by BK on 15/11/2.
//  Copyright © 2015年 bk. All rights reserved.
//

#import "JSONModel.h"
@protocol listModel <NSObject>
@end

@protocol dishlistModel <NSObject>
@end

@interface listModel : JSONModel
@property (nonatomic,copy) NSString<Optional> *cover;
@property (nonatomic,copy) NSString<Optional> *_id;
@property (nonatomic,copy) NSString<Optional> *name;
@property (nonatomic,copy) NSString<Optional> *summary;
@end

@interface dishlistModel : JSONModel
@property (nonatomic,copy) NSString<Optional> *cover;
@property (nonatomic,copy) NSString<Optional> *_id;
@property (nonatomic,copy) NSString<Optional> *name;
@property (nonatomic,copy) NSString<Optional> *sum;
@end

@interface CityDetailModel : JSONModel
@property (nonatomic,copy) NSArray<Optional,dishlistModel> *dishlist;
@property (nonatomic,copy) NSArray<Optional,listModel> *list;
@property (nonatomic,copy) NSArray<Optional> *imgs;
@end
