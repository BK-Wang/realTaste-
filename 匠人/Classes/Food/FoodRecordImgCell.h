//
//  FoodRecordImgCell.h
//  匠人
//
//  Created by BK on 15/11/4.
//  Copyright © 2015年 bk. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FoodRecordModel.h"
@interface FoodRecordImgCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *contentImage;
@property (weak, nonatomic) IBOutlet UILabel *descLabel;
@property (nonatomic,strong) FoodContentModel *contentModel;
@end
