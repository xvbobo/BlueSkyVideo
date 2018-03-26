//
//  TopicCell.m
//  BlueSkyVideo
//
//  Created by 许菠菠 on 2018/2/27.
//  Copyright © 2018年 许菠菠. All rights reserved.
//

#import "TopicCell.h"
@interface TopicCell ()
@property (nonatomic,strong) UIImageView * headerImage;
@property (nonatomic,strong) UILabel * nameLable;
@property (nonatomic,strong) UILabel * contentLable;
@end
@implementation TopicCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.backgroundColor = [UIColor lightGrayColor];
        _headerImage = [[UIImageView alloc] initWithFrame:CGRectMake(20, 20, 40, 40)];
        _headerImage.backgroundColor = [UIColor redColor];
        [self.contentView addSubview:_headerImage];
        
        _nameLable = [[UILabel alloc] initWithFrame:CGRectMake(_headerImage.frame.origin.x + _headerImage.frame.size.width + 10, 30, 100, 14)];
        _nameLable.font = [UIFont systemFontOfSize:12];
        _nameLable.textColor = [UIColor blackColor];
        [self.contentView addSubview:_nameLable];
    }
    return self;
}

@end
