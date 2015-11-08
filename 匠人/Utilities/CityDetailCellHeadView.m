//
//  CityDetailCellHeadView.m
//  匠人
//
//  Created by BK on 15/11/2.
//  Copyright © 2015年 bk. All rights reserved.
//

#import "CityDetailCellHeadView.h"

@interface CityDetailCellHeadView()
{
    UILabel *_titleLabel;
    UILabel *_descLabel;
}

@end

@implementation CityDetailCellHeadView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        UILabel *titleLabel = [[UILabel alloc] init];
        [self addSubview:titleLabel];
        _titleLabel = titleLabel;
        UILabel *descLabel = [[UILabel alloc] init];
        descLabel.textColor = [UIColor grayColor];
        descLabel.font = [UIFont systemFontOfSize:12];
        [self addSubview:descLabel];
        _descLabel = descLabel;
        
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    _titleLabel.frame = CGRectMake(10, 10, self.frame.size.width-20, 20);
    _descLabel.frame = CGRectMake(10, 35, self.frame.size.width-20, 10);
}

- (void)setTextArray:(NSArray *)textArray {
    _textArray = textArray;
    if (textArray.count>=2) {
        _titleLabel.text = textArray[0];
        _descLabel.text = textArray[1];
    }
    
}

@end
