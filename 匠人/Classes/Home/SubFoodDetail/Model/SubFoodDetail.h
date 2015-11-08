//
//  SubFoodDetail.h
//  匠人
//
//  Created by BK on 15/11/3.
//  Copyright © 2015年 bk. All rights reserved.
//

#import "JSONModel.h"

@interface SubFoodDetail : JSONModel
@property (nonatomic,copy) NSString<Optional> *reason;
@property (nonatomic,copy) NSString<Optional> *taste;
@property (nonatomic,copy) NSString<Optional> *material;
@property (nonatomic,copy) NSString<Optional> *desc;
@property (nonatomic,copy) NSArray<Optional> *imgs;
@end
