//
//  Define.h
//  buding
//
//  Created by XBQ on 15/10/20.
//  Copyright (c) 2015年 XBQ. All rights reserved.
//

#ifndef buding_Define_h
#define buding_Define_h

#define TITLE @"title"
#define NAV_TITLE @"nav_title"
#define TABBAR_TITLE @"tabbar_title"
#define TABBAR_IMAGE @"tabbar_image"
#define TABBAR_SEL_IMAGE @"tabbar_sel_image"

#define TITLECOLOR [UIColor orangeColor]
#define TITLE_FONT 17
#define LEFT_BARITEM 1
#define RIGHT_BARITEM 2
#define BDcellPadding 10
#pragma mark 颜色
#define BTColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
#define BTNTAG 20000
#define UMKEY @"563aa757e0f55a531c003af3"
//屏幕宽度
#define SCWTH   [UIScreen mainScreen].bounds.size.width
// 屏幕高度
#define SCHET [UIScreen mainScreen].bounds.size.height
#define weakSelf(ws) __weak typeof(&*self) (ws) = self;

#define DAYTIME @"daytime"
#define NIGHTTIME @"nighttitle"
#ifdef DEBUG
#define STTLog(...) NSLog(__VA_ARGS__)
#else
#define  STTLog(...)
#endif


#pragma mark 链接地址
/** 首页链接*/
#define HomeURL @"http://www.youyuwei.com/api/recommend?ywsdk_ver=20131018&app_code=com.youyuwei.yuwei.ios&oauth_timestamp=%f&oauth_version=1.0&oauth_nonce=fc0a2992434aeda6db9e526b6af06918&oauth_signature=DHUkdl2BL0zjj3fWHfzgwgbHTE183D&sys_ver=8.1.2&hardware_model=iPhone72C2&oauth_consumer_key=4&device_token=cba52b86ed6a52b1665306ee6ee937c68394f6a56c9f33b6d81bdaa709f9f7a3&ver=2&oauth_signature_method=HMAC-SHA1&debug=0&x_auth_mode=client_auth&app_ver=2.1&oauth_token=0_9837387abc30183c39&channel_id=AppStore&start=0&open_udid=9ef0feba0318c583a7ce8b4fb8b05019f9093602&device_type=ios&idfa=9DDCE5FE-2527-4A39-96F1-873A6A9491F6"

/** 首页-米其林*/
#define KHomeMichelinUrl @"http://www.youyuwei.com/api/label?ywsdk_ver=20131018&app_code=com.youyuwei.yuwei.ios&oauth_version=1.0&oauth_timestamp=1446438420&oauth_nonce=76666756c3b968b3b3cc10479b2c66a7&oauth_signature=o1k1GiN5fooRTLsbijParV0Ej1k%3D&sys_ver=8.1.2&type=1&hardware_model=iPhone7%2C2&device_token=cba52b86ed6a52b1665306ee6ee937c68394f6a56c9f33b6d81bdaa709f9f7a3&oauth_consumer_key=4&ver=2&oauth_signature_method=HMAC-SHA1&debug=0&app_ver=2.1&x_auth_mode=client_auth&oauth_token=0_9837387abc30183c39&channel_id=App%20Store&start=0&open_udid=9ef0feba0318c583a7ce8b4fb8b05019f9093602&device_type=ios&idfa=9DDCE5FE-2527-4A39-96F1-873A6A9491F6"

/** 首页-全球中餐 */
#define KHomeChineseFoodUrl @"http://www.youyuwei.com/api/label?ywsdk_ver=20131018&app_code=com.youyuwei.yuwei.ios&oauth_version=1.0&oauth_timestamp=1446440843&oauth_nonce=13c6d4455ce80aea5a0196974a069e73&oauth_signature=0g2lgugtVg%2B53mIWQApAW0j8Lw4%3D&sys_ver=8.1.2&type=2&hardware_model=iPhone7%2C2&device_token=cba52b86ed6a52b1665306ee6ee937c68394f6a56c9f33b6d81bdaa709f9f7a3&oauth_consumer_key=4&ver=2&oauth_signature_method=HMAC-SHA1&debug=0&app_ver=2.1&x_auth_mode=client_auth&oauth_token=0_9837387abc30183c39&channel_id=App%20Store&start=0&open_udid=9ef0feba0318c583a7ce8b4fb8b05019f9093602&device_type=ios&idfa=9DDCE5FE-2527-4A39-96F1-873A6A9491F6"

