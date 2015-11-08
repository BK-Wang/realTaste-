//
//  FoodRecordModel.h
//  匠人
//
//  Created by BK on 15/11/4.
//  Copyright © 2015年 bk. All rights reserved.
//

#import "JSONModel.h"

@protocol FoodContentModel <NSObject>
@end

@interface FoodContentModel : JSONModel
@property (nonatomic,copy) NSString<Optional> *desc;/**< 图片描述 */
@property (nonatomic,copy) NSString<Optional> *ratio;/**< 图片比例 */
@property (nonatomic,copy) NSString<Optional> *_id;
@property (nonatomic,copy) NSString<Optional> *type;/**< 类型 */
@property (nonatomic,copy) NSString<Optional> *value;/**< 图片 */
@end

@interface FoodRecordModel : JSONModel
@property (nonatomic,copy) NSString<Optional> *title;/**< 头部标题 */
@property (nonatomic,copy) NSString<Optional> *uname;/**< 用户名 */
@property (nonatomic,copy) NSString<Optional> *ctime;/**< 时间 */
@property (nonatomic,copy) NSString<Optional> *header;/**< 用户头像 */
@property (nonatomic,copy) NSString<Optional> *cover;/**< 头部背景图 */
@property (nonatomic,copy) NSString<Optional> *city;/**< 城市 */
@property (nonatomic,copy) NSString<Optional> *cost;/**< 人均 */
@property (nonatomic,copy) NSString<Optional> *rest;/**< 餐厅 */
@property (nonatomic,copy) NSString<Optional> *number;/**< 人数 */
@property (nonatomic,copy) NSArray<Optional,FoodContentModel> *content;/**< 内容 */
@end
