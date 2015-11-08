//
//  CityDetailSecondCell.h
//  匠人
//
//  Created by BK on 15/11/2.
//  Copyright © 2015年 bk. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CityDetailModel.h"
#import "FoodDetailModel.h"
@interface CityDetailSecondCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *bgimageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *descLabel;
@property (weak, nonatomic) IBOutlet UIView *bgView;
@property (nonatomic,strong) listModel *listModel;
@property (nonatomic,strong) FoodListModel *foodListModel;
@end
