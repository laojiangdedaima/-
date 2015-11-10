//
//  TuWanPicViewController.m
//  BaseProject
//
//  Created by soft on 15/11/9.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "TuWanPicViewController.h"
#import "TuWanPicViewModel.h"

@interface TuWanPicViewController () <MWPhotoBrowserDelegate>
@property (strong, nonatomic) TuWanPicViewModel *tuWanPicVM;

@end

@implementation TuWanPicViewController
- (TuWanPicViewModel *)tuWanPicVM{
    if (!_tuWanPicVM) {
        _tuWanPicVM = [[TuWanPicViewModel alloc] initWithAid:_aid];
    }
    return _tuWanPicVM;
}

- (id)initWithAid:(NSString *)aid{
    if (self = [super init]) {
        self.aid = aid;
    }
    return self;
}

- (id)init{
    if (self = [super init]) {
        NSAssert(NO, @"%s 必须使用initWithAid初始化", __func__);
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //非xib storyboard 默认背景是透明的
    self.view.backgroundColor = [UIColor whiteColor];
    //请求时 要有正在操作的提示
    [self showProgress];
    [Factory addBackItemToVC:self];
    
    //发送请求
    [self.tuWanPicVM getDataFromNetCompleteHandle:^(NSError *error) {
        //创建图片展示页 也是GiHuB上图片展示类的空控件
        [self hideProgress];
        MWPhotoBrowser *photoB = [[MWPhotoBrowser alloc] initWithDelegate:self];
        //图片展示页 不应该是当前页推出的，而应该是取代当前页面在导航控制器中的位置
//        [self.navigationController pushViewController:photoB animated:YES];
        NSMutableArray *naviVCs = [NSMutableArray arrayWithArray:self.navigationController.viewControllers];
        [naviVCs removeLastObject];//删除掉最后的控制器。即当前的白色控制器
        //把图片控制器添加到最后
        [naviVCs addObject:photoB];
        //把新的控制器数组赋值给导航控制器
        self.navigationController.viewControllers = naviVCs;
    }];
}

#pragma mark - MWPhotoBrowserDelegate

- (NSUInteger)numberOfPhotosInPhotoBrowser:(MWPhotoBrowser *)photoBrowser{
    return self.tuWanPicVM.rowNumber;
}
- (id <MWPhoto>)photoBrowser:(MWPhotoBrowser *)photoBrowser photoAtIndex:(NSUInteger)index{
    MWPhoto *photo = [MWPhoto photoWithURL:[self.tuWanPicVM picForRow:index]];
    return photo;
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
