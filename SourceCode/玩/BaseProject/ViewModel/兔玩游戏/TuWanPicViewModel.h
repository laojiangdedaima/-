//
//  TuWanPicViewModel.h
//  BaseProject
//
//  Created by soft on 15/11/9.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"
#import "TuWanNetManager.h"

@interface TuWanPicViewModel : BaseViewModel
/** 必须使用下方初始化方法 */
- (id)initWithAid:(NSString *)aid;
@property (strong, nonatomic) NSString * aid;

@property (nonatomic) NSInteger rowNumber;

- (NSURL *)picForRow:(NSInteger)row;

@property (strong, nonatomic) TuWanPicModel * picModel;

@end
