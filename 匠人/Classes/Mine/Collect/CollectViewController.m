//
//  CollectViewController.m
//  匠人
//
//  Created by BK on 15/11/4.
//  Copyright © 2015年 bk. All rights reserved.
//

#import "CollectViewController.h"
#import "CollectSubViewController.h"
#import "HMSegmentedControl.h"
#import "AppDelegate.h"
@interface CollectViewController ()<UIScrollViewDelegate>
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) HMSegmentedControl *segmentedControl;
@property(nonatomic,strong) NSArray *arrayLists;
@end

@implementation CollectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configUI];
    
}
#pragma mark - ******************** 懒加载
- (NSArray *)arrayLists
{
    if (_arrayLists == nil) {
        _arrayLists = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"collect.plist" ofType:nil]];
    }
    return _arrayLists;
}

- (void)configUI{
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self addTitleView:@"我的收藏"];
    [self addBarBtnItemWithImageNames:@[@"top_back_1"] withPosition:LEFT_BARITEM withID:nil];
    self.segmentedControl = [[HMSegmentedControl alloc] initWithSectionTitles:@[@"城市", @"餐厅",@"食记"]];
    self.segmentedControl.frame = CGRectMake(0, 0, SCWTH, 50);
    // 初始化选中位置
    self.segmentedControl.selectedSegmentIndex = 0;
    self.segmentedControl.backgroundColor = [UIColor clearColor];
    // 普通状态下字体颜色
    self.segmentedControl.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor grayColor]};
    // 选中状态下字体颜色
    self.segmentedControl.selectedTitleTextAttributes = @{NSForegroundColorAttributeName : [UIColor grayColor]};
    self.segmentedControl.selectionIndicatorColor = [UIColor orangeColor];
    self.segmentedControl.selectionIndicatorHeight = 3;
    self.segmentedControl.selectionIndicatorEdgeInsets = UIEdgeInsetsMake(0, 50, 0, 100);
    self.segmentedControl.selectionIndicatorLocation = HMSegmentedControlSelectionIndicatorLocationDown;
    //    self.segmentedControl.tag = 3;
    
    __weak typeof(self) weakSelf = self;
    [self.segmentedControl setIndexChangeBlock:^(NSInteger index) {
        CGFloat offsetX = index * weakSelf.scrollView.frame.size.width;
        
        CGFloat offsetY = weakSelf.scrollView.contentOffset.y;
        CGPoint offset = CGPointMake(offsetX, offsetY);
        
        [weakSelf.scrollView setContentOffset:offset animated:YES];
    }];
    
//    self.navigationItem.titleView = self.segmentedControl;
        [self.view addSubview:self.segmentedControl];
    
    // 添加子控制器
    [self addController];
    
    // 添加scrollView
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 50, SCWTH, SCHET-64-49-50)];
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
    CollectSubViewController *vc = [self.childViewControllers firstObject];
    vc.view.frame = self.scrollView.bounds;
    [self.scrollView addSubview:vc.view];
    
}

- (void)leftClick:(UIButton *)btn {
    [self.navigationController popViewControllerAnimated:YES];
    AppDelegate *tempDelegate=(AppDelegate *)[UIApplication sharedApplication].delegate;
    tempDelegate.tab.tabBar.hidden = YES;
    [UIView animateWithDuration:0.5 animations:^{
        tempDelegate.tab.customBar.frame = CGRectMake(0, SCHET-45, SCWTH, 45);
        
    }];
}
/** 添加子控制器 */
- (void)addController {
    
    for (NSInteger i = 0; i<self.arrayLists.count; i++) {
        CollectSubViewController *vc = [[CollectSubViewController alloc] init];
        vc.dataObject = _arrayLists[i];
        [self addChildViewController:vc];
    }
}

/** 滚动结束后调用（代码导致） */
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
{
    NSUInteger index = scrollView.contentOffset.x / self.scrollView.frame.size.width;
    
    // 添加控制器
    CollectSubViewController *vc = self.childViewControllers[index];
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
