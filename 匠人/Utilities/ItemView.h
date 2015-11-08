//
//  ItemView.h
//  匠人
//
//  Created by BK on 15/11/1.
//  Copyright © 2015年 bk. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^ItemViewBlock)(NSInteger tag);

@interface ItemView : UIView
@property (nonatomic,weak) UIButton *btn;
@property (nonatomic, weak) UILabel *label;
@property (nonatomic,copy) ItemViewBlock block;
@end
