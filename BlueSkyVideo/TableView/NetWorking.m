//
//  NetWorking.m
//  BlueSkyVideo
//
//  Created by 许菠菠 on 2018/2/27.
//  Copyright © 2018年 许菠菠. All rights reserved.
//

#import "NetWorking.h"
#import <AFNetworking.h>
#import "TopicModel.h"
@implementation NetWorking
static NetWorking * _instance;
+ (instancetype)shareInstance {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[self alloc] init];
    });
    return _instance;
}
//-(id)requestParameter{
//    NSMutableDictionary *param = [NSMutableDictionary dictionary];
//    if(_method.length){
//        [param setObject:_method forKey:@"method"];
//    }
//    if(_timestamp.length){
//        [param setObject:_timestamp forKey:@"timestamp"];
//    }
//    return param;
//}
- (void)getData:(NSString *)urlString {
    AFHTTPSessionManager * manger = [AFHTTPSessionManager manager];
    [manger GET:urlString parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary * dict = (NSDictionary *)responseObject;
        NSDictionary * dataDict = dict[@"data"];
        NSArray * topicsData = dataDict[@"topics"][@"data"];
        NSMutableArray * mutableArray = [NSMutableArray new];
        for (NSDictionary * detaillDict in topicsData) {
            TopicModel * model = [TopicModel modelWithDict:detaillDict];
            [mutableArray addObject:model];
        }
        if (self.topicDataBlock) {
            self.topicDataBlock(mutableArray);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
}
@end
