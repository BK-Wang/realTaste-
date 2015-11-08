//
//  CountryDetailModel.h
//  匠人
//
//  Created by BK on 15/11/3.
//  Copyright © 2015年 bk. All rights reserved.
//

#import "JSONModel.h"

@interface CountryDetailModel : JSONModel
@property (nonatomic,copy) NSString<Optional> *city;
@property (nonatomic,copy) NSString<Optional> *_id;/**< 跳转到酒店详情 */
@property (nonatomic,copy) NSString<Optional> *name;
@property (nonatomic,copy) NSString<Optional> *cover;
@property (nonatomic,copy) NSString<Optional> *desc;
@end
