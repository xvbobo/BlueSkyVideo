//
//  XVEncryption.h
//  BlueSkyVideo
//
//  Created by 许菠菠 on 2018/3/24.
//  Copyright © 2018年 许菠菠. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XVEncryption : NSObject
#pragma mark -- AES加密,解密
+ (NSData *)AESEncryption:(NSString *)string;
+ (NSString *)AESDecryption:(NSData *)data;
#pragma mark -- Base64加密,解密
+ (NSString *)BaseEncryption:(NSString *)string;
+ (NSString *)BaseDecryption:(NSString *)dataString;
#pragma mark -- MD5加密
+ (NSString *)MD5Encryption:(NSString *)string;
@end
