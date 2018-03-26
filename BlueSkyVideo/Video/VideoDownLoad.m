//
//  VideoDownLoad.m
//  BlueSkyVideo
//
//  Created by 许菠菠 on 2017/11/17.
//  Copyright © 2017年 许菠菠. All rights reserved.
//

#import "VideoDownLoad.h"
#import <AFNetworking.h>
#import <AVFoundation/AVFoundation.h>
@implementation VideoDownLoad
//    http://flv2.bn.netease.com/tvmrepo/2017/3/M/1/ECEIM9AM1/SD/ECEIM9AM1-mobile.mp4
static VideoDownLoad * _videoDown = nil;
+ (instancetype)shareInstance {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _videoDown = [[super allocWithZone:NULL]init];
    });
    return _videoDown;
}

+ (id)allocWithZone:(struct _NSZone *)zone {
    return [VideoDownLoad shareInstance];
}

- (void)downLoadVideo:(NSString *)videoUrlString {
    AFURLSessionManager * manager = [[AFURLSessionManager alloc] init];
    NSURLRequest * request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://flv2.bn.netease.com/tvmrepo/2017/3/M/1/ECEIM9AM1/SD/ECEIM9AM1-mobile.mp4"]];
    NSURLSessionDownloadTask * task = [manager downloadTaskWithRequest:request progress:^(NSProgress * _Nonnull downloadProgress) {
        //        NSLog(@"文件总大小 = %lld",downLoad.totalUnitCount);
        //        NSLog(@"下载完成进度 = %lld",downLoad.completedUnitCount);

        NSLog(@"下载完成进度 = %f",downloadProgress.fractionCompleted);
    } destination:^NSURL * _Nonnull(NSURL * _Nonnull targetPath, NSURLResponse * _Nonnull response) {
        NSURL *documentsDirectoryURL = [[NSFileManager defaultManager] URLForDirectory:NSDocumentDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:NO error:nil];
        return [documentsDirectoryURL URLByAppendingPathComponent:[response suggestedFilename]];
    } completionHandler:^(NSURLResponse * _Nonnull response, NSURL * _Nullable filePath, NSError * _Nullable error) {
        NSLog(@"File downloaded to: %@", filePath);
    }];
    [task resume];
    
}
@end
