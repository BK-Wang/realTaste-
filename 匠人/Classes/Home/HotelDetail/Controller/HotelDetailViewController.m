//
//  HotelDetailViewController.m
//  匠人
//
//  Created by BK on 15/11/2.
//  Copyright © 2015年 bk. All rights reserved.
//

#import "HotelDetailViewController.h"
#import "HotelDetailCell.h"
#import "HotelDetailModel.h"
#import "HotelSecondCell.h"
#import "SDCycleScrollView.h"
#import "SubFoodDetailViewController.h"
#import "Collect+CoreDataProperties.h"
#import "SubFoodDetailViewController.h"
#import "MagicalRecord.h"
#import "UMSocial.h"
#import "AlertView.h"
@interface HotelDetailViewController ()<UMSocialUIDelegate>
{
    HotelDetailModel *_model;
    SDCycleScrollView *_cycleScrollView;
    AlertView *_alertView;
}
@end

@implementation HotelDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadData];
}
#pragma mark - 搭建UI
- (void)configUI {
    [super configUI];
    [self addTitleView:_hotelName];
    [self addBarBtnItemWithImageNames:@[@"top_share_1",@"top_fav_1_un"] withPosition:RIGHT_BARITEM withID:_hotelId];
    [self addBarBtnItemWithImageNames:@[@"top_back_1"] withPosition:LEFT_BARITEM withID:@""];
    [_tableView registerNib:[UINib nibWithNibName:@"HotelDetailCell" bundle:nil] forCellReuseIdentifier:@"HotelDetailCell"];
    [_tableView registerNib:[UINib nibWithNibName:@"HotelSecondCell" bundle:nil] forCellReuseIdentifier:@"HotelSecondCell"];
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
    if (_block) {
        _block();
    }
    [self.navigationController popViewControllerAnimated:YES];
}
#pragma mark - 收藏和分享
- (void)rightClick:(UIButton *)btn {
    if (btn.tag == 401) {
        if (_model) {
            btn.selected = !btn.selected;
            if (btn.selected) {
                Collect *collectModel = [Collect MR_createEntity];
                collectModel.image = _model.imgs[0];
                collectModel.title = _hotelName;
                collectModel.type = @"hotel";
                collectModel.num = _hotelId;
                [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreAndWait];
            }else {
                Collect *collectModel = [[Collect MR_findByAttribute:@"num" withValue:_hotelId] firstObject];
                [collectModel MR_deleteEntity];
                [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreAndWait];
            }
            
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
        socialData.shareText = [NSString stringWithFormat:@"我在【微味】发现了一家很好的餐厅 (来自#微味App#)"];
    }
    
}

#pragma mark - 加载数据
- (void)loadData {
    NSDate *date = [NSDate date];
    NSTimeInterval time = [date timeIntervalSince1970];
//    NSLog(@"%@",[NSString stringWithFormat:KHotelDetailUrl,time,_hotelId]);
    [[HttpManager shareManager] requestWithUrl:[NSString stringWithFormat:KHotelDetailUrl,time,_hotelId] withDictionary:nil withSuccessBlock:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSDictionary *dict = (NSDictionary *)responseObject;
        NSDictionary *dataDict = dict[@"data"];
        _model = [[HotelDetailModel alloc] initWithDictionary:dataDict error:nil];
        _cycleScrollView.imageURLStringsGroup = _model.imgs;
        _cycleScrollView.showPageControl = YES;
        [_tableView reloadData];
    } withFailureBlock:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
}
#pragma mark tableView代理和数据源
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 1;
    }
    return _model.list.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        HotelDetailCell *cell = [[[NSBundle mainBundle] loadNibNamed:@"HotelDetailCell" owner:self options:nil] firstObject];
        cell.model = _model;
        cell.descLabel.preferredMaxLayoutWidth = SCWTH-110;
        cell.reasonLabel.preferredMaxLayoutWidth = SCWTH-20;
        CGFloat height = [cell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize].height+1;
        return height;
    }else {
        return SCWTH*0.5;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        HotelDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HotelDetailCell" forIndexPath:indexPath];
        
        cell.model = _model;
        cell.block = ^{
            _alertView = [[AlertView alloc] initWithFrame:[UIScreen mainScreen].bounds];
            _alertView.desc = _model.desc;
            [self.view addSubview:_alertView];
        };
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }else {
        HotelSecondCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HotelSecondCell" forIndexPath:indexPath];
        HotelListModel *model = _model.list[indexPath.row];
        cell.listModel = model;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
}

#pragma mark cell点击
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 1) {
        SubFoodDetailViewController *vc = [[SubFoodDetailViewController alloc] init];
        HotelListModel *model = _model.list[indexPath.row];
        vc.foodName = model.name;
        vc.foodId = model._id;
        [self.navigationController pushViewController:vc animated:YES];
    }
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [_alertView removeFromSuperview];
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
