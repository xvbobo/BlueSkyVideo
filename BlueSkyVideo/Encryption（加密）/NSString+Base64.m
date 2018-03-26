//
//  NSString+Base64.m
//  BlueSkyVideo
//
//  Created by 许菠菠 on 2018/3/24.
//  Copyright © 2018年 许菠菠. All rights reserved.
//

#import "NSString+Base64.h"

@implementation NSString (Base64)
#pragma mark -- 加密
- (NSString*)Base64Encryption:(NSString *)key{
    NSData * data = [key dataUsingEncoding:NSUTF8StringEncoding];
    return [data base64EncodedStringWithOptions:0];
}
#pragma mark -- 解密
- (NSString *)Base64Decryption:(NSString *)key{
    NSData * data = [[NSData alloc] initWithBase64EncodedString:key options:0];
    return [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
}


@end
