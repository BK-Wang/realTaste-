//
//  HotelDetailModel.h
//  匠人
//
//  Created by BK on 15/11/3.
//  Copyright © 2015年 bk. All rights reserved.
//

#import "JSONModel.h"

@protocol HotelListModel <NSObject>

@end

@interface HotelListModel : JSONModel
@property (nonatomic,copy) NSString<Optional> *cover;
@property (nonatomic,copy) NSString<Optional> *_id;
@property (nonatomic,copy) NSString<Optional> *name;
@property (nonatomic,copy) NSString<Optional> *summary;
@end

@interface HotelDetailModel : JSONModel
@property (nonatomic,copy) NSArray<Optional> *imgs;/**< 轮播页 */
@property (nonatomic,copy) NSString<Optional> *address;/**< 中文地址 */
@property (nonatomic,copy) NSString<Optional> *address_origin;/**< 英文地址 */
@property (nonatomic,copy) NSString<Optional> *cost;/**< 人均 */
@property (nonatomic,copy) NSString<Optional> *open_time;/**< 营业时间 */
@property (nonatomic,copy) NSString<Optional> *name_origin;/**< 酒店英文名 */
@property (nonatomic,copy) NSString<Optional> *phone;/**< 联系电话 */
@property (nonatomic,copy) NSString<Optional> *reason;/**< 推荐理由 */
@property (nonatomic,copy) NSString<Optional> *desc;/**< 查看更多 */
@property (nonatomic,copy) NSArray<Optional,HotelListModel> *list;
@end
