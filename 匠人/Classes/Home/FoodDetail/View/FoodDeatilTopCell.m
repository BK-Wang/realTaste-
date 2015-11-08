//
//  FoodDeatilTopCell.m
//  匠人
//
//  Created by BK on 15/11/2.
//  Copyright © 2015年 bk. All rights reserved.
//

#import "FoodDeatilTopCell.h"
#import "UIImageView+WebCache.h"
@interface FoodDeatilTopCell()
{
    UIImageView *_imageView;
    UILabel *_titleLabel;
    UILabel *_descLabel;
}

@end

@implementation FoodDeatilTopCell

- (void)awakeFromNib {
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.layer.cornerRadius = 5;
        imageView.layer.masksToBounds = YES;
        [self.contentView addSubview:imageView];
        _imageView = imageView;
        UILabel *titleLabel = [[UILabel alloc] init];
        [self.contentView addSubview:titleLabel];
        _titleLabel = titleLabel;
        UILabel *descLabel = [[UILabel alloc] init];
        descLabel.numberOfLines = 0;
        descLabel.font = [UIFont systemFontOfSize:14];
        descLabel.textColor = [UIColor grayColor];
        descLabel.textAlignment = NSTextAlignmentLeft;
        [self.contentView addSubview:descLabel];
        _descLabel = descLabel;
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    CGFloat imageViewW = 393/3.0;
    CGFloat imageViewH = 306/3.0;
    _imageView.frame = CGRectMake(10, 10, imageViewW, imageViewH);
    CGFloat titleLabelX = CGRectGetMaxX(_imageView.frame)+10;
    CGFloat titleLabelY = 10;
    CGFloat titleLabelW = self.contentView.frame.size.width-titleLabelX-10;
    _titleLabel.frame = CGRectMake(titleLabelX, titleLabelY, titleLabelW, 20);
    
    CGFloat descLabelX = titleLabelX;
    CGFloat descLabelY = CGRectGetMaxY(_titleLabel.frame)+10;
    CGFloat descLabelW = titleLabelW;
    CGFloat descLabelH = imageViewH - descLabelY;
    _descLabel.frame = CGRectMake(descLabelX, descLabelY, descLabelW, descLabelH);
}

- (void)setModel:(FoodDetailModel *)model {
    _model = model;
    [_imageView sd_setImageWithURL:[NSURL URLWithString:model.imgs]];
    _titleLabel.text = model.title;
    _descLabel.text = model.sum;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
