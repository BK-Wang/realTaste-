//
//  SecondSubCell.h
//  匠人
//
//  Created by BK on 15/11/2.
//  Copyright © 2015年 bk. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeModel.h"
#import "HomeCityModel.h"
@interface SecondSubCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *subImage;
@property (weak, nonatomic) IBOutlet UILabel *subTitle;
@property (nonatomic,strong) ContentModel *model;
@property (nonatomic,strong) HomeCityModel *cityModel;
@end
