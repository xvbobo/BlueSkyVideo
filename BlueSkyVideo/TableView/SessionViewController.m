//
//  SessionViewController.m
//  BlueSkyVideo
//
//  Created by 许菠菠 on 2018/3/14.
//  Copyright © 2018年 许菠菠. All rights reserved.
//

#import "SessionViewController.h"

#import "NetWorking.h"
#import "TopicCell.h"
#import "TopicModel.h"
#define WeakSelf(weakSelf)  __weak __typeof(&*self)weakSelf = self

#define kbaseURL = @"https://tianjinfc.9h-sports.com";
#define kURLStringSessionHomeData = @"/v1/group/gateway/sections/11";//圈子首页
@interface SessionViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView * myTableView;
@property (nonatomic,strong) NSArray * dataSource;
@property (nonatomic,strong) NSMutableArray * cellHeightArray;
@end

@implementation SessionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _myTableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _myTableView.dataSource = self;
    _myTableView.delegate = self;
    [self.view addSubview:_myTableView];
    _cellHeightArray = [NSMutableArray new];
    WeakSelf(weakSelf);
    [[NetWorking shareInstance] getData:@"https://tianjinfc.9h-sports.com/v1/group/gateway/sections/11"];
    [NetWorking shareInstance].topicDataBlock = ^(NSMutableArray *array) {
        NSLog(@"%@",array);
        for (TopicModel * model in array) {
            NSString * contentText = model.content;
            UIFont * font = [UIFont systemFontOfSize:13];
            CGFloat SCREEN_W = [UIScreen mainScreen].bounds.size.width;
            CGFloat contentHeight = [contentText boundingRectWithSize:CGSizeMake(SCREEN_W - 40, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:font} context:nil].size.height;
            CGFloat cellHeight = contentHeight + 40 + 40;
            [weakSelf.cellHeightArray addObject:[NSString stringWithFormat:@"%f",cellHeight]];
            
        }
        weakSelf.dataSource = [array copy];
        [weakSelf.myTableView reloadData];
    };
    // Do any additional setup after loading the view.
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _dataSource.count > 0?_dataSource.count:0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (_cellHeightArray.count > 0) {
        NSString * height = _cellHeightArray[indexPath.row];
        return height.floatValue;
    }else{
        return 0;
    }
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TopicCell * cell = [tableView dequeueReusableCellWithIdentifier:@"topic"];
    if (cell == nil) {
        cell = [[TopicCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"topic"];
    }
    return cell;
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
