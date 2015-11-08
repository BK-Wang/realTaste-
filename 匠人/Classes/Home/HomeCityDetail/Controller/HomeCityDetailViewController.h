//
//  HomeCityDetailViewController.h
//  匠人
//
//  Created by BK on 15/11/2.
//  Copyright © 2015年 bk. All rights reserved.
//

#import "ListViewController.h"

typedef void(^HomeCityDetailBlock)();
@interface HomeCityDetailViewController : ListViewController
@property (nonatomic,copy) NSString *cityId;
@property (nonatomic,copy) NSString *cityName;
@property (nonatomic,copy) HomeCityDetailBlock block;
@end
