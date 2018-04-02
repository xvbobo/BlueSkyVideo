//
//  NSObject+Person.h
//  BlueSkyVideo
//
//  Created by 许菠菠 on 2018/3/28.
//  Copyright © 2018年 许菠菠. All rights reserved.
//

/**
分类本身不能添加属性，但是我们通过runtime可以动态添加属性
 **/

#import <Foundation/Foundation.h>

@interface NSObject (Person)
@property NSString * name;
@property NSString * age;
@end
