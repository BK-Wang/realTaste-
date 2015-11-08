//
//  FoodRecordCell.h
//  匠人
//
//  Created by BK on 15/11/4.
//  Copyright © 2015年 bk. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FoodRecordModel.h"
@interface FoodRecordCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *descLabel;
@property (nonatomic,strong) FoodContentModel *contentModel;
@end
