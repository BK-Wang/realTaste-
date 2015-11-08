//
//  CityDetailTopCell.h
//  匠人
//
//  Created by BK on 15/11/2.
//  Copyright © 2015年 bk. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^CityDetailBlock)(NSString *foodId);
@interface CityDetailTopCell : UITableViewCell
@property (nonatomic,copy) NSArray *dishList;
@property (nonatomic,copy) CityDetailBlock block;
@end
