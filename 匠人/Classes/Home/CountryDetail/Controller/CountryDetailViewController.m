//
//  CountryDetailViewController.m
//  匠人
//
//  Created by BK on 15/11/3.
//  Copyright © 2015年 bk. All rights reserved.
//

#import "CountryDetailViewController.h"
#import "CountryDetailModel.h"
#import "CountryDetailCell.h"
#import "HotelDetailViewController.h"
@interface CountryDetailViewController ()

@end

@implementation CountryDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadData];
}
#pragma mark - 搭建UI
- (void)configUI {
    [super configUI];
    [self addTitleView:_countryName];
    [self addBarBtnItemWithImageNames:@[@"top_back_1"] withPosition:LEFT_BARITEM withID:@""];
    _tableView.tableFooterView = [[UIView alloc] init];
    [_tableView registerClass:[CountryDetailCell class] forCellReuseIdentifier:@"CountryDetailCell"];
}
- (void)leftClick:(UIButton *)btn {
    [self.navigationController popViewControllerAnimated:YES];
}
#pragma mark - 加载数据
- (void)loadData {
    NSDate *date = [NSDate date];
    NSTimeInterval time = [date timeIntervalSince1970];
//    NSString *url = [NSString stringWithFormat:KCountryDetailUrl,time,_countryId];
//    NSLog(@"%@",url);
    [[HttpManager shareManager] requestWithUrl:[NSString stringWithFormat:KCountryDetailUrl,time,_type,_countryId] withDictionary:nil withSuccessBlock:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSDictionary *dict = (NSDictionary *)responseObject;
        NSDictionary *dataDict = dict[@"data"];
        for (NSDictionary *dict1 in dataDict[@"list"]) {
            CountryDetailModel *model = [[CountryDetailModel alloc] initWithDictionary:dict1 error:nil];
            [_dataArray addObject:model];
        }
        [_tableView reloadData];
    } withFailureBlock:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
}

#pragma mark - tableView代理和数据源
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _dataArray.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    CountryDetailCell *cell = [[CountryDetailCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CountryDetailCell"];
    cell.model = _dataArray[indexPath.row];
    cell.descLabel.font = [UIFont systemFontOfSize:15];
    cell.descLabel.preferredMaxLayoutWidth = cell.contentView.frame.size.width;
    CGFloat height = [cell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize].height+1;
    return height;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CountryDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CountryDetailCell" forIndexPath:indexPath];
    cell.model = _dataArray[indexPath.row];
    cell.descLabel.preferredMaxLayoutWidth = cell.contentView.frame.size.width-20;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

#pragma mark cell点击
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    HotelDetailViewController *vc = [[HotelDetailViewController alloc] init];
    vc.hotelName = [_dataArray[indexPath.row] name];
    vc.hotelId = [_dataArray[indexPath.row] _id];
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
