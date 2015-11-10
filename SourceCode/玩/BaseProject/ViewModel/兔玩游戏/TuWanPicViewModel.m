//
//  TuWanPicViewModel.m
//  BaseProject
//
//  Created by soft on 15/11/9.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "TuWanPicViewModel.h"
#import "TuWanNetManager.h"

@implementation TuWanPicViewModel
- (id)initWithAid:(NSString *)aid{
    if (self = [super init]) {
        self.aid = aid;
    }
    return self;
}

/** 防御性编程，不允许使用init初始化 */
- (id)init{
    if (self = [super init]) {
        NSAssert1(NO, @"%s 必须使用initWith初始化", __func__);
    }
    return self;
}

- (NSInteger)rowNumber{
    return self.picModel.content.count;
}

- (NSURL *)picForRow:(NSInteger)row{
    TuWanPicContentModel *model = self.picModel.content[row];
    return [NSURL URLWithString:model.pic];
}

- (void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle{
        self.dataTask = [TuWanNetManager getPicDetailWithId:_aid completionHandle:^(TuWanPicModel *model, NSError *error) {
//            NSMutableArray *arr = [NSMutableArray new];
//            for (TuWanPicContentModel *connentModel in model) {
//                NSURL *url = [NSURL URLWithString:connentModel.pic];
//                [arr addObject:url];
//            }
//            self.imageURLs = arr;
            self.picModel = model;
            completionHandle(error);
        }];
}


@end
