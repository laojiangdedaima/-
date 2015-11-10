//
//  XiMaCategoryCell.h
//  BaseProject
//
//  Created by soft on 15/11/9.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TRImageView.h"

@interface XiMaCategoryCell : UITableViewCell
/** 序号标签 */
@property (strong, nonatomic) UILabel *orderLb;

/** 类型图片 */
@property (strong, nonatomic) TRImageView *iconIV;

/** 类型名称 */
@property (strong, nonatomic) UILabel *titleLb;

/** 类型描述 */
@property (strong, nonatomic) UILabel *deseLb;

/** 级数 */
@property (strong, nonatomic) UILabel *numberLb;

/** 级数图标 */
@property (strong, nonatomic) TRImageView *numberIV;





@end