/** 首页-咖啡馆*/
#define KHomeCafeUrl @"http://www.youyuwei.com/api/label?ywsdk_ver=20131018&app_code=com.youyuwei.yuwei.ios&oauth_version=1.0&oauth_timestamp=1446440947&oauth_nonce=a70ceed23e2307684a9959ce4f9a46ff&oauth_signature=HyNcpylYfH3cPBLbpnBsUYQb%2B%2F8%3D&sys_ver=8.1.2&type=3&hardware_model=iPhone7%2C2&device_token=cba52b86ed6a52b1665306ee6ee937c68394f6a56c9f33b6d81bdaa709f9f7a3&oauth_consumer_key=4&ver=2&oauth_signature_method=HMAC-SHA1&debug=0&app_ver=2.1&x_auth_mode=client_auth&oauth_token=0_9837387abc30183c39&channel_id=App%20Store&start=0&open_udid=9ef0feba0318c583a7ce8b4fb8b05019f9093602&device_type=ios&idfa=9DDCE5FE-2527-4A39-96F1-873A6A9491F6"

/** 就餐礼仪*/
#define KHomeTableMannersUrl @"http://www.youyuwei.com/api/country?ywsdk_ver=20131018&app_code=com.youyuwei.yuwei.ios&oauth_timestamp=1446559686&oauth_version=1.0&oauth_nonce=b8cdc4b91890b7f17a21ebce440c54d8&oauth_signature=wQZ5Ek4a49HFIaAUON8sFd4rM24%3D&sys_ver=8.1.2&hardware_model=iPhone7%2C2&oauth_consumer_key=4&device_token=cba52b86ed6a52b1665306ee6ee937c68394f6a56c9f33b6d81bdaa709f9f7a3&ver=2&uid=16164&list=Eatrite&oauth_signature_method=HMAC-SHA1&debug=0&app_ver=2.1&x_auth_mode=client_auth&oauth_token=16164_093ec21c82c37fe5349053ae8079fd79&channel_id=App%20Store&start=0&open_udid=9ef0feba0318c583a7ce8b4fb8b05019f9093602&device_type=ios&idfa=9DDCE5FE-2527-4A39-96F1-873A6A9491F6"
/** 热门城市*/
#define KHotCityUrl @"http://www.youyuwei.com/api/country?ywsdk_ver=20131018&app_code=com.youyuwei.yuwei.ios&oauth_timestamp=%f&oauth_version=1.0&oauth_nonce=b094fa72c419039d0779947841c3f468&oauth_signature=jMjOgHDafkxOFgt0rUY6nWzfdVU3D&sys_ver=8.1.2&name=%@&hardware_model=iPhone72C2&oauth_consumer_key=4&device_token=cba52b86ed6a52b1665306ee6ee937c68394f6a56c9f33b6d81bdaa709f9f7a3&ver=2&list=city&oauth_signature_method=HMAC-SHA1&debug=0&app_ver=2.1&x_auth_mode=client_auth&oauth_token=0_9837387abc30183c39&channel_id=AppStore&start=0&open_udid=9ef0feba0318c583a7ce8b4fb8b05019f9093602&device_type=ios&idfa=9DDCE5FE-2527-4A39-96F1-873A6A9491F6"
/** 热门城市详情*/
#define KHotCityDetailUrl @"http://www.youyuwei.com/api/rest?ywsdk_ver=20131018&app_code=com.youyuwei.yuwei.ios&oauth_timestamp=%f&oauth_version=1.0&oauth_nonce=7c1a9cc549f2509f518b69f6d844a537&oauth_signature=TGoDlkfEHdh0WE1LXwry2U2ByUTs3D&sys_ver=8.1.2&hardware_model=iPhone72C2&oauth_consumer_key=4&device_token=cba52b86ed6a52b1665306ee6ee937c68394f6a56c9f33b6d81bdaa709f9f7a3&ver=2&cityid=%@&list=listofCity&oauth_signature_method=HMAC-SHA1&debug=0&app_ver=2.1&x_auth_mode=client_auth&oauth_token=0_9837387abc30183c39&channel_id=AppStore&start=0&open_udid=9ef0feba0318c583a7ce8b4fb8b05019f9093602&device_type=ios&idfa=9DDCE5FE-2527-4A39-96F1-873A6A9491F6"
/** 食物详情 */
#define KFoodDetailUrl @"http://www.youyuwei.com/api/mustdish/%@?ywsdk_ver=20131018&app_code=com.youyuwei.yuwei.ios&oauth_timestamp=%f&oauth_version=1.0&oauth_nonce=c40a92870a8118a8f8b1a6e8fd59d35f&oauth_signature=d0uLenaB5B5BbvEUW283PJvtWuI3D&sys_ver=8.1.2&hardware_model=iPhone72C2&oauth_consumer_key=4&device_token=cba52b86ed6a52b1665306ee6ee937c68394f6a56c9f33b6d81bdaa709f9f7a3&ver=2&oauth_signature_method=HMAC-SHA1&debug=0&x_auth_mode=client_auth&app_ver=2.1&oauth_token=0_9837387abc30183c39&channel_id=AppStore&start=0&open_udid=9ef0feba0318c583a7ce8b4fb8b05019f9093602&device_type=ios&idfa=9DDCE5FE-2527-4A39-96F1-873A6A9491F6"

