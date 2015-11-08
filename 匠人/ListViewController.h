//
//  ListViewController.h
//  buding
//
//  Created by qianfeng on 15/10/24.
//  Copyright (c) 2015年 XBQ. All rights reserved.
//

#import "RootViewController.h"
#import "HttpManager.h"
#import "UIImageView+WebCache.h"
#import "MJRefresh.h"
@interface ListViewController : RootViewController<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *_tableView;
    NSMutableArray *_dataArray;
    NSInteger *_currentPage;
     NSString *_userID;
}
/**
 *  每一个vc的一个类型
 */
@property (nonatomic,assign)NSInteger  vcType;
-(void)configUI;/**< 搭建UI */
-(void)loadData;/**< 数据加载 */
// 添加上啦刷新和下拉加载更多
-(void)addMJrefreshWithHeader:(BOOL)isHead andFooter:(BOOL)isFoot;

-(void)loadMore;

-(void)reloadData;

-(void)setUserID:(NSString *)userID;
@end
