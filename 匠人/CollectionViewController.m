//
//  CollectionViewController.m
//  buding
//
//  Created by qianfeng on 15/10/21.
//  Copyright (c) 2015年 XBQ. All rights reserved.
//

#import "CollectionViewController.h"
#import "BKRefreshHeader.h"
@interface CollectionViewController ()

@end

@implementation CollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _dataArray = [NSMutableArray array];
    [self configUI];
}

// 搭建UI
- (void)configUI {
    self.automaticallyAdjustsScrollViewInsets = NO;
    _flowLayout = [[UICollectionViewFlowLayout alloc] init];
    _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, SCWTH, SCHET-64) collectionViewLayout:_flowLayout];
    _collectionView.backgroundColor = [UIColor whiteColor];
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    [self.view addSubview:_collectionView];
}

// 加载数据
- (void)loadData {
    STTLog(@"子类需要重写loadData");
}

- (void)addRefreshHaveHeader:(BOOL)header AndHaveFooter:(BOOL)footer{
    
    if (header) {
        _collectionView.header = [BKRefreshHeader headerWithRefreshingTarget:self refreshingAction:@selector(reloadData)];
        
        [_collectionView.header beginRefreshing];
    }
    if (footer) {
        _collectionView.footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMore)];
    }
    [_collectionView.header beginRefreshing];
}

- (void)reloadData{
    
    NSLog(@"子类需要重写reloadData");
}
- (void)loadMore{
    
    NSLog(@"子类需要重写loadMore");
}


#pragma mark collectionView
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    STTLog(@"子类需要重写sizeForItemAtIndexPath");
    return CGSizeMake(0, 0);
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    STTLog(@"子类需要重写numberOfItemsInSection");
    return 0;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    STTLog(@"cellForItemAtIndexPath");
    return nil;
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
