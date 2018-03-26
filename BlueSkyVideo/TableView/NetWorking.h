//
//  NetWorking.h
//  BlueSkyVideo
//
//  Created by 许菠菠 on 2018/2/27.
//  Copyright © 2018年 许菠菠. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NetWorking : NSObject
@property (nonatomic,copy) void (^topicDataBlock)(NSMutableArray * array);
+ (instancetype)shareInstance;
- (void)getData:(NSString *)urlString;
@end
