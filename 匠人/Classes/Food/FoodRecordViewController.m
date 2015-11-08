//
//  FoodRecordViewController.m
//  匠人
//
//  Created by BK on 15/11/4.
//  Copyright © 2015年 bk. All rights reserved.
//

#import "FoodRecordViewController.h"
#import "FoodRecordCell.h"
#import "FoodRecordImgCell.h"
#import "FoodRecordModel.h"
#import "Collect+CoreDataProperties.h"
#import "MagicalRecord.h"
#import "AppDelegate.h"
#import "UMSocial.h"
@interface FoodRecordViewController ()<UMSocialUIDelegate>
{
    FoodRecordModel *_foodRecordModel;
}
@end

@implementation FoodRecordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadData];
}
- (void)configUI {
    [super configUI];
    [self addTitleView:@"食记"];
    [self addBarBtnItemWithImageNames:@[@"top_share_1",@"top_fav_1_un"] withPosition:RIGHT_BARITEM withID:_foodId];
    [self addBarBtnItemWithImageNames:@[@"top_back_1"] withPosition:LEFT_BARITEM withID:@""];
    [_tableView registerNib:[UINib nibWithNibName:@"FoodRecordCell" bundle:nil] forCellReuseIdentifier:@"FoodRecordCell"];
    [_tableView registerNib:[UINib nibWithNibName:@"FoodRecordImgCell" bundle:nil] forCellReuseIdentifier:@"FoodRecordImgCell"];
    _tableView.backgroundColor = BTColor(236, 239, 243);
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}

#pragma mark - 收藏和分享
- (void)rightClick:(UIButton *)btn {
    if (btn.tag == 401) {
        if (_foodRecordModel) {
            btn.selected = !btn.selected;
            if (btn.selected) {
                Collect *collectModel = [Collect MR_createEntity];
                collectModel.image = _imageName;
                collectModel.title = _foodRecordModel.title;
                collectModel.type = @"food";
                collectModel.num = _foodId;
                [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreAndWait];
            }else {
                Collect *collectModel = [[Collect MR_findByAttribute:@"num" withValue:_foodId] firstObject];
                [collectModel MR_deleteEntity];
                [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreAndWait];
            }
            
        }
        
    }else {
        UIImageView *imageView = [[UIImageView alloc] init];
        FoodContentModel *contentModel = _foodRecordModel.content[0];
        [imageView sd_setImageWithURL:[NSURL URLWithString:contentModel.value]];
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
        socialData.shareText = [NSString stringWithFormat:@"%@ (来自#微味App#)",_foodRecordModel.title];
    }
    
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
#pragma mark - 加载数据
- (void)loadData {
    NSDate *date = [NSDate date];
    NSTimeInterval time = [date timeIntervalSince1970];
    [[HttpManager shareManager] requestWithUrl:[NSString stringWithFormat:KFoodRecordUrl,time,_foodId] withDictionary:nil withSuccessBlock:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSDictionary *dict = (NSDictionary *)responseObject;
        NSDictionary *dataDict = dict[@"data"];
        _foodRecordModel = [[FoodRecordModel alloc] initWithDictionary:dataDict error:nil];
        [_tableView reloadData];
    } withFailureBlock:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _foodRecordModel.content.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    FoodContentModel *model = _foodRecordModel.content[indexPath.row];
    if ([model.type isEqualToString:@"text"]) {
        FoodRecordCell *cell = [[[NSBundle mainBundle] loadNibNamed:@"FoodRecordCell" owner:self options:nil] firstObject];
        cell.contentModel = model;
        cell.descLabel.preferredMaxLayoutWidth = SCWTH - 20;
        CGFloat height = [cell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize].height+11;
        return height;
    }else {
        FoodRecordImgCell *cell = [[[NSBundle mainBundle] loadNibNamed:@"FoodRecordImgCell" owner:self options:nil] firstObject];
        cell.contentModel = model;
        cell.descLabel.preferredMaxLayoutWidth = SCWTH - 20;
        CGFloat height = [cell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize].height+11;
        return height;
    }
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    FoodContentModel *model = _foodRecordModel.content[indexPath.row];
    if ([model.type isEqualToString:@"text"]) {
        FoodRecordCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FoodRecordCell" forIndexPath:indexPath];
        cell.contentModel = model;
        cell.descLabel.preferredMaxLayoutWidth = SCWTH - 20;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }else {
        FoodRecordImgCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FoodRecordImgCell" forIndexPath:indexPath];
        cell.contentModel = model;
        cell.descLabel.preferredMaxLayoutWidth = SCWTH - 20;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
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
