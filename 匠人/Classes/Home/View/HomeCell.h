//
//  HomeCell.h
//  匠人
//
//  Created by BK on 15/11/1.
//  Copyright © 2015年 bk. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeModel.h"
#import "FoodModel.h"
@interface HomeCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *homeView;
@property (weak, nonatomic) IBOutlet UILabel *homeTitle;
@property (weak, nonatomic) IBOutlet UIImageView *userImage;
@property (weak, nonatomic) IBOutlet UIButton *homeAddress;
@property (weak, nonatomic) IBOutlet UILabel *homeKind;
@property (nonatomic,strong) ContentModel *model;
@property (nonatomic,strong) FoodModel *foodModel;
@end
