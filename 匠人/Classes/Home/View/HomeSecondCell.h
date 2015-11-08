//
//  HomeSecondCell.h
//  匠人
//
//  Created by BK on 15/11/2.
//  Copyright © 2015年 bk. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeModel.h"

typedef void(^SecondCellBlock)(NSString *cityName,NSString *_id,NSInteger index);
@interface HomeSecondCell : UITableViewCell
@property (nonatomic,copy) NSArray *contentArray;
@property (nonatomic,strong) ListModel *model;
@property (nonatomic,copy) SecondCellBlock block;
@end
