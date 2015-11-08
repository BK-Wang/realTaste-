//
//  HotelSecondCell.h
//  匠人
//
//  Created by BK on 15/11/3.
//  Copyright © 2015年 bk. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HotelDetailModel.h"
#import "Collect+CoreDataProperties.h"
@interface HotelSecondCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *foodImage;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *descLabel;
@property (nonatomic,strong) HotelListModel *listModel;
@property (nonatomic,strong) Collect *collectModel;
@end
