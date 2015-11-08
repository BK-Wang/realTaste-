//
//  RootViewController.m
//  buding
//
//  Created by XBQ on 15/10/20.
//  Copyright (c) 2015年 XBQ. All rights reserved.
//

#import "RootViewController.h"
#import "AppDelegate.h"
#import "Collect+CoreDataProperties.h"
#import "MagicalRecord.h"
@interface RootViewController ()

@end

@implementation RootViewController

-(id)initWithDictionary:(NSDictionary *)dic{
    self=[super init];
    if (self) {
        self.title=dic[TITLE];
        UIImage *img=[UIImage imageNamed:dic[TABBAR_SEL_IMAGE]];
        img=[img imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        UITabBarItem *item=[[UITabBarItem alloc]initWithTitle:dic[TITLE] image:[UIImage imageNamed:dic[TABBAR_IMAGE]] selectedImage:img];
        self.tabBarItem=item;
        self.tabBarItem.imageInsets=UIEdgeInsetsMake(5, 0, -5, 0);
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor=[UIColor whiteColor];
}

-(void)addTitleView:(NSString *)title{
    UILabel *label=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 44)];
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont boldSystemFontOfSize:TITLE_FONT];
    label.text=title;
    label.textColor=[UIColor whiteColor];
    self.navigationItem.titleView=label;
}

-(void)addBarBtnItemWithTitle:(NSString *)title withImageName:(NSString *)imageName withFrame:(CGRect)frame withPosition:(NSInteger)position{
    UIButton *btn=[[UIButton alloc]init];
    btn.imageEdgeInsets = UIEdgeInsetsMake(0, -15, 0, 0);
    if (title.length>0) {
        [btn setTitle:title forState:UIControlStateNormal];
        [btn setTitleColor:TITLECOLOR forState:UIControlStateNormal];
        btn.titleLabel.font=[UIFont systemFontOfSize:15];
    }
    if (imageName.length>0) {
        [btn setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    }
    UIBarButtonItem *item=[[UIBarButtonItem alloc]initWithCustomView:btn];
    if (position==LEFT_BARITEM) {
        btn.frame = frame;
        self.navigationItem.leftBarButtonItem=item;
        [btn addTarget:self action:@selector(leftClick) forControlEvents:UIControlEventTouchUpInside];
    }else{
        btn.frame = frame;
        self.navigationItem.rightBarButtonItem=item;
        [btn addTarget:self action:@selector(rightClick) forControlEvents:UIControlEventTouchUpInside];
    }
}

-(void)addBarBtnItemWithImageNames:(NSArray *)imageNames withPosition:(NSInteger)position withID:(NSString *)ID {
    NSMutableArray *array = [NSMutableArray array];
    for (NSInteger i = 0; i<imageNames.count; i++) {
        UIButton *btn=[[UIButton alloc]init];
//        btn.backgroundColor = [UIColor redColor];
        
        if (imageNames.count>0) {
            [btn setImage:[UIImage imageNamed:imageNames[i]] forState:UIControlStateNormal];
        }
        UIBarButtonItem *item=[[UIBarButtonItem alloc]initWithCustomView:btn];
        if (position==LEFT_BARITEM) {
            btn.imageEdgeInsets = UIEdgeInsetsMake(0, -10, 0, 0);
            btn.frame = CGRectMake(0, 0, 17, 32);
            [btn addTarget:self action:@selector(leftClick:) forControlEvents:UIControlEventTouchUpInside];
            btn.tag = 500+i;
            [array addObject:item];
        }else{
            if (i==1) {
                if ([Collect MR_findByAttribute:@"num" withValue:ID].count>0) {
                    btn.selected = YES;
                }else {
                    btn.selected = NO;
                }
            [btn setImage:[UIImage imageNamed:@"top_fav_1"] forState:UIControlStateSelected];
            }
            btn.imageEdgeInsets = UIEdgeInsetsMake(0, 20, 0, 0);
            btn.frame = CGRectMake(0, 0, 44, 44);
            [btn addTarget:self action:@selector(rightClick:) forControlEvents:UIControlEventTouchUpInside];
            btn.tag = 400+i;
            [array addObject:item];
        }
        
    }
    if (position==LEFT_BARITEM) {
        self.navigationItem.leftBarButtonItems = array;
    }else{
        self.navigationItem.rightBarButtonItems = array;
    }

    
}

-(void)leftClick{
    STTLog(@"子类需要重写leftClick方法");
}

-(void)rightClick{
    STTLog(@"子类需要重写RightClick");
}

-(void)leftClick:(UIButton *)btn {
    STTLog(@"子类需要重写leftClick:方法");
}

-(void)rightClick:(UIButton *)btn {
    STTLog(@"子类需要重写RightClick:");
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
