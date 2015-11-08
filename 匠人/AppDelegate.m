//
//  AppDelegate.m
//  匠人
//
//  Created by BK on 15/10/30.
//  Copyright © 2015年 bk. All rights reserved.
//

#import "AppDelegate.h"
#import "RootViewController.h"
#import "MagicalRecord.h"
#import "UMSocial.h"
#import "SDWebImageManager.h"
#import "AFNetworking.h"
#import "MBProgressHUD+MJ.h"
@interface AppDelegate ()
{
    UIView *_bgView;
}
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window=[[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor=[UIColor clearColor];
    [self createTabBar];
    [self.window makeKeyAndVisible];
    // coreData
    [MagicalRecord setupCoreDataStackWithStoreNamed:@"collect.sqlite"];
    [UMSocialData setAppKey:UMKEY];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(daytime) name:DAYTIME object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(nighttime) name:NIGHTTIME object:nil];
    [self networking];
    return YES;
}
- (void)daytime {
    _bgView.alpha = 0.0;
}
- (void)nighttime {
     _bgView.alpha = 0.5;
}
- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}
- (void)createTabBar {
    
    UIViewController *rootVc = [[UIViewController alloc] init];
    _bgView = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    _bgView.backgroundColor = [UIColor blackColor];
    _bgView.userInteractionEnabled = NO;
    _bgView.alpha = 0.0;

    NSArray *nameArray=@[@"HomeViewController",@"FoodViewController",@"MineViewController"];
    NSArray *titleArray=@[@"首页",@"食记",@"我的"];
    NSArray *imageArray=@[@"tab_find",@"tab_daily",@"tab_mine"];
    NSArray *selImageArray=@[@"tab_find_orange",@"tab_daily_orange",@"tab_mine_orange"];
    
    _tab = [[BKTabBarController alloc] initWithVcNameArray:nameArray titleArray:titleArray itemArray:imageArray itemHArray:selImageArray itemSize:CGSizeMake(35, 35) space:30 bgImageName:@"UMS_nav_bar_bg_black" isNav:YES];
    [rootVc addChildViewController:_tab];
    [rootVc.view addSubview:_tab.view];
    [rootVc.view addSubview:_bgView];
    self.window.rootViewController = rootVc;
}

#pragma mark - 监控网络状态
- (void)networking {
    // 1.获得网络监控的管理者
    AFNetworkReachabilityManager *mgr = [AFNetworkReachabilityManager sharedManager];
    
    // 2.设置网络状态改变后的处理
    [mgr setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        // 当网络状态改变了, 就会调用这个block
        switch (status) {
            case AFNetworkReachabilityStatusUnknown: // 未知网络
                [MBProgressHUD showSuccess:@"未知网络"];
                break;
                
            case AFNetworkReachabilityStatusNotReachable: // 没有网络(断网)
                [MBProgressHUD showSuccess:@"没有网络"];
                break;
                
            case AFNetworkReachabilityStatusReachableViaWWAN: // 手机自带网络
                [MBProgressHUD showSuccess:@"蜂窝流量"];
                break;
                
            case AFNetworkReachabilityStatusReachableViaWiFi: // WIFI
                [MBProgressHUD showSuccess:@"WIFI"];
                break;
        }
    }];
    
    // 3.开始监控
    [mgr startMonitoring];
}
#pragma mark - 清除内存缓存
- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application {
    // 内存警告的时候清除内存中的缓存
    [[SDWebImageManager sharedManager] cancelAll];
    [[SDWebImageManager sharedManager].imageCache clearMemory];
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    [MagicalRecord cleanUp];
}

@end
