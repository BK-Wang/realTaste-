//
//  BKTabBarController.m
//  半次元
//
//  Created by BK on 15/10/10.
//  Copyright © 2015年 bk. All rights reserved.
//

#import "BKTabBarController.h"
#import "Define.h"
@interface BKTabBarController ()
{
    NSArray *_nameArray;
    NSArray *_titleArray;
    NSArray *_itemArray;
    NSArray *_itemHArray;
    CGSize _itemSize;
    CGFloat _space;
    NSString *_bgImageName;
    BOOL _isNav;
}
@end

@implementation BKTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
   
}
- (instancetype)initWithVcNameArray:(NSArray *)nameArray titleArray:(NSArray *)titleArray itemArray:(NSArray *)itemArray itemHArray:(NSArray *)itemHArray itemSize:(CGSize)size space:(CGFloat)space bgImageName:(NSString *)bgName isNav:(BOOL)isNav{

    if (self = [super init]) {
        _nameArray = nameArray;
        _titleArray = titleArray;
        _itemArray = itemArray;
        _itemHArray = itemHArray;
        _itemSize = size;
        _space = space;
        _bgImageName = bgName;
        _isNav = isNav;
        [self createTabBar];
        [self customTabBar];
    }
    return self;
}
- (void)createTabBar{
  
    NSMutableArray *viewController = [[NSMutableArray alloc] init];
    for (NSInteger i = 0; i<_nameArray.count; i++) {
        
        Class class = NSClassFromString(_nameArray[i]);
        UIViewController *vc = [[class alloc] init];
        if (_titleArray[i]) {
            vc.title = _titleArray[i];
        }
        
        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
        [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
        [nav.navigationBar setBackgroundImage:[UIImage imageNamed:@"UMS_nav_bar_bg_black"] forBarMetrics:UIBarMetricsDefault];
        
        if (_isNav) {
            [viewController addObject:nav];
        }else{
            [viewController addObject:vc];
        }
    }
    self.viewControllers = viewController;
    
}
- (void)customTabBar{
    // 隐藏导航条
    self.tabBar.hidden = YES;
    // 设置导航条
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, SCHET-45, SCWTH, 45)];
    if (_bgImageName.length>0) {
        imageView.image = [UIImage imageNamed:_bgImageName];
    }
    imageView.tag = 300;
    [self.view addSubview:imageView];
    
    
    // 添加按钮
    CGFloat btnW = _itemSize.width;
    CGFloat btnH = _itemSize.height;
    CGFloat spaceX = (SCWTH-2*_space-_itemArray.count*btnW)/(1.0*(_itemArray.count-1));
    CGFloat labelY = btnH-5;
    for (NSInteger i = 0; i<_itemArray.count; i++) {
        UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(_space+(btnW+spaceX)*i, 0, btnW, btnH)];
        [btn setImage:[UIImage imageNamed:_itemArray[i]] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:_itemHArray[i]] forState:UIControlStateSelected];
        btn.contentMode = UIViewContentModeScaleAspectFit;
        btn.tag = 200+i;
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
       
        [imageView addSubview:btn];
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(_space+(btnW+spaceX)*i, labelY, btnW, 15)];
        label.text = _titleArray[i];
        label.textAlignment = NSTextAlignmentCenter;
        label.font = [UIFont systemFontOfSize:10];
        label.textColor = [UIColor whiteColor];
        label.tag = 250+i;
        [imageView addSubview:label];
        if (i == 0) {
            btn.selected = YES;
            btn.userInteractionEnabled = YES;
            label.textColor = BTColor(254, 143, 0);
        }
        
    }
    imageView.userInteractionEnabled = YES;
    _customBar = imageView;
}


- (void)btnClick:(UIButton *)btn{
    btn.selected = YES;
    btn.userInteractionEnabled = NO;
    self.selectedIndex = btn.tag - 200;
    UILabel *label = [self.view viewWithTag:btn.tag+50];
    label.textColor = BTColor(254, 143, 0);
    for (NSInteger i = 0; i<_itemArray.count; i++) {
        UIButton *btn1 = (UIButton *)[self.view viewWithTag:200+i];
        UILabel *label = [self.view viewWithTag:btn1.tag+50];
        if (btn1.tag!=btn.tag) {
            btn1.selected = NO;
            btn1.userInteractionEnabled = YES;
            label.textColor = [UIColor whiteColor];
        }
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
