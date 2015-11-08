//
//  CountryDetailCell.m
//  匠人
//
//  Created by BK on 15/11/3.
//  Copyright © 2015年 bk. All rights reserved.
//

#import "CountryDetailCell.h"
#import "Masonry.h"
#import "UIImageView+WebCache.h"
@interface CountryDetailCell()
{
    UIImageView *_imageView;
    UILabel *_nameLabel;
    UILabel *_cityLabel;
    
}
@end

@implementation CountryDetailCell

- (void)awakeFromNib {
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self configUI];
    }
    return self;
}
- (void)configUI {
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.clipsToBounds = YES;
    [self.contentView addSubview:imageView];
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(self.contentView);
        make.top.equalTo(self.contentView);
        make.left.equalTo(self.contentView);
        make.height.equalTo(@(self.contentView.frame.size.width*0.5));
    }];
    _imageView = imageView;
    
    UIView *bgView = [[UIView alloc] init];
    bgView.backgroundColor = [UIColor blackColor];
    bgView.alpha = 0.3;
    [self.contentView addSubview:bgView];
    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(imageView);
        make.left.equalTo(imageView);
        make.height.equalTo(@30);
        make.width.equalTo(imageView);
    }];
    UILabel *nameLabel = [[UILabel alloc] init];
    nameLabel.font = [UIFont systemFontOfSize:15];
    nameLabel.textColor = [UIColor whiteColor];
    [self.contentView addSubview:nameLabel];
    [nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(imageView).offset(2);
        make.bottom.equalTo(imageView).offset(-5);
        make.height.mas_equalTo(@20);
    }];
    _nameLabel = nameLabel;
    
    UILabel *cityLabel = [[UILabel alloc] init];
    cityLabel.font = [UIFont systemFontOfSize:12];
    cityLabel.textColor = [UIColor whiteColor];
    [self.contentView addSubview:cityLabel];
    [cityLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(nameLabel.mas_right).offset(10);
        make.bottom.equalTo(nameLabel);
        make.height.mas_equalTo(@20);
    }];
    _cityLabel = cityLabel;
    
    UILabel *descLabel = [[UILabel alloc] init];
    descLabel.textColor = [UIColor grayColor];
    descLabel.font = [UIFont systemFontOfSize:15];
    descLabel.numberOfLines = 0;
    [self.contentView addSubview:descLabel];
    [descLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(imageView);
        make.top.equalTo(imageView.mas_bottom).offset(5);
        make.left.equalTo(imageView);
        make.bottom.equalTo(self.contentView.mas_bottom).offset(-5);
    }];
    _descLabel = descLabel;
}

- (void)setModel:(CountryDetailModel *)model {
    _model = model;
    [_imageView sd_setImageWithURL:[NSURL URLWithString:model.cover]];
    _descLabel.text = model.desc;
    _cityLabel.text = model.city;
    _nameLabel.text = model.name;
}

- (void)setFrame:(CGRect)frame {
    frame.origin.y+=10;
//    frame.size.height-=10;
    frame.origin.x+=10;
    frame.size.width-=20;
    [super setFrame:frame];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
