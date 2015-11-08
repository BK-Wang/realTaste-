//
//  CountryDetailCell.h
//  匠人
//
//  Created by BK on 15/11/3.
//  Copyright © 2015年 bk. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CountryDetailModel.h"
@interface CountryDetailCell : UITableViewCell
@property (nonatomic,strong) CountryDetailModel *model;
@property (nonatomic, weak) UILabel *descLabel;;
@end
