//
//  ItemView.m
//  匠人
//
//  Created by BK on 15/11/1.
//  Copyright © 2015年 bk. All rights reserved.
//

#import "ItemView.h"

@interface ItemView()


@end

@implementation ItemView

- (instancetype)init {
    if (self = [super init]) {
        UIButton *btn = [[UIButton alloc] init];
        btn.userInteractionEnabled = NO;
        [self addSubview:btn];
        _btn = btn;
        UILabel *label = [[UILabel alloc] init];
        label.textColor = [UIColor blackColor];
        label.font = [UIFont systemFontOfSize:12];
        label.textAlignment = NSTextAlignmentCenter;
        [self addSubview:label];
        _label = label;
        self.userInteractionEnabled = YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapClick:)];
        [self addGestureRecognizer:tap];
    }
    return self;
}

- (void)layoutSubviews {
    
    CGFloat viewW = self.frame.size.width;
//    CGFloat viewH = self.frame.size.height;
    CGFloat btnW = viewW*0.8;
    CGFloat btnH = btnW;
    CGFloat btnX = (viewW-btnW)/2.0;
    _btn.frame = CGRectMake(btnX, 0, btnW, btnH);
    
    _label.frame = CGRectMake(0, btnH, viewW, 20);
}

- (void)tapClick:(UIGestureRecognizer *)tap {
    if (_block) {
        _block(tap.view.tag);
    }
}

@end
