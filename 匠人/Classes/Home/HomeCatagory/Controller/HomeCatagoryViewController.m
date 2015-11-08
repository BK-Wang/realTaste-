//
//  HomeCatagoryViewController.m
//  匠人
//
//  Created by BK on 15/11/2.
//  Copyright © 2015年 bk. All rights reserved.
//

#import "HomeCatagoryViewController.h"
#import "AppDelegate.h"
#import "HomeCatagoryModel.h"
#import "HomeCatagoryCell.h"
#import "HomeCatagoryHeaderView.h"
#import "CountryDetailViewController.h"
@interface HomeCatagoryViewController ()
{
    CGSize _cellSize;
}
@property (nonatomic,strong) HomeCatagoryModel *model;
@end

@implementation HomeCatagoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadData];
}
#pragma mark - 搭建UI
- (void)configUI {
    [super configUI];
    [self addTitleView:_catagoryName];
    [self addBarBtnItemWithImageNames:@[@"top_back_1"] withPosition:LEFT_BARITEM withID:@""];
    _flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    [_collectionView registerClass:[HomeCatagoryCell class] forCellWithReuseIdentifier:@"HomeCatagoryCell"];
    [_collectionView registerClass:[HomeCatagoryHeaderView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HomeCatagoryHeaderView"];
    CGFloat cellW = (SCWTH-30)/2.0;
    CGFloat cellH = cellW;
    _cellSize = CGSizeMake(cellW, cellH);
}
- (void)leftClick:(UIButton *)btn {
    [self.navigationController popViewControllerAnimated:YES];
    AppDelegate *tempDelegate=(AppDelegate *)[UIApplication sharedApplication].delegate;
    tempDelegate.tab.tabBar.hidden = YES;
    [UIView animateWithDuration:0.5 animations:^{
        tempDelegate.tab.customBar.frame = CGRectMake(0, SCHET-45, SCWTH, 45);
        
    }];
}
#pragma mark - 加载数据
- (void)loadData {
    
    [[HttpManager shareManager] requestWithUrl:_url withDictionary:nil withSuccessBlock:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSDictionary *dict = (NSDictionary *)responseObject;
        NSDictionary *dataDict = dict[@"data"];
        for (NSDictionary *dict in dataDict[@"list"]) {
            _model = [[HomeCatagoryModel alloc] initWithDictionary:dict error:nil];
        }
        [_collectionView reloadData];
    } withFailureBlock:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
}

#pragma mark collectionView代理和数据源
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    return _cellSize;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _model.content.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    HomeCatagoryCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"HomeCatagoryCell" forIndexPath:indexPath];
    cell.model = _model.content[indexPath.row];
    return cell;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(10, 10, 0, 10);
}

#pragma mark collectionView头部
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    CGFloat headViewH = (175/375.0)*SCWTH+30;
    return CGSizeMake(0, headViewH);
}
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    HomeCatagoryHeaderView *view = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HomeCatagoryHeaderView" forIndexPath:indexPath];
    view.model = _model;
    return view;
    
}
#pragma mark - cell点击
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    CountryDetailViewController *vc = [[CountryDetailViewController alloc] init];
    if ([_catagoryName isEqualToString:@"米其林全球指南"]) {
        vc.type = @"1";
    }else if ([_catagoryName isEqualToString:@"吃遍全球中餐"]) {
        vc.type = @"2";
    }else if ([_catagoryName isEqualToString:@"世界咖啡之旅"]) {
        vc.type = @"3";
    }
    vc.countryName = [_model.content[indexPath.row] name];
    vc.countryId = [_model.content[indexPath.row] _id];
    [self.navigationController pushViewController:vc animated:YES];
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
