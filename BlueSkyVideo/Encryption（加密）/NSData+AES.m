//
//  NSData+AES.m
//  BlueSkyVideo
//
//  Created by 许菠菠 on 2018/3/24.
//  Copyright © 2018年 许菠菠. All rights reserved.
//

#import "NSData+AES.h"
#import <CommonCrypto/CommonCrypto.h>

@implementation NSData (AES)
- (NSData *)AES256Encryption:(NSString *)key{
    char keyPtr[kCCKeySizeAES256 + 1];
    bzero(keyPtr, sizeof(keyPtr));
    [key getCString:keyPtr maxLength:sizeof(keyPtr) encoding:NSUTF8StringEncoding];
    NSUInteger dataLength = [self length];
    size_t bufferSize = dataLength + kCCBlockSizeAES128;
    void * buffer = malloc(bufferSize);
    size_t numberBytesEncrypted = 0;
    CCCryptorStatus cryptorStatus = CCCrypt(kCCEncrypt, kCCAlgorithmAES128, kCCOptionPKCS7Padding|kCCOptionECBMode, keyPtr, kCCBlockSizeAES128, NULL, [self bytes], dataLength, buffer, bufferSize, &numberBytesEncrypted);
    if (cryptorStatus == kCCSuccess) {
        return  [NSData dataWithBytesNoCopy:buffer length:numberBytesEncrypted];
    }
    free(buffer);
    return nil;
    
}

-(NSData *)AES256Decryption:(NSString *)key{
    char keyPtr[kCCKeySizeAES256 + 1];
    bzero(keyPtr, sizeof(keyPtr));
    [key getCString:keyPtr maxLength:sizeof(keyPtr) encoding:NSUTF8StringEncoding];
    NSUInteger dataLength = [self length];
    size_t bufferSize = dataLength + kCCBlockSizeAES128;
    void * buffer = malloc(bufferSize);
    size_t numBytesDecrypted = 0;
    CCCryptorStatus cryptorStatus = CCCrypt(kCCDecrypt, kCCAlgorithmAES128, kCCOptionPKCS7Padding|kCCOptionECBMode, keyPtr, kCCBlockSizeAES128, NULL, [self bytes], dataLength, buffer, bufferSize, &numBytesDecrypted);
    if (cryptorStatus == kCCSuccess) {
        return  [NSData dataWithBytesNoCopy:buffer length:numBytesDecrypted];
    }
    free(buffer);
    return nil;
}
@end
