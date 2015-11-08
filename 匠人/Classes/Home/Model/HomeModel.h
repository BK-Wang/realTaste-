//
//  HomeModel.h
//  匠人
//
//  Created by BK on 15/10/31.
//  Copyright © 2015年 bk. All rights reserved.
//

#import "JSONModel.h"

@protocol ContentModel <NSObject>
@end

@protocol ListModel <NSObject>
@end

@interface ContentModel : JSONModel
@property (nonatomic,copy) NSString<Optional> *cover;/**< 图片 */
@property (nonatomic,copy) NSString<Optional> *_id;
@property (nonatomic,copy) NSString<Optional> *name;/**< 城市 */
@property (nonatomic,copy) NSString<Optional> *state;/**<  */
@property (nonatomic,copy) NSString<Optional> *summary;
@property (nonatomic,copy) NSString<Optional> *url;

@property (nonatomic,copy) NSString<Optional> *city;/**< 第三个cell的城市 */
@property (nonatomic,copy) NSString<Optional> *header;/**< 用户头像 */
@property (nonatomic,copy) NSString<Optional> *uid;/**< 用户id */
@property (nonatomic,copy) NSString<Optional> *uname;/**< 用户名 */
@end

@interface ListModel : JSONModel
@property (nonatomic,copy) NSArray<Optional,ContentModel> *content;
@property (nonatomic,copy) NSString<Optional> *subtitle;
@property (nonatomic,copy) NSString<Optional> *title;
@end

@interface HomeModel : JSONModel
@property (nonatomic,copy) NSArray<Optional,ListModel> *list;
@end
