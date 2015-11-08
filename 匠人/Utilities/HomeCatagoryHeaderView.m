//
//  HomeCatagoryHeaderView.m
//  匠人
//
//  Created by BK on 15/11/2.
//  Copyright © 2015年 bk. All rights reserved.
//

#import "HomeCatagoryHeaderView.h"
#import "UIImageView+WebCache.h"
@interface HomeCatagoryHeaderView()
{
    UIImageView *_headView;
    UILabel *_titleLabel;
}
@end

@implementation HomeCatagoryHeaderView
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        UIImageView *headView = [[UIImageView alloc] init];
        headView.contentMode = UIViewContentModeScaleAspectFill;
        [self addSubview:headView];
        _headView = headView;
        UILabel *title = [[UILabel alloc] init];
        title.textColor = [UIColor grayColor];
        title.font = [UIFont systemFontOfSize:14];
        [self addSubview:title];
        _titleLabel = title;
    }
    return self;
}

- (void)layoutSubviews {
    CGFloat headViewW = self.frame.size.width;
    CGFloat headViewH = (175/375.0)*headViewW;
    _headView.frame = CGRectMake(0, 0, headViewW, headViewH);
    CGFloat titleLabelY = CGRectGetMaxY(_headView.frame)+10;
    _titleLabel.frame = CGRectMake(10, titleLabelY, headViewW, 20);
}

- (void)setModel:(HomeCatagoryModel *)model {
    _model = model;
    [_headView sd_setImageWithURL:[NSURL URLWithString:model.img]];
    _titleLabel.text = model.title;
}

@end
