//
//  HotelDetailCell.h
//  匠人
//
//  Created by BK on 15/11/2.
//  Copyright © 2015年 bk. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HotelDetailModel.h"

typedef void(^HotelDetailBlock)();
@interface HotelDetailCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *descLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UILabel *openTimeLabel;
@property (weak, nonatomic) IBOutlet UILabel *phoneLabel;
@property (weak, nonatomic) IBOutlet UILabel *reasonLabel;
@property (weak, nonatomic) IBOutlet UIButton *lookMore;
@property (nonatomic,strong) HotelDetailModel *model;
@property (nonatomic,copy) HotelDetailBlock block;
@end
