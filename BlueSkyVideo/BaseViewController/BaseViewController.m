//
//  BaseViewController.m
//  BlueSkyVideo
//
//  Created by 许菠菠 on 2018/2/27.
//  Copyright © 2018年 许菠菠. All rights reserved.
//
//__weak 本身是可以避免循环引用的问题的，但是其会导致外部对象释放了之后，block 内部也访问不到这个对象的问题，我们可以通过在 block 内部声明一个 __strong 的变量来指向 weakObj，使外部对象既能在 block 内部保持住，又能避免循环引用的问题。
//
//
//
//__block 本身无法避免循环引用的问题，但是我们可以通过在 block 内部手动把 blockObj 赋值为 nil 的方式来避免循环引用的问题。另外一点就是 __block 修饰的变量在 block 内外都是唯一的，要注意这个特性可能带来的隐患。
//
//但是__block有一点：这只是限制在ARC环境下。在非arc下，__block是可以避免引用循环的
#import "BaseViewController.h"


@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIBarButtonItem *backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(backBarButtonItemAction)];
    backBarButtonItem.tintColor = [UIColor whiteColor];
    self.navigationItem.backBarButtonItem = backBarButtonItem;
//    NSMutableArray * array = [NSMutableArray arrayWithObjects:@"1",@"2", nil];
//    NSArray * array1 = array;
//    NSArray * array2 = [array copy];
//    NSMutableArray * array3 = [array mutableCopy];
//    [array addObject:@"3"];
//    [array3 addObject:@"4"];
    self.view.backgroundColor = [UIColor whiteColor];
    
   
//    NSLog(@"array = %@*******array1 = %@\narray2 = %@\narray3 = %@",array,array1,array2,array3);
   
}

- (NSInteger)steps:(NSInteger)number{
    if (number == 1) {
        return 1;
    }else if (number == 2){
        return 2;
    }else if (number == 3){
        return 4;
    }else{
        return [self steps:number -1] + [self steps:number -2] + [self steps:number -3];
    }
}
- (void)backBarButtonItemAction {
    [self.navigationController popViewControllerAnimated:YES];
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
