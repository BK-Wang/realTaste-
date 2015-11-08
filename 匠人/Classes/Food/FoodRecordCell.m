//
//  FoodRecordCell.m
//  匠人
//
//  Created by BK on 15/11/4.
//  Copyright © 2015年 bk. All rights reserved.
//

#import "FoodRecordCell.h"
#import "Define.h"
@implementation FoodRecordCell

- (void)awakeFromNib {
    self.backgroundColor = BTColor(236, 239, 243);
}
- (void)setContentModel:(FoodContentModel *)contentModel {
    _contentModel = contentModel;
    _descLabel.text = contentModel.value;
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
