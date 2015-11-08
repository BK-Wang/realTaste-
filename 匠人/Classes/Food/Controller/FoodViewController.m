//
//  FoodViewController.m
//  匠人
//
//  Created by BK on 15/11/1.
//  Copyright © 2015年 bk. All rights reserved.
//

#import "FoodViewController.h"
#import "HMSegmentedControl.h"
#import "FoodSubViewController.h"
@interface FoodViewController ()<UIScrollViewDelegate>

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) HMSegmentedControl *segmentedControl;
@property(nonatomic,strong) NSArray *arrayLists;
@end

@implementation FoodViewController
//- (void)dealloc {
//    [[NSNotificationCenter defaultCenter] removeObserver:self];
//}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self configUI];
}

#pragma mark - ******************** 懒加载
- (NSArray *)arrayLists
{
    if (_arrayLists == nil) {
        _arrayLists = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"Food.plist" ofType:nil]];
    }
    return _arrayLists;
}

- (void)configUI{
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.segmentedControl = [[HMSegmentedControl alloc] initWithFrame:CGRectMake(0, 20, SCWTH-20/2, 44)];
    self.segmentedControl.sectionTitles = @[@"最热", @"最新"];
    // 初始化选中位置
    self.segmentedControl.selectedSegmentIndex = 0;
    self.segmentedControl.backgroundColor = [UIColor clearColor];
    // 普通状态下字体颜色
    self.segmentedControl.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor whiteColor]};
    // 选中状态下字体颜色
    self.segmentedControl.selectedTitleTextAttributes = @{NSForegroundColorAttributeName : [UIColor whiteColor]};
    self.segmentedControl.selectionIndicatorColor = [UIColor whiteColor];
    self.segmentedControl.selectionIndicatorHeight = 2;
    self.segmentedControl.selectionIndicatorEdgeInsets = UIEdgeInsetsMake(0, 60, 0, 120);
    self.segmentedControl.selectionIndicatorLocation = HMSegmentedControlSelectionIndicatorLocationDown;
    //    self.segmentedControl.tag = 3;
    
    __weak typeof(self) weakSelf = self;
    [self.segmentedControl setIndexChangeBlock:^(NSInteger index) {
        CGFloat offsetX = index * weakSelf.scrollView.frame.size.width;
        
        CGFloat offsetY = weakSelf.scrollView.contentOffset.y;
        CGPoint offset = CGPointMake(offsetX, offsetY);
        
        [weakSelf.scrollView setContentOffset:offset animated:YES];
    }];
    
    self.navigationItem.titleView = self.segmentedControl;
    //    [self.view addSubview:self.segmentedControl];
    
    // 添加子控制器
    [self addController];
    
    // 添加scrollView
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, SCWTH, SCHET-64-45)];
    self.scrollView.backgroundColor = [UIColor whiteColor];
    self.scrollView.pagingEnabled = YES;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    CGFloat contentX = self.childViewControllers.count * [UIScreen mainScreen].bounds.size.width;
    self.scrollView.contentSize = CGSizeMake(contentX, 0);
    self.scrollView.bounces = NO;
    self.scrollView.delegate = self;
    [self.scrollView scrollRectToVisible:CGRectMake(0, 0, SCWTH, SCHET) animated:NO];
    [self.view addSubview:self.scrollView];
    
    // 添加默认控制器
    FoodSubViewController *vc = [self.childViewControllers firstObject];
    vc.view.frame = self.scrollView.bounds;
    [self.scrollView addSubview:vc.view];
    
}

#pragma mark - 添加子控制器
- (void)addController {
    
    for (NSInteger i = 0; i<self.arrayLists.count; i++) {
        FoodSubViewController *vc = [[FoodSubViewController alloc] init];
        vc.title = self.arrayLists[i][@"title"];
        vc.url = self.arrayLists[i][@"url"];
        [self addChildViewController:vc];
    }
}

/** 滚动结束后调用（代码导致） */
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
{
    NSUInteger index = scrollView.contentOffset.x / self.scrollView.frame.size.width;
    
    // 添加控制器
    FoodSubViewController *vc = self.childViewControllers[index];
    vc.index = index;
    
    if (vc.view.superview) return;
    
    vc.view.frame = scrollView.bounds;
    [self.scrollView addSubview:vc.view];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    CGFloat pageWidth = scrollView.frame.size.width;
    NSInteger page = scrollView.contentOffset.x / pageWidth;
    [self.segmentedControl setSelectedSegmentIndex:page animated:YES];
    [self scrollViewDidEndScrollingAnimation:scrollView];
    
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
