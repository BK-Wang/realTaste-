//
//  HomeCatagoryCell.m
//  匠人
//
//  Created by BK on 15/11/2.
//  Copyright © 2015年 bk. All rights reserved.
//

#import "HomeCatagoryCell.h"
#import "UIImageView+WebCache.h"
#import "Define.h"
@interface HomeCatagoryCell()
{
    UIImageView *_cityImageView;
    UILabel *_cityLabel;
}

@end

@implementation HomeCatagoryCell
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        UIImageView *imageView = [[UIImageView alloc] init];
        [self.contentView addSubview:imageView];
        imageView.clipsToBounds = YES;
        imageView.layer.cornerRadius = 5;
        imageView.layer.masksToBounds = YES;
        imageView.contentMode = UIViewContentModeScaleAspectFill;
        _cityImageView = imageView;
        UILabel *label = [[UILabel alloc] init];
        label.textColor = [UIColor whiteColor];
        [self.contentView addSubview:label];
        _cityLabel = label;
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGFloat cityImageViewW = (SCWTH-30)/2.0;
    CGFloat cityImageViewH = cityImageViewW;
    _cityImageView.frame = CGRectMake(0, 0, cityImageViewW, cityImageViewH);
    CGFloat cityLabelW = self.contentView.frame.size.width;
    CGFloat cityLabelH = 20;
    CGFloat cityLabelY = CGRectGetMaxY(_cityImageView.frame)-cityLabelH-5;
    _cityLabel.frame = CGRectMake(5, cityLabelY, cityLabelW, cityLabelH);
}

- (void)setModel:(CatagoryContentModel *)model {
    _model = model;
    [_cityImageView sd_setImageWithURL:[NSURL URLWithString:model.img]];
    _cityLabel.text = model.name;
}
@end
