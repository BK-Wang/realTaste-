//
//  SkinViewController.m
//  匠人
//
//  Created by BK on 15/11/4.
//  Copyright © 2015年 bk. All rights reserved.
//

#import "SkinViewController.h"
#import "SkinCell.h"
#import "AppDelegate.h"
@interface SkinViewController ()
{
    NSArray *_skinArray;
}
@end

@implementation SkinViewController
- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"changeSkin" object:nil];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadData];
}
- (void)configUI {
    [super configUI];
    [self addBarBtnItemWithImageNames:@[@"top_back_1"] withPosition:LEFT_BARITEM withID:@""];
    [_tableView registerNib:[UINib nibWithNibName:@"SkinCell" bundle:nil] forCellReuseIdentifier:@"SkinCell"];
    _tableView.rowHeight = SCWTH*0.55;
    
}
- (void)leftClick:(UIButton *)btn {
    [self.navigationController popViewControllerAnimated:YES];
    AppDelegate *tempDelegate=(AppDelegate *)[UIApplication sharedApplication].delegate;
    tempDelegate.tab.tabBar.hidden = YES;
    [UIView animateWithDuration:0.5 animations:^{
        tempDelegate.tab.customBar.frame = CGRectMake(0, SCHET-45, SCWTH, 45);
    }];
}
- (void)loadData {
    _skinArray = @[@"recommend_header_1.jpg",@"recommend_header_2.jpg",@"recommend_header_3.jpg",@"recommend_header_4.jpg",@"recommend_header_5.jpg"];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _skinArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SkinCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SkinCell" forIndexPath:indexPath];
    cell.skinImage.image = [UIImage imageNamed:_skinArray[indexPath.row]];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [[NSNotificationCenter defaultCenter] postNotificationName:@"changeSkin" object:nil userInfo:@{@"skinName":_skinArray[indexPath.row]}];
    [self.navigationController popViewControllerAnimated:YES];
    AppDelegate *tempDelegate=(AppDelegate *)[UIApplication sharedApplication].delegate;
    tempDelegate.tab.tabBar.hidden = YES;
    [UIView animateWithDuration:0.5 animations:^{
        tempDelegate.tab.customBar.frame = CGRectMake(0, SCHET-45, SCWTH, 45);
    }];
    if (_block) {
        _block(_skinArray[indexPath.row]);
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
