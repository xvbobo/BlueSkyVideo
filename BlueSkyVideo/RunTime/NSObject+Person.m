//
//  NSObject+Person.m
//  BlueSkyVideo
//
//  Created by 许菠菠 on 2018/3/28.
//  Copyright © 2018年 许菠菠. All rights reserved.
//

#import "NSObject+Person.h"
#import <objc/runtime.h>
@implementation NSObject (Person)
- (void)setName:(NSString *)name{
    objc_setAssociatedObject(self, @"name", name, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSString *)name{
    return objc_getAssociatedObject(self, @"name");
}

- (void)setAge:(NSString*)age{
    objc_setAssociatedObject(self, @"age", age, OBJC_ASSOCIATION_RETAIN_NONATOMIC);

}

- (NSString*)age{
    return objc_getAssociatedObject(self, @"age");

}
@end
