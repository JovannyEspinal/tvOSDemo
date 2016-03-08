//
//  ShoeViewController.m
//  Demo-tvOSApp
//
//  Created by Jovanny Espinal on 3/7/16.
//  Copyright © 2016 Jovanny Espinal. All rights reserved.
//

#import "ShoeViewController.h"

@interface ShoeViewController ()

@property AVPlayer *player;

@end

@implementation ShoeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self configurePlayer];
    
    AVPlayerLayer *playerLayer = [self configurePlayerLayer];
    
    [self configureVideoContainer:playerLayer];
    
    [self.player play];
    
    [[NSNotificationCenter defaultCenter] addObserver: self
                                             selector: @selector(loopVideo)
                                                 name: AVPlayerItemDidPlayToEndTimeNotification
                                               object: nil];
    
}

-(void)loopVideo
{
    [self.player seekToTime:kCMTimeZero];
    [self.player play];
}

-(void)configurePlayer
{
    NSString *path = [[NSBundle mainBundle] pathForResource: @"ManPuttingOnShoes"
                                                     ofType: @"mp4"];
    
    NSURL *url = [NSURL fileURLWithPath: path];
    
    self.player = [AVPlayer playerWithURL: url];
    self.player.muted = YES;
}

-(AVPlayerLayer *)configurePlayerLayer
{
    AVPlayerLayer *playerLayer = [AVPlayerLayer playerLayerWithPlayer: self.player];
    playerLayer.videoGravity = AVLayerVideoGravityResizeAspectFill;
    playerLayer.frame = self.videoContainer.bounds;
    
    return playerLayer;
}

-(void)configureVideoContainer:(AVPlayerLayer *)playerLayer
{
    [self.videoContainer.layer addSublayer: playerLayer];
    self.videoContainer.playerLayer = playerLayer;
}
@end
