//
//  SubFoodDetailCell.m
//  匠人
//
//  Created by BK on 15/11/3.
//  Copyright © 2015年 bk. All rights reserved.
//

#import "SubFoodDetailCell.h"

@implementation SubFoodDetailCell

- (void)awakeFromNib {
    // Initialization code
}
- (void)setModel:(SubFoodDetail *)model {
    _model = model;
    _reasonLabel.text = model.reason;
    _tasteLabel.text = model.taste;
    _materialLabel.text = model.material;
    _descLabel.text = model.desc;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
