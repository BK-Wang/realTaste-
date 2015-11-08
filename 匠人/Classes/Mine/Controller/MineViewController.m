//
//  MineViewController.m
//  匠人
//
//  Created by BK on 15/11/1.
//  Copyright © 2015年 bk. All rights reserved.
//

#import "MineViewController.h"
#import "SkinViewController.h"
#import "CollectViewController.h"
#import "AppDelegate.h"
@interface MineViewController ()
{
    NSArray *_iconArray;
    NSArray *_textArray;
    CGFloat _imageSize;
    UIAlertController *_alertController;
    UIImageView *_headView;
    UISwitch *_switch1;
}
@end

@implementation MineViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeSkin:) name:@"changeSkin" object:nil];
    [self loadData];
}

#pragma mark - 换肤
- (void)changeSkin:(NSNotification *)not {
    _headView.image = [UIImage imageNamed:not.userInfo[@"skinName"]];
}
- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"changeSkin" object:nil];
}
#pragma mark - 搭建UI
- (void)configUI {
    [super configUI];
    [self addTitleView:@"我的主页"];
    _headView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, SCWTH, SCWTH*0.55)];
    _headView.contentMode = UIViewContentModeScaleAspectFill;
    _headView.image = [UIImage imageNamed:@"recommend_header_1.jpg"];
    _tableView.tableHeaderView = _headView;
    _tableView.tableFooterView = [[UIView alloc] init];
}
#pragma mark - 加载数据
- (void)loadData {
    _iconArray = @[@"icon_my_collect",@"icon_my_note",@"icon_camera",@"icon_cleancache"];
    _textArray = @[@"我的收藏",@"夜间模式",@"更换图片",@"清除缓存"];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _iconArray.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *ID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell==nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ID];
    }
    cell.imageView.image = [UIImage imageNamed:_iconArray[indexPath.row]];
    cell.textLabel.text = _textArray[indexPath.row];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    if (indexPath.row == 1) {
        if (!_switch1) {
            _switch1 = [[UISwitch alloc] init];
            [_switch1 addTarget:self action:@selector(switchClick:) forControlEvents:UIControlEventTouchUpInside];
            cell.accessoryView = _switch1;
        }
    }else if (indexPath.row==3) {
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 50)];
        SDImageCache *imageCache = [[SDImageCache alloc] init];
        _imageSize = [imageCache getSize]/ 1024.0 / 1024.0;
        label.text = [NSString stringWithFormat:@"%.2fMB",_imageSize];
        label.textAlignment = NSTextAlignmentRight;
        label.font = [UIFont systemFontOfSize:16];
        cell.accessoryView = label;
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        CollectViewController *vc = [[CollectViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
        AppDelegate *tempDelegate=(AppDelegate *)[UIApplication sharedApplication].delegate;
        tempDelegate.tab.tabBar.hidden = YES;
        [UIView animateWithDuration:0.5 animations:^{
            tempDelegate.tab.customBar.frame = CGRectMake(0, SCHET, SCWTH, 45);
            
        }];
    }else if (indexPath.row == 1) {
        
    }else if (indexPath.row == 2) {
        SkinViewController *vc = [[SkinViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
        AppDelegate *tempDelegate=(AppDelegate *)[UIApplication sharedApplication].delegate;
        tempDelegate.tab.tabBar.hidden = YES;
        [UIView animateWithDuration:0.5 animations:^{
            tempDelegate.tab.customBar.frame = CGRectMake(0, SCHET, SCWTH, 45);
            
        }];
    }else if (indexPath.row == 3) {
        _alertController = [UIAlertController alertControllerWithTitle:@"真的要清空图片喵(＞﹏＜)" message:nil preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *action = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            
        }];
        [_alertController addAction:action];
        UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            // 清除图片缓存
            [[SDWebImageManager sharedManager].imageCache clearDiskOnCompletion:^{
                [_tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:NO];
            }];
        }];
        [_alertController addAction:action1];
        [self presentViewController:_alertController animated:YES completion:nil];
    }
}
- (void)switchClick:(UISwitch *)switch1 {
    if (!switch1.on) {
        [[NSNotificationCenter defaultCenter] postNotificationName:DAYTIME object:nil];
    }else {
        [[NSNotificationCenter defaultCenter] postNotificationName:NIGHTTIME object:nil];
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
