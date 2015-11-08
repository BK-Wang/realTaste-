//
//  FoodRecordViewController.h
//  匠人
//
//  Created by BK on 15/11/4.
//  Copyright © 2015年 bk. All rights reserved.
//

#import "ListViewController.h"

typedef void(^FoodRecordBlock)();
@interface FoodRecordViewController : ListViewController
@property (nonatomic,copy) NSString *foodId;
@property (nonatomic,copy) NSString *imageName;
@property (nonatomic,copy) FoodRecordBlock block;
@end