/** 酒店详情*/
#define KHotelDetailUrl @"http://www.youyuwei.com/api/dish?ywsdk_ver=20131018&app_code=com.youyuwei.yuwei.ios&oauth_timestamp=%f&oauth_version=1.0&oauth_nonce=42dd01690d86052db09b95b2cd98c10c&restid=%@&oauth_signature=dzKeRQb2ZNdmvo9Lb2FxXVGQXodg3D&sys_ver=8.1.2&hardware_model=iPhone72C2&device_token=cba52b86ed6a52b1665306ee6ee937c68394f6a56c9f33b6d81bdaa709f9f7a3&oauth_consumer_key=4&ver=2&list=listofRest&oauth_signature_method=HMAC-SHA1&debug=0&app_ver=2.1&x_auth_mode=client_auth&oauth_token=0_9837387abc30183c39&channel_id=AppStore&start=0&open_udid=9ef0feba0318c583a7ce8b4fb8b05019f9093602&device_type=ios&idfa=9DDCE5FE-2527-4A39-96F1-873A6A9491F6"

/** 国家*/
#define KCountryDetailUrl @"http://www.youyuwei.com/api/label?ywsdk_ver=20131018&app_code=com.youyuwei.yuwei.ios&oauth_timestamp=%f&oauth_version=1.0&oauth_nonce=1e03ac469607cc4ce4804e968d67f282&oauth_signature=3tyz8eZGVZEeGPs9Y20YlnJVR6I3D&sys_ver=8.1.2&type=%@&hardware_model=iPhone72C2&device_token=cba52b86ed6a52b1665306ee6ee937c68394f6a56c9f33b6d81bdaa709f9f7a3&id=%@&oauth_consumer_key=4&ver=2&list=list&oauth_signature_method=HMAC-SHA1&debug=0&app_ver=2.1&x_auth_mode=client_auth&oauth_token=0_9837387abc30183c39&channel_id=AppStore&start=0&open_udid=9ef0feba0318c583a7ce8b4fb8b05019f9093602&device_type=ios&idfa=9DDCE5FE-2527-4A39-96F1-873A6A9491F6"

/** 食物详情2*/
#define KSubFoodDetailUrl @"http://www.youyuwei.com/api/dish/%@?ywsdk_ver=20131018&app_code=com.youyuwei.yuwei.ios&oauth_timestamp=%f&oauth_version=1.0&oauth_nonce=c26ade8390588336e0c0357d21f0adab&oauth_signature=ZNJxD5XJDRSBI3Qw2FK1jM7HQC2Y3D&sys_ver=8.1.2&hardware_model=iPhone72C2&oauth_consumer_key=4&device_token=cba52b86ed6a52b1665306ee6ee937c68394f6a56c9f33b6d81bdaa709f9f7a3&ver=2&oauth_signature_method=HMAC-SHA1&debug=0&x_auth_mode=client_auth&app_ver=2.1&oauth_token=0_9837387abc30183c39&channel_id=AppStore&open_udid=9ef0feba0318c583a7ce8b4fb8b05019f9093602&device_type=ios&idfa=9DDCE5FE-2527-4A39-96F1-873A6A9491F6"
/** 食记详情*/
#define KFoodRecordUrl @"http://www.youyuwei.com/api/note?ywsdk_ver=20131018&app_code=com.youyuwei.yuwei.ios&oauth_timestamp=%f&oauth_version=1.0&oauth_nonce=3e9af02da053b824992b2e307b897012&oauth_signature=94P6pUWYcNW13E4cm7K5ALHpQ9g3D&sys_ver=8.1.2&hardware_model=iPhone72C2&oauth_consumer_key=4&id=%@&device_token=cba52b86ed6a52b1665306ee6ee937c68394f6a56c9f33b6d81bdaa709f9f7a3&ver=2&oauth_signature_method=HMAC-SHA1&debug=0&app_ver=2.1&x_auth_mode=client_auth&oauth_token=0_9837387abc30183c39&channel_id=AppStore&start=0&open_udid=9ef0feba0318c583a7ce8b4fb8b05019f9093602&device_type=ios&idfa=9DDCE5FE-2527-4A39-96F1-873A6A9491F6"
#endif
