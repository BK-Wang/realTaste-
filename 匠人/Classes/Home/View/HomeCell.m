//
//  HomeCell.m
//  匠人
//
//  Created by BK on 15/11/1.
//  Copyright © 2015年 bk. All rights reserved.
//

#import "HomeCell.h"
#import "UIImageView+WebCache.h"
#import "Define.h"
@implementation HomeCell

- (void)awakeFromNib {
    // Initialization code
    _homeView.layer.cornerRadius = 5;
    _homeView.layer.masksToBounds = YES;
    
    _userImage.layer.cornerRadius = 20;
    _userImage.layer.masksToBounds = YES;
    
    _homeAddress.titleEdgeInsets = UIEdgeInsetsMake(0, 5, 0, 0);
}

- (void)setModel:(ContentModel *)model {
    _model = model;
    [_homeView sd_setImageWithURL:[NSURL URLWithString:model.cover]];
    _homeTitle.text = model.name;
    [_homeAddress setTitle:model.city forState:UIControlStateNormal];
    [_userImage sd_setImageWithURL:[NSURL URLWithString:model.header]];
    _homeKind.text = model.uname;
    
}

- (void)setFoodModel:(FoodModel *)foodModel {
    _foodModel = foodModel;
    [_homeView sd_setImageWithURL:[NSURL URLWithString:foodModel.cover]];
    _homeTitle.text = foodModel.name;
    [_homeAddress setTitle:foodModel.city forState:UIControlStateNormal];
    [_userImage sd_setImageWithURL:[NSURL URLWithString:foodModel.header]];
    _homeKind.text = foodModel.uname;
}

- (void)layoutSubviews {
    [super layoutSubviews];
   
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
