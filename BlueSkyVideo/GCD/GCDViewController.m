//
//  GCDViewController.m
//  BlueSkyVideo
//
//  Created by 许菠菠 on 2018/3/14.
//  Copyright © 2018年 许菠菠. All rights reserved.
//


//创建多线程有三种方式1：NSThread 2:NSOperation 3:GCD
#import "GCDViewController.h"

@interface GCDViewController ()
@property (nonatomic,strong) NSLock *lock;
@end

@implementation GCDViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self createNSThread];
//    [self testNSOPeration];
    [self testGCD];
    // Do any additional setup after loading the view.
}

#pragma mark -- NSThread
- (void)createNSThread {
//    _lock = [[NSLock alloc] init];
    NSThread * thread1 = [[NSThread alloc] initWithTarget:self selector:@selector(runtest) object:nil];
    thread1.name = @"thread1";
    [thread1 start];
    NSThread * thread2 = [[NSThread alloc] initWithTarget:self selector:@selector(runtest) object:nil];
    thread2.name = @"thread2";
    [thread2 start];
}
- (void)runtest{
    NSLog(@"threadName= %@",[NSThread currentThread].name);
}
#pragma mark -- NSOperation
- (void)testNSOPeration{
#pragma mark -- NSBlockOperation
//    NSBlockOperation * operation1 = [NSBlockOperation blockOperationWithBlock:^{
//         NSLog(@"第一个 = %@",[NSThread currentThread]);
//    }] ;
//    NSBlockOperation * operation2 = [NSBlockOperation blockOperationWithBlock:^{
//        NSLog(@"第二个 = %@",[NSThread currentThread]);
//    }] ;
//
//    NSBlockOperation * operation3 = [NSBlockOperation blockOperationWithBlock:^{
//        NSLog(@"第三个 = %@",[NSThread currentThread]);
//    }] ;
#pragma mark -- NSInvocationOperation
    NSInvocationOperation * operation1 = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(run2) object:nil];
    NSInvocationOperation * operation2 = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(run2) object:nil];
    NSInvocationOperation * operation3 = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(run2) object:nil];

#pragma mark -- opreation可以设置线程的优先级来决定执行顺序
    [operation1 setQueuePriority:NSOperationQueuePriorityNormal];
    [operation2 setQueuePriority:NSOperationQueuePriorityHigh];
    [operation3 setQueuePriority:NSOperationQueuePriorityVeryHigh];
#pragma mark -- 打印结果，顺序打印，没有添加依赖关系
//    2018-03-15 15:53:02.843493+0800 BlueSkyVideo[6416:155122] 第一个 = <NSThread: 0x60400046e080>{number = 3, name = (null)}
//    2018-03-15 15:53:02.843629+0800 BlueSkyVideo[6416:155125] 第二个 = <NSThread: 0x60400046e100>{number = 4, name = (null)}
#pragma mark -- 打印结果，添加依赖关系
//    [operation1 addDependency:operation2];
//    线程operation1依赖于线程operation2，说明只有等operation2完成任务才能执行operation1的任务
//    2018-03-15 15:55:12.741192+0800 BlueSkyVideo[6448:156918] 第二个 = <NSThread: 0x600000274000>{number = 3, name = (null)}
//    2018-03-15 15:55:12.745799+0800 BlueSkyVideo[6448:156921] 第一个 = <NSThread: 0x60400046be00>{number = 4, name = (null)}

    NSOperationQueue * queue = [[NSOperationQueue alloc] init];
#pragma mark -- BOOL值决定，当前queue是否在主线程上执行
    [queue addOperations:@[operation1,operation2,operation3] waitUntilFinished:NO];
    NSLog(@"xvbobo");

}

- (void)run2{
    NSLog(@"%@",[NSThread currentThread]);

}

#pragma mark -- GCD使用方法
- (void)testGCD{
    dispatch_queue_t concurrentQueue = dispatch_queue_create("BluSkyVideo.concurrentQueue", DISPATCH_QUEUE_CONCURRENT);//并发
    dispatch_queue_t serialQueue = dispatch_queue_create("BluSkyVideo.serialQueue", DISPATCH_QUEUE_SERIAL);//串行
#pragma 异步并发
    dispatch_async(concurrentQueue, ^{
        NSLog(@"异步并发concurrentQueue");
    });
    dispatch_async(concurrentQueue, ^{
        NSLog(@"异步并发concurrentQueue2");
    });
#pragma 异步串行
    dispatch_async(serialQueue, ^{
        NSLog(@"异步串行serialQueue");
    });
    dispatch_async(serialQueue, ^{
        NSLog(@"异步串行serialQueue2");
    });
#pragma 同步串行
    dispatch_sync(serialQueue, ^{
        NSLog(@"同步串行serialQueue");
    });
    dispatch_sync(serialQueue, ^{
        NSLog(@"同步串行serialQueue2");
    });
#pragma 同步并发
    dispatch_sync(concurrentQueue, ^{
        NSLog(@"同步并发concurrentQueue");
    });
    dispatch_sync(concurrentQueue, ^{
        NSLog(@"同步并发concurrentQueue2");
    });
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
