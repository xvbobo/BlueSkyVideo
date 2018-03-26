//
//  SortMethodViewController.m
//  BlueSkyVideo
//
//  Created by 许菠菠 on 2018/3/21.
//  Copyright © 2018年 许菠菠. All rights reserved.
//

#import "SortMethodViewController.h"

@interface SortMethodViewController ()
@property (nonatomic,strong) NSMutableArray * dataArray;
@property (nonatomic,copy) NSString * name;
@end

@implementation SortMethodViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _name = @"zhanglingling";
    
    _dataArray = [NSMutableArray arrayWithObjects:@5,@9,@8,@1,@7,@6,@2,@3,@4, nil];
//        [self createMethod];//插入排序
//    [self createMethod1];//选择排序
//    [self createMethod2];//冒泡排序
//    [self createMethod3];//快速排序
//    [self createMethod4];//合并排序

    // Do any additional setup after loading the view.
}


#pragma mark -- 插入排序
//将一个记录插入到已排序好的有序表中，从而得到一个新，记录数增1的有序表。即：先将序列的第1个记录看成是一个有序的子序列，然后从第2个记录逐个进行插入，直至整个序列有序为止。
//要点：设立哨兵，作为临时存储和判断数组边界之用。
- (void)createMethod{
    for (int i = 1; i < _dataArray.count; i ++) {
        if (_dataArray[i] < _dataArray[i-1]) {
            int j = i - 1;
            int x = [_dataArray[i] intValue];//复制为哨兵，即存储待排序元素
            _dataArray[i] = _dataArray[i-1]; //先后移一个元素
            while (x < [_dataArray[j] intValue]) {//查找在有序表的插入位置
                _dataArray[j + 1] = _dataArray[j];
                j --;//元素后移
            }
            _dataArray[j + 1] = @(x);//插入到正确位置
        }
        NSLog(@"%@",_dataArray); //打印每趟排序的结果
    }
    NSLog(@"%@",_dataArray);

}
#pragma mark -- 选择排序
//在要排序的一组数中，选出最小（或者最大）的一个数与第1个位置的数交换；然后在剩下的数当中再找最小（或者最大）的与第2个位置的数交换，依次类推，直到第n-1个元素（倒数第二个数）和第n个元素（最后一个数）比较为止。
- (void)createMethod1{

    for (int i = 0; i<_dataArray.count; i ++) {
        for (int j = i; j < _dataArray.count; j ++){
            if (_dataArray[i] < _dataArray[j]){
                [_dataArray exchangeObjectAtIndex:i withObjectAtIndex:j];
            }
        }
        NSLog(@"%@",_dataArray);
    }
    NSLog(@"%@",_dataArray);

}

#pragma mark -- 冒泡排序
//在要排序的一组数中，对当前还未排好序的范围内的全部数，自上而下对相邻的两个数依次进行比较和调整，让较大的数往下沉，较小的往上冒。即：每当两相邻的数比较后发现它们的排序与排序要求相反时，就将它们互换。
- (void)createMethod2{
//    int a = _dataArray.count - 1;
//    while (a > 0) {
//        int pos = 0;
//        for(int j = 0;j<a;j++){
//            if(_dataArray[j] < _dataArray[j+1]){
//                pos = j;
//                [_dataArray exchangeObjectAtIndex:j withObjectAtIndex:j+1];
//            }
//        }
//        a = pos;
//        NSLog(@"%@",_dataArray);
//
//    }
    for(int i = 0;i < _dataArray.count;i ++){
        BOOL isYES = NO;
        for (int j = 0; j < _dataArray.count - 1 - i; j ++) {
            if (_dataArray[j] < _dataArray[j + 1]){
                [_dataArray exchangeObjectAtIndex:j withObjectAtIndex:j + 1];
                isYES = YES;
            }
        }
        NSLog(@"%@",_dataArray);
        if (isYES ==NO){
            break;
        }

    }

}

#pragma mark --快速排序
//1）选择一个基准元素,通常选择第一个元素或者最后一个元素,
//
//2）通过一趟排序讲待排序的记录分割成独立的两部分，其中一部分记录的元素值均比基准元素值小。另一部分记录的 元素值比基准值大。
//
//3）此时基准元素在其排好序后的正确位置
//
//4）然后分别对这两部分记录用同样的方法继续进行排序，直到整个序列有序。
- (void)createMethod3{
    NSMutableArray *arr = [[NSMutableArray alloc] initWithObjects:@(6), @(1),@(2),@(5),@(9),@(4),@(3),@(7),nil];
    [self quickSortArray:arr withLeftIndex:0 andRightIndex:arr.count - 1];
    NSLog(@"%@",arr);
}

- (void)quickSortArray:(NSMutableArray*)array withLeftIndex:(NSInteger)left andRightIndex:(NSInteger)right {
    if (left >= right) {
        //如果数组的长度为0或者1时返回
        return;
    }
    NSInteger i = left;
    NSInteger j = right;
    NSInteger key = [array[i] integerValue];
    while (i < j) {
        /**** 首先从右边j开始查找比基准数小的值 ***/
        while (i<j && [array[j] integerValue] >= key) {//如果比基准数大，继续查找
            j --;
        }
        //如果比基准数小，则将查找到的小值调换到i的位置
        array[i] = array[j];
        /**** 当在右边查找到一个比基准数小的值时，就从i开始往后找比基准数大的值 ***/
        while (i < j && [array[i] integerValue] <= key) {//如果比基准数小，继续查找
            i ++;
        }
        //如果比基准数大，则将查找到的大值调换到j的位置
        array[j] = array[i];
        //将基准数放到正确位置
        array[i] = @(key);
        /**** 递归排序 ***/ //排序基准数左边的
        [self quickSortArray:array withLeftIndex:left andRightIndex:i - 1];
        //排序基准数右边的
        [self quickSortArray:array withLeftIndex:i + 1 andRightIndex:right];
        
        
       
    }
}
#pragma mark -- 合并排序
//归并（Merge）排序法是将两个（或两个以上）有序表合并成一个新的有序表，即把待排序序列分为若干个子序列，每个子序列是有序的。然后再把有序子序列合并为整体有序序列。
- (void)createMethod4{
    NSArray * A1 = @[@2,@8,@20];
    NSArray * A2 = @[@1,@4,@10];
    NSMutableArray * A3 = [[NSMutableArray alloc] init];
    int a = 0;
    int b = 0;
    while (a < A1.count && b < A2.count) {
        if (A1[a] < A2[b]) {
            [A3 addObject:A1[a]];
            a ++;
        }else{
            [A3 addObject:A2[b]];
            b ++;

        }
    }
    while (a < A1.count) {
        [A3 addObject:A1[a]];
        a ++;
    }

    while (b < A2.count) {
        [A3 addObject:A2[b]];
        b ++;
    }

    NSLog(@"%@",A3);
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
