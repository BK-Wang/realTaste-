//
//  ListViewController.m
//  buding
//
//  Created by qianfeng on 15/10/24.
//  Copyright (c) 2015年 XBQ. All rights reserved.
//

#import "ListViewController.h"
#import "BKRefreshHeader.h"
@interface ListViewController ()

@end

@implementation ListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _dataArray = [NSMutableArray array];
    [self configUI];
}

-(void)setUserID:(NSString *)userID
{
    _userID=userID;
}
/**
 *  搭建UI
 */
- (void)configUI {
    self.automaticallyAdjustsScrollViewInsets=NO;
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCWTH, SCHET-64) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
}
/**
 *  加载数据
 */
- (void)loadData {
    STTLog(@"子类需要重写loadData");
}

#pragma mark -- 为视图添加 上啦刷新和下拉加载更多
/**
 *  添加上啦刷新和下拉加载更多
 */
-(void)addMJrefreshWithHeader:(BOOL)isHead andFooter:(BOOL)isFoot
{
    
    __weak  typeof(&*self) weakSelf = self;
    
    if (isHead) {
        // 允许添加 上啦刷新
        _tableView.header = [BKRefreshHeader headerWithRefreshingBlock:^{
            [weakSelf reloadData];
        }];
    }
    if (isFoot) {
        _tableView.footer = [MJRefreshAutoFooter footerWithRefreshingBlock:^{
            [weakSelf loadMore];
        }];
    }
    // 一旦 添加到视图上面的时候 就开始 加载数据
    [_tableView.header beginRefreshing];
}

-(void)loadMore
{
    NSLog(@"子类需要实现  loadMore  ");
    
}


-(void)reloadData
{
    NSLog(@"子类需要实现  reloadData  ");
}

#pragma mark tableView代理和数据源
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    STTLog(@"子类需要重写numberOfRowsInSection");
    return 0;
}

//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
//    STTLog(@"子类需要重写heightForRowAtIndexPath");
//    return 0;
//}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
     STTLog(@"子类需要重写cellForRowAtIndexPath");
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
