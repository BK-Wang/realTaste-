//
//  FoodRecordImgCell.m
//  匠人
//
//  Created by BK on 15/11/4.
//  Copyright © 2015年 bk. All rights reserved.
//

#import "FoodRecordImgCell.h"
#import "UIImageView+WebCache.h"
#import "Masonry.h"
@implementation FoodRecordImgCell

- (void)awakeFromNib {
}
- (void)setContentModel:(FoodContentModel *)contentModel {
    _contentModel = contentModel;
    CGFloat imageW = self.contentView.frame.size.width;
    CGFloat ratio = [contentModel.ratio floatValue];
    [_contentImage mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@(imageW/ratio));
    }];

    [_contentImage sd_setImageWithURL:[NSURL URLWithString:contentModel.value]];
}


- (void)setFrame:(CGRect)frame {
    frame.origin.x += 10;
    frame.size.width -= 20;
    frame.origin.y += 10;
    frame.size.height -=10;
    [super setFrame:frame];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
