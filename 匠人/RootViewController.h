//
//  RootViewController.h
//  buding
//
//  Created by XBQ on 15/10/20.
//  Copyright (c) 2015年 XBQ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Define.h"
@interface RootViewController : UIViewController

/* 初始化方法 */
-(id)initWithDictionary:(NSDictionary *)dic;

/* 添加Navgation头部的标题 */
-(void)addTitleView:(NSString *)title;

/* 添加左右两边的item */
-(void)addBarBtnItemWithTitle:(NSString *)title withImageName:(NSString *)imageName withFrame:(CGRect)frame withPosition:(NSInteger)position;
/* 添加左右两边的多个item */
-(void)addBarBtnItemWithImageNames:(NSArray *)imageNames withPosition:(NSInteger)position withID:(NSString *)ID;
-(void)leftClick;/* 左边按钮的方法 */
-(void)rightClick;/* 右边按钮的方法 */
-(void)leftClick:(UIButton *)btn;
-(void)rightClick:(UIButton *)btn;
@end
