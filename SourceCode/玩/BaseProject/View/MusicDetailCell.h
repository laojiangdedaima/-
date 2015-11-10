//
//  MusicDetailCell.h
//  BaseProject
//
//  Created by soft on 15/11/10.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TRImageView.h"

@interface MusicDetailCell : UITableViewCell
/** 原则上 .h文件中只存放需要被调用get或者set方法的属性 */

/** 音乐封面图 */
@property (strong, nonatomic) TRImageView *coverIV;

/** 题目的标签*/
@property (strong, nonatomic) UILabel *titleLb;

/** 添加时间标签 */
@property (strong, nonatomic) UILabel *timeLb;

/** 音乐来源标签 */
@property (strong, nonatomic) UILabel *sourceLb;

/** 播放次数标签 */
@property (strong, nonatomic) UILabel *favorCountLb;

/** 喜欢次数标签 */
@property (strong, nonatomic) UILabel *playCountLb;

/** 评论次数标签 */
@property (strong, nonatomic) UILabel *commentCountLb;

/** 时长标签 */
@property (strong, nonatomic) UILabel *durationLb;

/** 下载按钮 */
@property (strong, nonatomic) UIButton *downloadBtn;@end
