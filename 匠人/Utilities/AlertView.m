//
//  AlertView.m
//  匠人
//
//  Created by BK on 15/11/5.
//  Copyright © 2015年 bk. All rights reserved.
//

#import "AlertView.h"
#import "Masonry.h"
@interface AlertView()
@property (nonatomic, weak) UIView *bgView;
@property (nonatomic, weak) UIView *subView;
@property (nonatomic, weak) UILabel *descLabel;
@end
@implementation AlertView
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor clearColor];
        [self configUI];
    }
    return self;
}
- (void)configUI {
    UIView *bgView = [[UIView alloc] init];
    bgView.backgroundColor = [UIColor blackColor];
    bgView.alpha = 0.3;
    [self addSubview:bgView];
    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.bottom.right.equalTo(self);
    }];
    _bgView = bgView;
    
    UIView *subView = [[UIView alloc] init];
    subView.backgroundColor = [UIColor whiteColor];
    [self addSubview:subView];
    [subView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.centerY.equalTo(self);
        make.left.equalTo(self).offset(30);
        make.right.equalTo(self).offset(-30);
       
    }];
    _subView = subView;
    
    UIButton *btn = [[UIButton alloc] init];
    [btn setTitle:@"推荐理由" forState:UIControlStateNormal];
    btn.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:@"icon_vote_black"] forState:UIControlStateNormal];
    [self addSubview:btn];
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_subView).offset(10);
        make.left.equalTo(_subView).offset(100);
        make.right.equalTo(_subView).offset(-100);
        make.height.equalTo(@20);
    }];
    
    UILabel *descLabel = [[UILabel alloc] init];
    descLabel.numberOfLines = 0;
    descLabel.font = [UIFont systemFontOfSize:14];
    descLabel.textColor = [UIColor grayColor];
    [self addSubview:descLabel];
    [descLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_subView).offset(20);
        make.right.equalTo(_subView).offset(-20);
        make.top.equalTo(_subView).offset(40);
        make.bottom.equalTo(_subView).offset(-20);
    }];
    _descLabel = descLabel;
}
- (void)setDesc:(NSString *)desc {
    _desc = desc;
    _descLabel.text = desc;
}
@end
