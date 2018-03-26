//
//  RootViewController.m
//  BlueSkyVideo
//
//  Created by 许菠菠 on 2018/3/14.
//  Copyright © 2018年 许菠菠. All rights reserved.
//

#import "RootViewController.h"
#import "MapViewController.h"
#import "GCDViewController.h"
#import "SortMethodViewController.h"
#import "KVCViewController.h"
#import "EncryptionViewController.h"
#import "BaseCell.h"
@interface RootViewController()<UITableViewDelegate,UITableViewDataSource>{
    UITableView * baseTableViewController;
    NSArray * baseDataSoure;
    NSArray * viewControllers;
}
@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    baseDataSoure = @[@"地图",@"多线程",@"排序算法",@"KVC和KVO",@"加密算法"];
    GCDViewController * vc = [[GCDViewController alloc] init];
    SortMethodViewController * vc2 = [[SortMethodViewController alloc] init];
    KVCViewController * vc3 = [[KVCViewController alloc] init];
    EncryptionViewController * vc4 = [[EncryptionViewController alloc] init];
    viewControllers = @[[[MapViewController alloc] init],vc,vc2,vc3,vc4];
    self.view.backgroundColor = [UIColor whiteColor];
    baseTableViewController = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    baseTableViewController.delegate = self;
    baseTableViewController.dataSource = self;
    baseTableViewController.separatorStyle = UITableViewCellSeparatorStyleNone;
    [baseTableViewController registerNib:[UINib nibWithNibName:@"BaseCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"cellString"];
    [self.view addSubview:baseTableViewController];
   
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 45;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return baseDataSoure.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    BaseCell * cell  = [tableView dequeueReusableCellWithIdentifier:@"cellString"];
    cell.titleLable.text = baseDataSoure[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UIViewController * VC = viewControllers[indexPath.row];
    VC.title = baseDataSoure[indexPath.row];
    [self.navigationController pushViewController:VC animated:YES];
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
