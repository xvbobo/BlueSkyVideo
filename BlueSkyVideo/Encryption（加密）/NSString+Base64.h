//
//  NSString+Base64.h
//  BlueSkyVideo
//
//  Created by 许菠菠 on 2018/3/24.
//  Copyright © 2018年 许菠菠. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Base64)
- (NSString *)Base64Encryption:(NSString *)key;//加密
- (NSString *)Base64Decryption:(NSString *)key;//解密
@end
