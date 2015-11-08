//
//  SkinViewController.h
//  匠人
//
//  Created by BK on 15/11/4.
//  Copyright © 2015年 bk. All rights reserved.
//

#import "ListViewController.h"

typedef void(^SkinBlock)(NSString *img);

@interface SkinViewController : ListViewController
@property (nonatomic,copy) SkinBlock block;
@end
