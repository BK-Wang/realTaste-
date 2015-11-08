//
//  FoodDetailViewController.h
//  匠人
//
//  Created by BK on 15/11/2.
//  Copyright © 2015年 bk. All rights reserved.
//

#import "ListViewController.h"

@interface FoodDetailViewController : ListViewController
@property (nonatomic,copy) NSString *foodId;
@property (nonatomic,copy) NSString *cityName;
@end
