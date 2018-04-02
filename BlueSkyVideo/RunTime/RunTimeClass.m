//
//  RunTimeClass.m
//  BlueSkyVideo
//
//  Created by 许菠菠 on 2018/3/27.
//  Copyright © 2018年 许菠菠. All rights reserved.
//

#import "RunTimeClass.h"

@implementation RunTimeClass
- (instancetype)init{
    if (self = [super init]) {
        [self showUserName];
    }
    return self;
}

- (void)showUserName{
    NSLog(@"许菠菠");
}
@end
