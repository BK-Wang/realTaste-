//
//  CityDetailSecondCell.m
//  匠人
//
//  Created by BK on 15/11/2.
//  Copyright © 2015年 bk. All rights reserved.
//

#import "CityDetailSecondCell.h"
#import "UIImageView+WebCache.h"
@implementation CityDetailSecondCell

- (void)awakeFromNib {
    _bgimageView.layer.cornerRadius = 5;
    _bgimageView.layer.masksToBounds = YES;
    _bgimageView.clipsToBounds = YES;
}
- (void)setListModel:(listModel *)listModel {
    _listModel = listModel;
    if (listModel.name.length>0) {
        _bgView.hidden = NO;
        [_bgimageView sd_setImageWithURL:[NSURL URLWithString:listModel.cover]];
        _titleLabel.text = [NSString stringWithFormat:@"— %@ —",listModel.name];
        _descLabel.text = listModel.summary;
    }
   
}
- (void)setFoodListModel:(FoodListModel *)foodListModel {
    _foodListModel = foodListModel;
    if (foodListModel.name.length>0) {
        _bgView.hidden = NO;
        [_bgimageView sd_setImageWithURL:[NSURL URLWithString:foodListModel.cover]];
        _titleLabel.text = [NSString stringWithFormat:@"— %@ —",foodListModel.name];
        _descLabel.text = foodListModel.sum;
    }
    
}

- (void)setFrame:(CGRect)frame {
    frame.size.height-=5;
    frame.size.width-=10;
    frame.origin.x+=5;
    [super setFrame:frame];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
