//
//  HotelDetailViewController.h
//  匠人
//
//  Created by BK on 15/11/2.
//  Copyright © 2015年 bk. All rights reserved.
//

#import "ListViewController.h"

typedef void(^HotelDetailBlock)();
@interface HotelDetailViewController : ListViewController
@property (nonatomic,copy) NSString *hotelId;
@property (nonatomic,copy) NSString *hotelName;
@property (nonatomic,copy) HotelDetailBlock block;
@end
