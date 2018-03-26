//
//  XVEncryption.m
//  BlueSkyVideo
//
//  Created by 许菠菠 on 2018/3/24.
//  Copyright © 2018年 许菠菠. All rights reserved.
//

#import "XVEncryption.h"
#import "NSData+AES.h"
#import "NSString+Base64.h"
#import "NSString+MD5.h"
#define APP_PASSWORDKEY @"0363b3e377d42bd919fbd28084ca9c67"
@implementation XVEncryption
#pragma mark -- AES加密，解密
+ (NSData*)AESEncryption:(NSString *)string{
    NSData * data  = [string dataUsingEncoding:NSUTF8StringEncoding];
    //使用密码对data进行加密
    NSData * encryptionData = [data AES256Encryption:APP_PASSWORDKEY];
    return encryptionData;
}

+ (NSString *)AESDecryption:(NSData *)data{
//    NSData * data  = [string dataUsingEncoding:NSUTF8StringEncoding];
    //使用密码对data进行加密
    NSData * decryptionData = [data AES256Decryption:APP_PASSWORDKEY];
    NSString * decryptionStirng = [[NSString alloc] initWithData:decryptionData encoding:NSUTF8StringEncoding];
    return decryptionStirng;
}

#pragma mark -- Base64加密解密
+ (NSString *)BaseEncryption:(NSString *)string{
    
    return [string Base64Encryption:string];
}
+ (NSString *)BaseDecryption:(NSString *)dataString{
    return [dataString Base64Decryption:dataString];
}

#pragma mark -- MD5加密
+ (NSString *)MD5Encryption:(NSString *)string{
    return [string md5String];
}
@end
