//
//  HomeCityDetailViewController.m
//  匠人
//
//  Created by BK on 15/11/2.
//  Copyright © 2015年 bk. All rights reserved.
//

#import "HomeCityDetailViewController.h"
#import "CityDetailModel.h"
#import "CityDetailTopCell.h"
#import "CityDetailSecondCell.h"
#import "CityDetailCellHeadView.h"
#import "FoodDetailViewController.h"
#import "HotelDetailViewController.h"
#import "Collect+CoreDataProperties.h"
#import "MagicalRecord.h"
#import "UMSocial.h"
#import "AppDelegate.h"
@interface HomeCityDetailViewController ()<UMSocialUIDelegate>
{
    CityDetailModel *_model;
    NSArray *_textArray;
    UIImageView *_headView;
}
@end

@implementation HomeCityDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadData];
}

- (void)viewWillAppear:(BOOL)animated {
   
}

#pragma mark - 搭建UI
- (void)configUI {
    [super configUI];
    [self addTitleView:_cityName];
    [self addBarBtnItemWithImageNames:@[@"top_share_1",@"top_fav_1_un"] withPosition:RIGHT_BARITEM withID:_cityId];
    [self addBarBtnItemWithImageNames:@[@"top_back_1"] withPosition:LEFT_BARITEM withID:@""];
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [_tableView registerClass:[CityDetailTopCell class] forCellReuseIdentifier:@"CityDetailTopCell"];
    [_tableView registerNib:[UINib nibWithNibName:@"CityDetailSecondCell" bundle:nil] forCellReuseIdentifier:@"CityDetailSecondCell"];
    _headView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, SCWTH, SCWTH*0.45)];
    _headView.contentMode = UIViewContentModeScaleAspectFit;
    _headView.clipsToBounds = YES;
    _tableView.tableHeaderView = _headView;
}

- (void)leftClick:(UIButton *)btn {
    if (_block) {
        _block();
    }
    [self.navigationController popViewControllerAnimated:YES];
    AppDelegate *tempDelegate=(AppDelegate *)[UIApplication sharedApplication].delegate;
    tempDelegate.tab.tabBar.hidden = YES;
    [UIView animateWithDuration:0.5 animations:^{
        tempDelegate.tab.customBar.frame = CGRectMake(0, SCHET-45, SCWTH, 45);
        
    }];
}
#pragma mark - 收藏和分享
- (void)rightClick:(UIButton *)btn {
    if (btn.tag == 401) {
        btn.selected = !btn.selected;
        if (btn.selected) {
            Collect *collectModel = [Collect MR_createEntity];
            collectModel.image = _model.imgs[0];
            collectModel.title = _cityName;
            collectModel.type = @"city";
            collectModel.num = _cityId;
            [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreAndWait];
        }else {
            Collect *collectModel = [[Collect MR_findByAttribute:@"num" withValue:_cityId] firstObject];
            [collectModel MR_deleteEntity];
            [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreAndWait];
        }
        
    }else {
        UIImageView *imageView = [[UIImageView alloc] init];
        [imageView sd_setImageWithURL:[NSURL URLWithString:_model.imgs[0]]];
        [UMSocialConfig setFinishToastIsHidden:NO position:UMSocialiToastPositionCenter];
        [UMSocialSnsService presentSnsIconSheetView:self appKey:UMKEY shareText:@"UMOnce" shareImage:imageView.image shareToSnsNames:@[UMShareToQQ,UMShareToWechatTimeline,UMShareToSina] delegate:self];
    }
}
#pragma mark - UM分享
- (void)didSelectSocialPlatform:(NSString *)platformName withSocialData:(UMSocialData *)socialData{
    if ([platformName isEqualToString:UMShareToQQ]){
        socialData.title = @"来自微味";
        socialData.shareText = @"#微味#";
    }else if ([platformName isEqualToString:UMShareToWechatTimeline]){
        socialData.title = @"来自微味";
        socialData.shareText = @"#微味#";
    }else if ([platformName isEqualToString:UMShareToSina]){
        socialData.title = @"来自微味";
        socialData.shareText = [NSString stringWithFormat:@"我在【微味】发现了%@有很多不错的餐厅 (来自#微味App#)",_cityName];
    }
    
}

#pragma mark - 加载数据
- (void)loadData {
    NSDate *date = [NSDate date];
    NSTimeInterval time = [date timeIntervalSince1970];
    NSLog(@"%@",[NSString stringWithFormat:KHotCityDetailUrl,time,_cityId]);
    [[HttpManager shareManager] requestWithUrl:[NSString stringWithFormat:KHotCityDetailUrl,time,_cityId] withDictionary:nil withSuccessBlock:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSDictionary *dict = (NSDictionary *)responseObject;
        NSDictionary *dataDict = dict[@"data"];
        _model = [[CityDetailModel alloc] initWithDictionary:dataDict error:nil];
        [_headView sd_setImageWithURL:[NSURL URLWithString:_model.imgs[0]]];
        [_tableView reloadData];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    } withFailureBlock:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
    _textArray = @[@[@"当地必吃",@"决不能错过的美味"],@[@"必去餐厅",@"念念不忘 留有余味"]];
}

#pragma mark - tableView代理和数据源 
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
        CGFloat itemW = (SCWTH-30)/2.0;
        CGFloat itemH = itemW+60;
        return _model.dishlist.count/2*itemH;
    }else {
        CGFloat cellH = 0.55*SCWTH;
        return cellH;
    }
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        CityDetailTopCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CityDetailTopCell" forIndexPath:indexPath];
        if (_model.dishlist.count>0) {
            cell.dishList = _model.dishlist;
        }
        cell.block = ^(NSString *foodId){
            FoodDetailViewController *vc = [[FoodDetailViewController alloc] init];
            vc.cityName = [NSString stringWithFormat:@"%@必吃",_cityName];
            vc.foodId = foodId;
            [self.navigationController pushViewController:vc animated:YES];
        };
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }else {
        CityDetailSecondCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CityDetailSecondCell" forIndexPath:indexPath];
        cell.listModel = _model.list[indexPath.row];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
   
}

#pragma mark - cell的头部
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 50;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    CityDetailCellHeadView *view = [[CityDetailCellHeadView alloc] initWithFrame:CGRectMake(0, 0, SCWTH, 50)];
    view.backgroundColor = [UIColor whiteColor];
    view.textArray = _textArray[section];
    return view;
}

#pragma mark - 去掉section头部的粘滞效果
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat sectionHeaderHeight = 50;
    if (scrollView.contentOffset.y<=sectionHeaderHeight&&scrollView.contentOffset.y>=0) {
        scrollView.contentInset = UIEdgeInsetsMake(-scrollView.contentOffset.y, 0, 0, 0);
    } else if (scrollView.contentOffset.y>=sectionHeaderHeight) {
        scrollView.contentInset = UIEdgeInsetsMake(-sectionHeaderHeight, 0, 0, 0);
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
