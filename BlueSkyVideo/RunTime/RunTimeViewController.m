//
//  RunTimeViewController.m
//  BlueSkyVideo
//
//  Created by 许菠菠 on 2018/3/27.
//  Copyright © 2018年 许菠菠. All rights reserved.
//

#import "RunTimeViewController.h"
#import "RunTimeClass.h"
#import "NSObject+Person.h"
#import <objc/runtime.h>
@interface RunTimeViewController ()

@end

@implementation RunTimeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    RunTimeClass * classA = [[RunTimeClass alloc] init];
    unsigned int outCount = 0;
    Method * methods =  class_copyMethodList([classA class], &outCount);
    for (int i = 0; i < outCount; i ++) {
        Method method = methods[i];
        SEL methodSEL = method_getName(method);
        const char * selName = sel_getName(methodSEL);
        if (methodSEL) {
            NSLog(@"sel---%s",selName);
        }
    }
    
    NSObject * object = [[NSObject alloc] init];
    object.name = @"xvbobo";
    object.age = @"26";
    NSLog(@"姓名：%@，年龄：%@",object.name,object.age);
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
