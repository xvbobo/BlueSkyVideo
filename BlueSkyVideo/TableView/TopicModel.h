//
//  TopicModel.h
//  BlueSkyVideo
//
//  Created by 许菠菠 on 2018/2/27.
//  Copyright © 2018年 许菠菠. All rights reserved.
//

#import "BaseModel.h"
@class userModel;
@interface TopicModel : BaseModel
@property (nonatomic,copy) NSString * title;
//@property (nonatomic,strong) NSArray * imageList;
@property (nonatomic,copy) NSString * content;
@property (nonatomic,strong) NSDictionary * user;
@property (nonatomic,strong) userModel * model;
@end
