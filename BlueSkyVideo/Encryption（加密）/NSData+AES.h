//
//  NSData+AES.h
//  BlueSkyVideo
//
//  Created by 许菠菠 on 2018/3/24.
//  Copyright © 2018年 许菠菠. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData (AES)
- (NSData *)AES256Encryption:(NSString *)key;//加密
- (NSData *)AES256Decryption:(NSString *)key;//解密
@end
