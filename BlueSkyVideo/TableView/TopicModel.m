//
//  TopicModel.m
//  BlueSkyVideo
//
//  Created by 许菠菠 on 2018/2/27.
//  Copyright © 2018年 许菠菠. All rights reserved.
//

#import "TopicModel.h"
#import "userModel.h"
@implementation TopicModel
- (void)setUser:(NSDictionary *)user {
    _model = [userModel modelWithDict:user];
}
@end
