//
//  FoodSubViewController.m
//  匠人
//
//  Created by BK on 15/11/2.
//  Copyright © 2015年 bk. All rights reserved.
//

#import "FoodSubViewController.h"
#import "FoodModel.h"
#import "HomeCell.h"
#import "FoodRecordViewController.h"
#import "AppDelegate.h"
@interface FoodSubViewController ()
@property(nonatomic,assign)BOOL update;
@end

@implementation FoodSubViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadData];
}

#pragma mark - 搭建UI
- (void)configUI {
    [super configUI];
    self.update = YES;
    [self addMJrefreshWithHeader:YES andFooter:NO];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(welcome) name:@"SXAdvertisementKey" object:nil];
    _tableView.frame = CGRectMake(0, 0, SCWTH, SCHET-64-45);
    [_tableView registerNib:[UINib nibWithNibName:@"HomeCell" bundle:nil] forCellReuseIdentifier:@"HomeCell"];
     CGFloat cellH = (SCWTH-20)*0.4+85;
    _tableView.backgroundColor = [UIColor whiteColor];
    _tableView.rowHeight = cellH;
}

- (void)welcome
{
    [[NSUserDefaults standardUserDefaults]setBool:YES forKey:@"update"];
    [_tableView.header beginRefreshing];
}

- (void)viewWillAppear:(BOOL)animated
{
    if (![[NSUserDefaults standardUserDefaults]boolForKey:@"update"]) {
        return;
    }
    if (self.update == YES) {
        [_tableView.header beginRefreshing];
        self.update = NO;
    }
}
- (void)viewDidDisappear:(BOOL)animated {
 
}
#pragma mark - 加载数据
- (void)loadData {
    [[HttpManager shareManager] requestWithUrl:_url withDictionary:nil withSuccessBlock:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (_currentPage == 0) {
            [_dataArray removeAllObjects];
        }
        NSDictionary *dict = (NSDictionary *)responseObject;
        NSDictionary *dataDict = dict[@"data"];
        for (NSDictionary *dict in dataDict[@"list"]) {
            FoodModel *model = [[FoodModel alloc] initWithDictionary:dict error:nil];
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
#pragma mark tableview数据源和代理
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _dataArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    HomeCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HomeCell" forIndexPath:indexPath];
    cell.foodModel = _dataArray[indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    FoodRecordViewController *vc = [[FoodRecordViewController alloc] init];
    vc.foodId = [_dataArray[indexPath.row] _id];
    vc.imageName = [_dataArray[indexPath.row] cover];
    [self.navigationController pushViewController:vc animated:YES];
    AppDelegate *tempDelegate=(AppDelegate *)[UIApplication sharedApplication].delegate;
    tempDelegate.tab.tabBar.hidden = YES;
    [UIView animateWithDuration:0.5 animations:^{
        tempDelegate.tab.customBar.frame = CGRectMake(0, SCHET, SCWTH, 45);
        
    }];
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
