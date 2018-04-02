//
//  KVCViewController.m
//  BlueSkyVideo
//
//  Created by 许菠菠 on 2018/3/23.
//  Copyright © 2018年 许菠菠. All rights reserved.
//

#import "KVCViewController.h"
#import "SortMethodViewController.h"
#import "PersonModel.h"
@interface KVCViewController ()
@property (nonatomic,strong)PersonModel * model;
@end

@implementation KVCViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self testKVC];
    [self testKVO];
    
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:@"KVOBtn" forState:UIControlStateNormal];
    btn.frame = CGRectMake(10, 74, 80, 20);
    btn.backgroundColor = [UIColor redColor];
    [btn addTarget:self action:@selector(actionBtn) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

#pragma mark -- testKVC
/***
1.KVC介绍
    KVC 就是键值编码（key-value-coding)。
2.KVC 的主要作用：
  (1）通过键值路径为对象的属性赋值。主要是可以为私有的属性赋值。
 （2）通过键值路径获取属性的值。主要是可以通过key获得私有属性的值。
  (3)将字典转型成Model，方法：setValuesForKeysWithDictionary:
 **/
- (void)testKVC {
    SortMethodViewController * sort = [[SortMethodViewController alloc] init];
    NSLog(@"%@",[sort valueForKey:@"name"]);
    [sort setValue:@"xvbobo" forKey:@"name"];//为属性赋值
    NSLog(@"%@",[sort valueForKey:@"name"]);//以属性为KEY获取属性的值
    
    _model = [[PersonModel alloc] init];
    NSDictionary * dict = @{@"name":@"xvbobo",@"age":@20};
    [_model setValuesForKeysWithDictionary:dict];//字典转模型
    NSLog(@"我叫%@，今年%ld岁",_model.name,_model.age);

}

#pragma mark --testKVO
/**
 1.KVO介绍：
 
 KVO 是键值观察者（key-value-observing）。KVO提供了一种观察者的机制，通过对某个对象的某个属性添加观察者，当该属性改变，就会调用"observeValueForKeyPath:"方法，为我们提供一个“对象值改变了！”的时机进行一些操作。
 
 2.KVO原理
 
 　　当某个类的对象第一次被观察时，系统在运行时会创建该类的派生类，在派生类中重写了该对象的setter方法，并且在setter方法中实现了通知的机制。派生类重写了class方法，以“欺骗”外部调用者他就是原先那个类。系统将这个类的isa指针指向新的派生类，因此改对象也就是新的派生类的对象了。因而改对象调用setter就会调用重写的setter，从而激活键值通知机制。此外派生类还重写了delloc方法来释放资源。
 **/

- (void)testKVO{
    [_model addObserver:self forKeyPath:@"name" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:NULL];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    NSLog(@"新的值 = %@",change[@"new"]);
    NSLog(@"旧的值 = %@",change[@"old"]);

}

- (void)actionBtn {
    _model.name = @"张玲玲";

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    [_model removeObserver:self forKeyPath:@"name"];
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
