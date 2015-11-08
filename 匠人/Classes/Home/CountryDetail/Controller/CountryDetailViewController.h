//
//  CountryDetailViewController.h
//  匠人
//
//  Created by BK on 15/11/3.
//  Copyright © 2015年 bk. All rights reserved.
//

#import "ListViewController.h"

@interface CountryDetailViewController : ListViewController
@property (nonatomic,copy) NSString *countryId;
@property (nonatomic,copy) NSString *countryName;
@property (nonatomic,copy) NSString *type;
@end
