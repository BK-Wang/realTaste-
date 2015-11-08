//
//  BKTabBarController.h
//  半次元
//
//  Created by BK on 15/10/10.
//  Copyright © 2015年 bk. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BKTabBarController : UITabBarController
- (instancetype)initWithVcNameArray:(NSArray *)nameArray titleArray:(NSArray *)titleArray itemArray:(NSArray *)itemArray itemHArray:(NSArray *)itemHArray itemSize:(CGSize)size space:(CGFloat)space bgImageName:(NSString *)bgName isNav:(BOOL)isNav;
@property (nonatomic, strong) UIImageView *customBar;
@end
