//
//  AVPlayer.m
//  AVPlayer
//
//  Created by 程石亮 on 2017/12/18.
//  Copyright © 2017年 Chengsl02. All rights reserved.
//

#import "AVPlayer.h"
#import <AVFoundation/AVFoundation.h>
#import <React/RCTUtils.h>
@interface AVPlayer()<AVAudioPlayerDelegate>
@property (nonatomic, strong) AVAudioPlayer *audioPlayer;
@end

@implementation AVPlayer
@synthesize bridge = _bridge;
RCT_EXPORT_MODULE();
- (dispatch_queue_t)methodQueue
{
    return dispatch_get_main_queue();
}
- (NSArray<NSString *> *)supportedEvents
{
    return @[@"playAudio"];//供js调用方法列表
}
- (NSDictionary *)constantsToExport{//提供给js的常量列表
    return @{};
}
RCT_EXPORT_METHOD(playAudio)
{
    [self play];
}
- (void)play{
    NSLog(@"播放了！！！！！");
    if (self.audioPlayer) {
        [self.audioPlayer stop];
        self.audioPlayer = nil;
    }
    self.audioPlayer =[[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"金莎 - 星月神话" ofType:@"mp3"]]error:nil];
    self.audioPlayer.delegate = self;
    self.audioPlayer.numberOfLoops =0;
    [self.audioPlayer prepareToPlay];
    [self.audioPlayer play];
}
- (void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag
{
    //播放结束时执行的动作
}
- (void)audioPlayerDecodeErrorDidOccur:(AVAudioPlayer *)player error:(NSError *)error;
{
    //解码错误执行的动作
}
- (void)audioPlayerBeginInterruption:(AVAudioPlayer *)player;
{
    //处理中断的代码
}
- (void)audioPlayerEndInterruption:(AVAudioPlayer *)player
{
    [self.audioPlayer play];
}
- (void)dealloc{
    if (self.audioPlayer) {
        [self.audioPlayer stop];
        self.audioPlayer = nil;
    }
}
@end
