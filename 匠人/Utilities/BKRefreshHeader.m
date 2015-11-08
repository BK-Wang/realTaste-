//
//  BKRefreshHeader.m
//  day52-MJRefresh
//
//  Created by BK on 15/9/23.
//  Copyright © 2015年 bk. All rights reserved.
//

#import "BKRefreshHeader.h"
@implementation BKRefreshHeader

// 重写 prepare
- (void)prepare
{
    // 要调用super的方法
    [super prepare];
    
    NSMutableArray *idImage = [NSMutableArray array];
     // 设置闲置状态的图片
    UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"loading_mogu_1"]];
    [idImage addObject:image];
    [self setImages:idImage forState:MJRefreshStateIdle];
    
    NSMutableArray *pullImage = [NSMutableArray array];
    [pullImage addObject:image];
    // 松开即将刷新的时候的样式
    [self setImages:pullImage forState:MJRefreshStatePulling];
    
    NSMutableArray *refreshImage = [NSMutableArray array];
    for (NSInteger i = 1; i<=2; i++) {
        
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"loading_mogu_%ld.png",i]];
        [refreshImage addObject:image];
    }
    // 设置正在刷新时候的图片
    [self setImages:refreshImage forState:MJRefreshStateRefreshing];
    
    self.lastUpdatedTimeLabel.hidden = YES;
    self.stateLabel.hidden = YES;
}

@end
