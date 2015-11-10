//
//  PlayView.h
//  BaseProject
//
//  Created by soft on 15/11/10.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface PlayView : UIView

- (void)playWithURl:(NSURL *)musicURl;

+ (PlayView *)sharedInstance;
@property (strong, nonatomic) AVPlayer *player;
@property (strong, nonatomic) UIButton *playBtn;

@end
