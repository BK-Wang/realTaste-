//
//  HomeTopCell.h
//  匠人
//
//  Created by BK on 15/11/1.
//  Copyright © 2015年 bk. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeModel.h"

typedef void(^TopCellBlock)(NSInteger tag);
@interface HomeTopCell : UITableViewCell
@property (nonatomic,copy) NSArray *contentArray;
@property (nonatomic,copy) TopCellBlock block;
@end
