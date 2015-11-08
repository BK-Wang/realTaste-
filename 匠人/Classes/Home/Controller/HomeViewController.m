//
//  HomeViewController.m
//  匠人
//
//  Created by BK on 15/10/30.
//  Copyright © 2015年 bk. All rights reserved.
//

#import "HomeViewController.h"
#import "AppDelegate.h"
#import "HomeModel.h"
#import "HomeTopCell.h"
#import "HomeSecondCell.h"
#import "HomeCell.h"
#import "HomeCatagoryViewController.h"
#import "HomeCityViewController.h"
#import "HomeCityDetailViewController.h"
#import "FoodRecordViewController.h"
@interface HomeViewController ()
{
    UIView *_view;
    UIImageView *_headView;
}
@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeSkin:) name:@"changeSkin" object:nil];
    [self loadData];
}
- (void)changeSkin:(NSNotification *)not {
    _headView.image = [UIImage imageNamed:not.userInfo[@"skinName"]];
}
- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"changeSkin" object:nil];
}
- (void)viewDidAppear:(BOOL)animated {
   
}
- (void)viewDidDisappear:(BOOL)animated {
   
}
#pragma mark - 搭建UI
- (void)configUI {
    [super configUI];
    [self addTitleView:@"首页"];
    [self addBarBtnItemWithTitle:nil withImageName:@"white_logo" withFrame:CGRectMake(0, 0, 54, 44) withPosition:LEFT_BARITEM];
    [self addMJrefreshWithHeader:YES andFooter:NO];
    _tableView.frame = CGRectMake(0, 0, SCWTH, SCHET-64-45);
    [_tableView registerClass:[HomeTopCell class] forCellReuseIdentifier:@"HomeTopCell"];
    [_tableView registerClass:[HomeSecondCell class] forCellReuseIdentifier:@"HomeSecondCell"];
    [_tableView registerNib:[UINib nibWithNibName:@"HomeCell" bundle:nil] forCellReuseIdentifier:@"HomeCell"];
     _headView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, SCWTH, SCWTH*0.55)];
    _headView.contentMode = UIViewContentModeScaleAspectFill;
    _headView.image = [UIImage imageNamed:@"recommend_header_1.jpg"];
    _tableView.tableHeaderView = _headView;
}

