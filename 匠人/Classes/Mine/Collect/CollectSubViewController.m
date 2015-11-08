//
//  CollectSubViewController.m
//  匠人
//
//  Created by BK on 15/11/4.
//  Copyright © 2015年 bk. All rights reserved.
//

#import "CollectSubViewController.h"
#import "HotelSecondCell.h"
#import "Collect+CoreDataProperties.h"
#import "MagicalRecord.h"
#import "HotelDetailViewController.h"
#import "HomeCityDetailViewController.h"
#import "FoodRecordViewController.h"
@interface CollectSubViewController ()
@property(nonatomic,assign)BOOL update;
@end

@implementation CollectSubViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadData];
}

//- (void)welcome
//{
//    [[NSUserDefaults standardUserDefaults]setBool:YES forKey:@"update"];
//    [_tableView.header beginRefreshing];
//}
//
//- (void)viewWillAppear:(BOOL)animated
//{
//    if (![[NSUserDefaults standardUserDefaults]boolForKey:@"update"]) {
//        return;
//    }
//    if (self.update == YES) {
//        [_tableView.header beginRefreshing];
//        self.update = NO;
//    }
//}

- (void)viewWillAppear:(BOOL)animated {
//    [_tableView reloadData];
}
- (void)configUI {
    [super configUI];
    self.update = YES;
//    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(welcome) name:@"SXAdvertisementKey" object:nil];
    
    [_tableView registerNib:[UINib nibWithNibName:@"HotelSecondCell" bundle:nil] forCellReuseIdentifier:@"HotelSecondCell"];
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}
- (void)loadData {
   NSArray *array = [Collect MR_findByAttribute:@"type" withValue:_dataObject];
    _dataArray = [NSMutableArray arrayWithArray:array];
    [_tableView reloadData];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _dataArray.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return SCWTH*0.5;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    HotelSecondCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HotelSecondCell" forIndexPath:indexPath];
    cell.collectModel = _dataArray[indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if ([_dataObject isEqualToString:@"hotel"]) {
        HotelDetailViewController *vc = [[HotelDetailViewController alloc] init];
        vc.block = ^{
            [_dataArray removeAllObjects];
            [self loadData];
        };
        vc.hotelId = [_dataArray[indexPath.row] num];
        vc.hotelName = [_dataArray[indexPath.row] title];
        [self.navigationController pushViewController:vc animated:YES];
    }else if ([_dataObject isEqualToString:@"city"]) {
        HomeCityDetailViewController *vc = [[HomeCityDetailViewController alloc] init];
        vc.block = ^{
            [_dataArray removeAllObjects];
            [self loadData];
        };
        vc.cityId = [_dataArray[indexPath.row] num];
        vc.cityName = [_dataArray[indexPath.row] title];
        [self.navigationController pushViewController:vc animated:YES];
    }else if ([_dataObject isEqualToString:@"food"]) {
        FoodRecordViewController *vc = [[FoodRecordViewController alloc] init];
        vc.block = ^{
            [_dataArray removeAllObjects];
            [self loadData];
        };
        vc.foodId = [_dataArray[indexPath.row] num];
        vc.imageName = [_dataArray[indexPath.row] title];
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
