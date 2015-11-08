//
//  HotelDetailCell.m
//  匠人
//
//  Created by BK on 15/11/2.
//  Copyright © 2015年 bk. All rights reserved.
//

#import "HotelDetailCell.h"

@implementation HotelDetailCell

- (void)awakeFromNib {
    [_lookMore addTarget:self action:@selector(lookMoreClick) forControlEvents:UIControlEventTouchUpInside];
}

- (void)setModel:(HotelDetailModel *)model {
    _model = model;
    if (model) {
        _descLabel.text = [NSString stringWithFormat:@"%@/n%@",model.address,model.address_origin];
        _priceLabel.text = [NSString stringWithFormat:@"人均:%@元",model.cost];
        _openTimeLabel.text = [NSString stringWithFormat:@"营业时间:%@",model.open_time];
        _phoneLabel.text = [NSString stringWithFormat:@"电话:%@",model.phone];
        _reasonLabel.text = model.reason;
    }
}

- (void)lookMoreClick {
    if (_block) {
        _block();
    }
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
