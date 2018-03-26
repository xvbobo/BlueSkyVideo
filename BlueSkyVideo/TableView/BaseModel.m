//
//  BaseModel.m
//  BlueSkyVideo
//
//  Created by 许菠菠 on 2018/2/27.
//  Copyright © 2018年 许菠菠. All rights reserved.
//

#import "BaseModel.h"
#import <objc/runtime.h>
@implementation BaseModel
+ (instancetype)modelWithDict:(NSDictionary *)dict {
    id objc = [[self alloc] init];
    unsigned int count = 0;
    Ivar * ivarList = class_copyIvarList(self, &count);
    for (int i = 0; i < count; i ++) {
        Ivar  var1 = ivarList[i];
        NSString * propertyName = [NSString stringWithUTF8String:ivar_getName(var1)];
//        NSString * propertyType = [NSString stringWithUTF8String:ivar_getTypeEncoding(var1)];
        NSString * key = [propertyName substringFromIndex:1];
        id value = dict[key];
        if (value) {
            [objc setValue:value forKey:key];
        }
        
    }
    return objc;
}
@end