#pragma mark - 加载数据
- (void)loadData {
    NSDate *date = [NSDate date];
    NSTimeInterval time = [date timeIntervalSince1970];
    [[HttpManager shareManager] requestWithUrl:[NSString stringWithFormat:HomeURL,time] withDictionary:nil withSuccessBlock:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (_currentPage == 0) {
            [_dataArray removeAllObjects];
        }
        NSDictionary *dict = (NSDictionary *)responseObject;
        NSDictionary *dataDict = dict[@"data"];
        NSArray *listArray = dataDict[@"list"];
        for (NSDictionary *dict in listArray) {
            ListModel *model = [[ListModel alloc] initWithDictionary:dict error:nil];
            [_dataArray addObject:model];
        }
        [_tableView.header endRefreshing];
        [_tableView reloadData];
    } withFailureBlock:^(AFHTTPRequestOperation *operation, NSError *error) {
         [_tableView.header endRefreshing];
    }];
}
- (void)reloadData {
    _currentPage = 0;
    [self loadData];
}
#pragma mark - tableView代理和数据源
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 2) {
        if (_dataArray.count>0) {
            ListModel *model = _dataArray[3];
            return model.content.count;
        }else {
            return 0;
        }
       
    }else {
        return 1;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        CGFloat viewW = (SCWTH-120)/5.0;
        CGFloat viewH = viewW+40;
        return viewH;
    }else if (indexPath.section == 1) {
        CGFloat itemW = (SCWTH-50)/3.0;
        CGFloat itemH = itemW+30;
        CGFloat cellH = itemH*5+60;
        return cellH;
    }else {
        CGFloat cellH = (SCWTH-20)*0.4+85;
        return cellH;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        HomeTopCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HomeTopCell" forIndexPath:indexPath];
        if (_dataArray.count>0) {
             ListModel *model = _dataArray[1];
            NSArray *contentArray = model.content;
            cell.contentArray = contentArray;
        }
        
        cell.block = ^(NSInteger tag){
            HomeCatagoryViewController *vc = [[HomeCatagoryViewController alloc] init];
            if (tag == 100) {
                vc.url = KHomeMichelinUrl;
                vc.catagoryName = @"米其林全球指南";
            }else if (tag == 101) {
                vc.url = KHomeChineseFoodUrl;
                vc.catagoryName = @"吃遍全球中餐";
            }else if (tag == 102) {
                vc.url = KHomeCafeUrl;
                vc.catagoryName = @"世界咖啡之旅";
            }
            [self.navigationController pushViewController:vc animated:YES];
            AppDelegate *tempDelegate=(AppDelegate *)[UIApplication sharedApplication].delegate;
            tempDelegate.tab.tabBar.hidden = YES;
            [UIView animateWithDuration:0.5 animations:^{
                tempDelegate.tab.customBar.frame = CGRectMake(0, SCHET, SCWTH, 45);
                
            }];
        };
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }else if (indexPath.section == 1) {
        HomeSecondCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HomeSecondCell" forIndexPath:indexPath];
        if (_dataArray.count>0) {
            ListModel *model = _dataArray[2];
            cell.model = model;
            NSArray *contentArray = model.content;
            cell.contentArray = contentArray;
        }
        cell.block = ^(NSString *cityName,NSString *_id,NSInteger index){
            if (index<9) {
                HomeCityViewController *vc = [[HomeCityViewController alloc] init];
                vc.cityId = cityName;
                vc.countryName = cityName;
                vc.hidesBottomBarWhenPushed = YES;
                [self.navigationController pushViewController:vc animated:YES];
                AppDelegate *tempDelegate=(AppDelegate *)[UIApplication sharedApplication].delegate;
                tempDelegate.tab.tabBar.hidden = YES;
                [UIView animateWithDuration:0.5 animations:^{
                    tempDelegate.tab.customBar.frame = CGRectMake(0, SCHET, SCWTH, 45);
                    
                }];
            }else {
                HomeCityDetailViewController *vc = [[HomeCityDetailViewController alloc] init];
                vc.cityName = cityName;
                vc.cityId = _id;
                [self.navigationController pushViewController:vc animated:YES];
                AppDelegate *tempDelegate=(AppDelegate *)[UIApplication sharedApplication].delegate;
                tempDelegate.tab.tabBar.hidden = YES;
                [UIView animateWithDuration:0.5 animations:^{
                    tempDelegate.tab.customBar.frame = CGRectMake(0, SCHET, SCWTH, 45);
                    
                }];
            }
           
        };
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }else {
        HomeCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HomeCell" forIndexPath:indexPath];
        if (_dataArray.count>0) {
            ListModel *model = _dataArray[3];
            NSArray *contentArray = model.content;
            cell.model = contentArray[indexPath.row];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 2) {
        FoodRecordViewController *vc = [[FoodRecordViewController alloc] init];
        ListModel *model = _dataArray[3];
        ContentModel *contentModel = model.content[indexPath.row];
        vc.foodId = contentModel._id;
        [self.navigationController pushViewController:vc animated:YES];
        AppDelegate *tempDelegate=(AppDelegate *)[UIApplication sharedApplication].delegate;
        tempDelegate.tab.tabBar.hidden = YES;
        [UIView animateWithDuration:0.5 animations:^{
            tempDelegate.tab.customBar.frame = CGRectMake(0, SCHET, SCWTH, 45);
            
        }];
    }
}

#pragma mark 根据offset改变navBar透明度
//- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
//    if (scrollView.contentOffset.y>=150) {
//        self.navigationController.navigationBarHidden = NO;
//        [UIView animateWithDuration:0.2 animations:^{
//            _view.alpha = 0.6;
//            
//        }];
//    }
//    if (scrollView.contentOffset.y<150) {
//        
//        [UIView animateWithDuration:0.1 animations:^{
//            _view.alpha = 0.0;
//            self.navigationController.navigationBarHidden = YES;
//        }];
//    }
//}
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
