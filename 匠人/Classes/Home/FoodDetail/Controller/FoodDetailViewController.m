//
//  FoodDetailViewController.m
//  匠人
//
//  Created by BK on 15/11/2.
//  Copyright © 2015年 bk. All rights reserved.
//

#import "FoodDetailViewController.h"
#import "FoodDetailModel.h"
#import "FoodDeatilTopCell.h"
#import "CityDetailSecondCell.h"
#import "HotelDetailViewController.h"
@interface FoodDetailViewController ()
{
    FoodDetailModel *_model;
}
@end

@implementation FoodDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadData];
}
#pragma mark - 搭建UI
- (void)configUI {
    [super configUI];
    [self addTitleView:_cityName];
    [self addBarBtnItemWithImageNames:@[@"top_back_1"] withPosition:LEFT_BARITEM withID:@""];
    [_tableView registerClass:[FoodDeatilTopCell class] forCellReuseIdentifier:@"FoodDeatilTopCell"];
    [_tableView registerNib:[UINib nibWithNibName:@"CityDetailSecondCell" bundle:nil] forCellReuseIdentifier:@"CityDetailSecondCell"];
}
- (void)leftClick:(UIButton *)btn {
    [self.navigationController popViewControllerAnimated:YES];
}
#pragma mark - 加载数据
- (void)loadData {
    NSDate *date = [NSDate date];
    NSTimeInterval time = [date timeIntervalSince1970];
    [[HttpManager shareManager] requestWithUrl:[NSString stringWithFormat:KFoodDetailUrl,_foodId,time] withDictionary:nil withSuccessBlock:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSDictionary *dict = (NSDictionary *)responseObject;
        NSDictionary *dataDict = dict[@"data"];
        _model = [[FoodDetailModel alloc] initWithDictionary:dataDict error:nil];
        [_tableView reloadData];
    } withFailureBlock:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
}

#pragma mark - tableview代理和数据源
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 1;
    }else {
        return _model.list.count;
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        CGFloat cellH = 306/3.0+20;
        return cellH;
    }else {
        CGFloat cellH = 0.55*SCWTH;
        return cellH;
    }
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        FoodDeatilTopCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FoodDeatilTopCell" forIndexPath:indexPath];
        cell.model = _model;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }else {
        CityDetailSecondCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CityDetailSecondCell" forIndexPath:indexPath];
        cell.foodListModel = _model.list[indexPath.row];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
}

#pragma mark cell点击
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 1) {
        HotelDetailViewController *vc = [[HotelDetailViewController alloc] init];
        vc.hotelName = [_model.list[indexPath.row] name];
        vc.hotelId = [_model.list[indexPath.row] _id];
        [self.navigationController pushViewController:vc animated:YES];
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
