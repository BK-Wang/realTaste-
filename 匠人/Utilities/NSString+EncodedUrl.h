//
//  NSString+EncodedUrl.h
//  匠人
//
//  Created by BK on 15/11/2.
//  Copyright © 2015年 bk. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (EncodedUrl)
- (NSString *)encodeToPercentEscapeString:(NSString *)input;
- (NSString *)decodeFromPercentEscapeString:(NSString *)input;
@end
