//
//  HotelSecondCell.m
//  匠人
//
//  Created by BK on 15/11/3.
//  Copyright © 2015年 bk. All rights reserved.
//

#import "HotelSecondCell.h"
#import "UIImageView+WebCache.h"
@implementation HotelSecondCell

- (void)awakeFromNib {
    _foodImage.layer.cornerRadius = 5;
    _foodImage.layer.masksToBounds = YES;
}

- (void)setListModel:(HotelListModel *)listModel {
    if (listModel) {
        _listModel = listModel;
        [_foodImage sd_setImageWithURL:[NSURL URLWithString:listModel.cover]];
        _descLabel.text = listModel.name;
        _titleLabel.text = listModel.summary;
    }
}

- (void)setCollectModel:(Collect *)collectModel {
   
    if (collectModel) {
         _collectModel = collectModel;
        [_foodImage sd_setImageWithURL:[NSURL URLWithString:collectModel.image]];
         _descLabel.text = @"";
        _titleLabel.text = collectModel.title;
    }
}

- (void)setFrame:(CGRect)frame {
    frame.origin.y+=10;
    frame.origin.x+=10;
    frame.size.width-=20;
    frame.size.height-=10;
    [super setFrame:frame];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
