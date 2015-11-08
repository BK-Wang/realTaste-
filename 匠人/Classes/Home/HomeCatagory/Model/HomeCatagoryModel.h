//
//  HomeCatagoryModel.h
//  匠人
//
//  Created by BK on 15/11/2.
//  Copyright © 2015年 bk. All rights reserved.
//

#import "JSONModel.h"

@protocol CatagoryContentModel <NSObject>
@end

@interface CatagoryContentModel : JSONModel
@property (nonatomic,copy) NSString<Optional> *_id;
@property (nonatomic,copy) NSString<Optional> *img;
@property (nonatomic,copy) NSString<Optional> *name;
@end

@interface HomeCatagoryModel : JSONModel
@property (nonatomic,copy) NSArray<Optional,CatagoryContentModel> *content;
@property (nonatomic,copy) NSString<Optional> *img;
@property (nonatomic,copy) NSString<Optional> *title;

@end
