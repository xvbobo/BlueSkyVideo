//
//  VideoDownLoad.h
//  BlueSkyVideo
//
//  Created by 许菠菠 on 2017/11/17.
//  Copyright © 2017年 许菠菠. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VideoDownLoad : NSObject
+ (instancetype)shareInstance;
- (void)downLoadVideo:(NSString *)videoUrlString;
@end
