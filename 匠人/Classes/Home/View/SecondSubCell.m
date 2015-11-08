//
//  SecondSubCell.m
//  匠人
//
//  Created by BK on 15/11/2.
//  Copyright © 2015年 bk. All rights reserved.
//

#import "SecondSubCell.h"
#import "UIImageView+WebCache.h"
@implementation SecondSubCell

- (void)awakeFromNib {
    _subImage.layer.cornerRadius = 5;
    _subImage.layer.masksToBounds = YES;
}
-(void)setModel:(ContentModel *)model {
    _model = model;
    [_subImage sd_setImageWithURL:[NSURL URLWithString:model.cover]];
    _subTitle.text = model.name;
}

-(void)setCityModel:(HomeCityModel *)cityModel {
    _cityModel = cityModel;
    if (cityModel.cover.length>0) {
        [_subImage sd_setImageWithURL:[NSURL URLWithString:cityModel.cover]];
    }
    if (cityModel.name.length>0) {
        _subTitle.text = cityModel.name;
    }
    
}
@end
