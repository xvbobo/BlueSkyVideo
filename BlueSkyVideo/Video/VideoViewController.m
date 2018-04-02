//
//  VideoViewController.m
//  BlueSkyVideo
//
//  Created by 许菠菠 on 2017/11/17.
//  Copyright © 2017年 许菠菠. All rights reserved.
//

#import "VideoViewController.h"
#import <AVKit/AVKit.h>
#import "KxMovieViewController.h"
@interface VideoViewController ()
@property (nonatomic,strong) AVPlayer * player;
@property (nonatomic,assign) NSTimeInterval total;
@property (nonatomic,strong) UIProgressView * pressView;
@end

@implementation VideoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    http://m.budejie.com/video/1
//    http://flv2.bn.netease.com/tvmrepo/2017/3/M/1/ECEIM9AM1/SD/ECEIM9AM1-mobile.mp4
//http://mvideo.spriteapp.cn/video/2017/1204/5a2538b6740a9_wpcco.mp4
//http://mvideo.spriteapp.cn/video/2017/1205/5a2669649b820_wpcco.mp4
//http://mvideo.spriteapp.cn/video/2017/1205/5a264c83d094b_wpcco.mp4
//http://mvideo.spriteapp.cn/video/2017/1205/5a26863248a11_wpcco.mp4
//http://mvideo.spriteapp.cn/video/2017/1204/c6a9b228d8a211e7ad45842b2b4c75ab_wpcco.mp4
//http://mvideo.spriteapp.cn/video/2017/1204/5a25262c63a12_wpcco.mp4
//http://mvideo.spriteapp.cn/video/2017/0713/596735fb3e974_wpcco.mp4
//http://mvideo.spriteapp.cn/video/2017/1205/5a267162a7f45_wpcco.mp4
//http://mvideo.spriteapp.cn/video/2017/1205/901778fe-d95f-11e7-befc-1866daeb0df1_wpcco.mp4
//http://mvideo.spriteapp.cn/video/2017/1204/8db86fc8d8a111e78410842b2b4c75ab_wpcco.mp4
//http://mvideo.spriteapp.cn/video/2017/1205/730be472d97b11e7aa1c842b2b4c75ab_wpcco.mp4
//http://mvideo.spriteapp.cn/video/2017/1206/5a274603a2761_wpcco.mp4
//http://mvideo.spriteapp.cn/video/2017/1129/5a1e59ca9e5a7_wpcco.mp4
//http://mvideo.spriteapp.cn/video/2017/1205/5a2593af00111_wpcco.mp4
//http://mvideo.spriteapp.cn/video/2017/1204/43c650ccd8a311e7b653842b2b4c75ab_wpcco.mp4
//http://mvideo.spriteapp.cn/video/2017/1204/0ddd5e64-d8c7-11e7-8141-d4ae5296039d_wpcco.mp4
//http://mvideo.spriteapp.cn/video/2017/1201/5a213e7bb438d_wpcco.mp4
//http://mvideo.spriteapp.cn/video/2017/1129/5a1e500e0137e_wpcco.mp4
//http://mvideo.spriteapp.cn/video/2017/1204/5a24a19d2ab46_wpcco.mp4
//http://mvideo.spriteapp.cn/video/2017/1204/91bd56f0-d90b-11e7-befc-1866daeb0df1_wpcco.mp4

//    AVPlayerItem * playItem = [[AVPlayerItem alloc] initWithURL:[NSURL URLWithString:@"http://mvideo.spriteapp.cn/video/2017/1204/5a25262c63a12_wpcco.mp4"]];
//    [playItem addObserver:self forKeyPath:@"loadedTimeRanges" options:NSKeyValueObservingOptionNew context:nil];
//    [playItem addObserver:self forKeyPath:@"status" options:NSKeyValueObservingOptionNew context:nil];
//
//    self.player  = [[AVPlayer alloc] initWithPlayerItem:playItem];
//    AVPlayerLayer * playerLayer = [AVPlayerLayer playerLayerWithPlayer:self.player];
//    playerLayer.videoGravity = AVLayerVideoGravityResize;
//    playerLayer.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.width/3 * 2);
//    UIView *playerView = [[UIView alloc] initWithFrame:CGRectMake(0, 20, CGRectGetWidth(playerLayer.frame), CGRectGetHeight(playerLayer.frame))];
//    playerView.backgroundColor = [UIColor blackColor];
//    [playerView.layer addSublayer:playerLayer];
//    [self.view addSubview:playerView];
    NSString *path = @"http://mvideo.spriteapp.cn/video/2017/1204/5a2538b6740a9_wpcco.mp4";
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    
    // increase buffering for .wmv, it solves problem with delaying audio frames
    if ([path.pathExtension isEqualToString:@"wmv"])
        parameters[KxMovieParameterMinBufferedDuration] = @(5.0);
    
    // disable deinterlacing for iPhone, because it's complex operation can cause stuttering
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
        parameters[KxMovieParameterDisableDeinterlacing] = @(YES);
    
    KxMovieViewController *vc = [KxMovieViewController movieViewControllerWithContentPath:path
                                                                               parameters:parameters];
    [self presentViewController:vc animated:YES completion:nil];
    
//    [self.player play];
    
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    AVPlayerItem * playItem = (AVPlayerItem *)object;
    if ([keyPath isEqualToString:@"loadedTimeRanges"]) {
        //监听缓存进度
        NSArray * loadedTimesRanges = [playItem loadedTimeRanges];
        CMTimeRange timeRange = [loadedTimesRanges.firstObject CMTimeRangeValue];
        //开始的时间
        NSTimeInterval startSeconds = CMTimeGetSeconds(timeRange.start);
        //已近缓冲的时间
        NSTimeInterval durationSeconds = CMTimeGetSeconds(timeRange.duration);
        // 计算缓冲总时间
//        NSTimeInterval result = startSeconds + durationSeconds;
        
        if (playItem.status == AVPlayerItemStatusReadyToPlay) {
//            NSLog(@"准备播放");
            //获取当前播放进度
            
            [self.player play];
//            CMTime ctime = self.player.currentTime;
//            CGFloat currentTimeSec = ctime.value/ctime.timescale;
//            NSLog(@"当前播放进度 = %f",currentTimeSec);

            self.total = CMTimeGetSeconds(self.player.currentItem.duration);
        }else{
            NSLog(@"播放失败");
        }
        NSLog(@"视频的加载进度是:%%%f", durationSeconds/self.total * 100);

    }else{
        NSLog(@"%@",keyPath);
    }
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
