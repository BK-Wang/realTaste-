//
//  CollectionViewController.h
//  buding
//
//  Created by qianfeng on 15/10/21.
//  Copyright (c) 2015年 XBQ. All rights reserved.
//

#import "RootViewController.h"
#import "MJRefresh.h"
#import "HttpManager.h"
#import "UIImageView+WebCache.h"
@interface CollectionViewController : RootViewController<UICollectionViewDelegateFlowLayout,UICollectionViewDataSource>
{
    UICollectionViewFlowLayout *_flowLayout;
    UICollectionView *_collectionView;
    NSMutableArray *_dataArray;
    NSInteger *_currentPage;
}
@property (nonatomic,assign) NSInteger index;
@property (nonatomic,copy) NSArray *urlArray;
- (void)configUI;/**< 搭建UI */
- (void)loadData;/**< 加载数据 */
/**
 *  添加下拉刷新和上拉加载
 */
- (void)addRefreshHaveHeader:(BOOL)header AndHaveFooter:(BOOL)footer;
/**
 *  下拉刷新
 */
- (void)reloadData;
/**
 *  上拉加载
 */
- (void)loadMore;
@end
