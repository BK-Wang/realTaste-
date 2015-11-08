//
//  NSString+EncodedUrl.m
//  匠人
//
//  Created by BK on 15/11/2.
//  Copyright © 2015年 bk. All rights reserved.
//

#import "NSString+EncodedUrl.h"

@implementation NSString (EncodedUrl)
/** 中文转URL码*/
- (NSString *)encodeToPercentEscapeString:(NSString *)input
{
    NSString *outputStr = (__bridge NSString *)CFURLCreateStringByAddingPercentEscapes( NULL,(__bridge CFStringRef)input,NULL, (CFStringRef)@"!*'();:@&=+$,/?%#[]", kCFStringEncodingUTF8);
    return outputStr;
}

// 解码
- (NSString *)decodeFromPercentEscapeString:(NSString *)input
{
    NSMutableString *outputStr = [NSMutableString stringWithString:input];
    [outputStr replaceOccurrencesOfString:@"+" withString:@" " options:NSLiteralSearch range:NSMakeRange(0,[outputStr length])];
    return [outputStr stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
}

@end
