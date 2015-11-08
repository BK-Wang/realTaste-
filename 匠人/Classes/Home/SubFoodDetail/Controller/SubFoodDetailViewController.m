//
//  SubFoodDetailViewController.m
//  匠人
//
//  Created by BK on 15/11/3.
//  Copyright © 2015年 bk. All rights reserved.
//

#import "SubFoodDetailViewController.h"
#import "SubFoodDetailCell.h"
#import "SubFoodDetail.h"
#import "SDCycleScrollView.h"
@interface SubFoodDetailViewController ()
{
    SubFoodDetail *_model;
    SDCycleScrollView *_cycleScrollView;
}
@end

@implementation SubFoodDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadData];
}
#pragma mark - 搭建UI
- (void)configUI {
    [super configUI];
    [self addTitleView:_foodName];
    [self addBarBtnItemWithImageNames:@[@"top_back_1"] withPosition:LEFT_BARITEM withID:@""];
    [_tableView registerNib:[UINib nibWithNibName:@"SubFoodDetailCell" bundle:nil] forCellReuseIdentifier:@"SubFoodDetailCell"];
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    SDCycleScrollView *cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, SCWTH, SCWTH*0.5) imageURLStringsGroup:nil];
    cycleScrollView.contentMode = UIViewContentModeScaleAspectFill;
    cycleScrollView.pageControlAliment = SDCycleScrollViewPageContolAlimentCenter;
    cycleScrollView.pageControlStyle = SDCycleScrollViewPageContolStyleClassic;
    cycleScrollView.autoScrollTimeInterval = 4.0f;
    cycleScrollView.showPageControl = NO;
    _tableView.tableHeaderView = cycleScrollView;
    _cycleScrollView = cycleScrollView;
}
- (void)leftClick:(UIButton *)btn {
    [self.navigationController popViewControllerAnimated:YES];
}
#pragma mark - 加载数据
- (void)loadData {
    NSDate *date = [NSDate date];
    NSTimeInterval time = [date timeIntervalSince1970];
    [[HttpManager shareManager] requestWithUrl:[NSString stringWithFormat:KSubFoodDetailUrl,_foodId,time] withDictionary:nil withSuccessBlock:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSDictionary *dict = (NSDictionary *)responseObject;
        NSDictionary *dataDict = dict[@"data"];
        _model = [[SubFoodDetail alloc] initWithDictionary:dataDict error:nil];
        _cycleScrollView.imageURLStringsGroup = _model.imgs;
        _cycleScrollView.showPageControl = YES;
        [_tableView reloadData];
    } withFailureBlock:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
}

#pragma mark tableView代理和数据源
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    SubFoodDetailCell *cell = [[[NSBundle mainBundle] loadNibNamed:@"SubFoodDetailCell" owner:self options:nil] firstObject];
    cell.model = _model;
    cell.reasonLabel.preferredMaxLayoutWidth = SCWTH-20;
    cell.tasteLabel.preferredMaxLayoutWidth = SCWTH-20;
    cell.descLabel.preferredMaxLayoutWidth = SCWTH-20;
    cell.materialLabel.preferredMaxLayoutWidth = SCWTH-20;
    CGFloat height = [cell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize].height+1;
    return height;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SubFoodDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SubFoodDetailCell" forIndexPath:indexPath];
    cell.model = _model;
    return cell;
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
