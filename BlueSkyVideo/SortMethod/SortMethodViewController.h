//
//  SortMethodViewController.h
//  BlueSkyVideo
//
//  Created by 许菠菠 on 2018/3/21.
//  Copyright © 2018年 许菠菠. All rights reserved.
//

#import "BaseViewController.h"

@interface SortMethodViewController : BaseViewController
@property (nonatomic,copy) void (^Block)(NSString *name);
@end
