//
//  CityDetailSubCell.m
//  匠人
//
//  Created by BK on 15/11/2.
//  Copyright © 2015年 bk. All rights reserved.
//

#import "CityDetailSubCell.h"
#import "UIImageView+WebCache.h"
@interface CityDetailSubCell()
{
    UIImageView *_imageView;
    UILabel *_titleLabel;
    UILabel *_descLabel;
}
@end

@implementation CityDetailSubCell
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.layer.cornerRadius = 5;
        imageView.layer.masksToBounds = YES;
        [self.contentView addSubview:imageView];
        _imageView = imageView;
        
        UILabel *titleLabel = [[UILabel alloc] init];
        titleLabel.font = [UIFont systemFontOfSize:14];
        [self.contentView addSubview:titleLabel];
        _titleLabel = titleLabel;
        
        UILabel *descLabel = [[UILabel alloc] init];
        descLabel.textColor = [UIColor grayColor];
        descLabel.font = [UIFont systemFontOfSize:12];
        descLabel.numberOfLines = 2;
        descLabel.lineBreakMode = NSLineBreakByCharWrapping;
        [self.contentView addSubview:descLabel];
        _descLabel = descLabel;
        
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    CGFloat imageViewW = self.contentView.frame.size.width;
    CGFloat imageViewH = imageViewW;
    _imageView.frame = CGRectMake(0, 0, imageViewW, imageViewH);
    
    CGFloat titleLabelY = CGRectGetMaxY(_imageView.frame);
    _titleLabel.frame = CGRectMake(0, titleLabelY, imageViewW, 20);
    
    CGFloat descLabelY = CGRectGetMaxY(_titleLabel.frame);
    _descLabel.frame = CGRectMake(0, descLabelY, imageViewW, 30);
}

- (void)setModel:(dishlistModel *)model {
    _model = model;
    [_imageView sd_setImageWithURL:[NSURL URLWithString:model.cover]];
    _titleLabel.text = model.name;
    _descLabel.text = model.sum;
}
@end
