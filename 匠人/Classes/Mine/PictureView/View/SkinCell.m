//
//  SkinCell.m
//  匠人
//
//  Created by BK on 15/11/4.
//  Copyright © 2015年 bk. All rights reserved.
//

#import "SkinCell.h"

@implementation SkinCell

- (void)awakeFromNib {
    _skinImage.layer.cornerRadius = 5;
    _skinImage.layer.masksToBounds = YES;
}

- (void)setFrame:(CGRect)frame {
    frame.origin.x+=10;
    frame.size.width-=20;
    frame.origin.y+=10;
    frame.size.height-=10;
    [super setFrame:frame];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
