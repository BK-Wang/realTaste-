//
//  HomeCityViewController.m
//  匠人
//
//  Created by BK on 15/11/2.
//  Copyright © 2015年 bk. All rights reserved.
//

#import "HomeCityViewController.h"
#import "SecondSubCell.h"
#import "HomeCityModel.h"
#import "NSString+EncodedUrl.h"
#import "AppDelegate.h"
#import "HomeCityDetailViewController.h"
@interface HomeCityViewController ()

@end

@implementation HomeCityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadData];
}

#pragma mark - 搭建UI
- (void)configUI {
    [super configUI];
//    self.tabBarController.tabBar.hidden = YES;
    [self addTitleView:_countryName];
    [self addBarBtnItemWithImageNames:@[@"top_back_1"] withPosition:LEFT_BARITEM withID:@""];
    _flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    [_collectionView registerNib:[UINib nibWithNibName:@"SecondSubCell" bundle:nil] forCellWithReuseIdentifier:@"SecondSubCell"];
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
    NSDate *date = [NSDate date];
    NSTimeInterval time = [date timeIntervalSince1970];
    NSString *str = [[NSString alloc] init];
    NSString *encodeCityName = [str encodeToPercentEscapeString:_cityId];
    NSString *url;
    if (_url.length>0) {
        url = _url;
        NSLog(@"%@",url);
    }else {
        url = [NSString stringWithFormat:KHotCityUrl,time,encodeCityName];
    }
    [[HttpManager shareManager] requestWithUrl:url withDictionary:nil withSuccessBlock:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSDictionary *dict = (NSDictionary *)responseObject;
        NSDictionary *dataDict = dict[@"data"];
        for (NSDictionary *dict1 in dataDict[@"list"]) {
            HomeCityModel *model = [[HomeCityModel alloc] initWithDictionary:dict1 error:nil];
            [_dataArray addObject:model];
        }
        [_collectionView reloadData];
    } withFailureBlock:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
}

#pragma mark collectionView代理和数据源
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _dataArray.count;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat itemW = (SCWTH-50)/3.0;
    CGFloat itemH = itemW+20;
    return CGSizeMake(itemW, itemH);
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    SecondSubCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"SecondSubCell" forIndexPath:indexPath];
    cell.cityModel = _dataArray[indexPath.row];
    return cell;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(10, 10, 10, 10);
}

#pragma mark cell的点击
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    HomeCityDetailViewController *vc = [[HomeCityDetailViewController alloc] init];
    vc.cityId = [_dataArray[indexPath.row] _id];
    vc.cityName = [_dataArray[indexPath.row] name];
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
