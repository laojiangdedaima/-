//
//  XiMaCategoryCell.m
//  BaseProject
//
//  Created by soft on 15/11/9.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "XiMaCategoryCell.h"

@implementation XiMaCategoryCell

- (UILabel *)orderLb {
    if(_orderLb == nil) {
        _orderLb = [[UILabel alloc] init];
        _orderLb.font = [UIFont systemFontOfSize:18];
        _orderLb.textColor = [UIColor lightGrayColor];
        //居中
        _orderLb.textAlignment = NSTextAlignmentCenter;
        //KVO的知识
        //使用KVO－键值观察，如果text被赋值为1，颜色是..
        //下方方法：如果_orderLbde text的属性被赋新值，则触发task
        [_orderLb bk_addObserverForKeyPath:@"text" options:NSKeyValueObservingOptionNew task:^(id obj, NSDictionary *change) {
            NSString *value = change[@"new"];
            if ([value isEqualToString:@"1"]) {
                _orderLb.textColor = [UIColor redColor];
            }else if ([value isEqualToString:@"2"]){
                _orderLb.textColor = [UIColor greenSeaColor];
            }else if ([value isEqualToString:@"3"]){
                _orderLb.textColor = [UIColor blueColor];
            }else{
                _orderLb.textColor = [UIColor blackColor];
            }
        }];
        [self.contentView addSubview:_orderLb];
        //添加依赖,一定要有顺序，从左到右，从上往下
        [self.orderLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(0);
            make.left.mas_equalTo(10);
            make.width.mas_equalTo(35);
        }];
    }
    return _orderLb;
}

- (TRImageView *)iconIV {
    if(_iconIV == nil) {
        _iconIV = [[TRImageView alloc] init];
        [self.contentView addSubview:_iconIV];
        [self.iconIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(65, 65));
            make.centerY.mas_equalTo(0);
            make.left.mas_equalTo(self.orderLb.mas_right).mas_equalTo(0);
        }];
    }
    return _iconIV;
}

- (UILabel *)titleLb {
    if(_titleLb == nil) {
        _titleLb = [[UILabel alloc] init];
        _titleLb.font = [UIFont systemFontOfSize:18];
        [self.contentView addSubview:_titleLb];
        [self.titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.topMargin.mas_equalTo(self.iconIV.mas_topMargin).mas_equalTo(3);
            make.left.mas_equalTo(self.iconIV.mas_right).mas_equalTo(10);
            make.right.mas_equalTo(-10);
        }];
    }
    return _titleLb;
}

- (UILabel *)deseLb {
    if(_deseLb == nil) {
        _deseLb = [[UILabel alloc] init];
        _deseLb.font = [UIFont systemFontOfSize:15];
        _deseLb.textColor = [UIColor lightGrayColor];
        [self.contentView addSubview:_deseLb];
        [self.deseLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(0);
            make.left.mas_equalTo(self.iconIV.mas_right).mas_equalTo(10);
            make.right.mas_equalTo(-10);
        }];
    }
    return _deseLb;
}

- (UILabel *)numberLb {
    if(_numberLb == nil) {
        _numberLb = [[UILabel alloc] init];
        _numberLb.font = [UIFont systemFontOfSize:12];
        _numberLb.textColor = [UIColor lightGrayColor];
        [self.contentView addSubview:_numberLb];
        [self.numberLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.numberIV.mas_right).mas_equalTo(2);
            make.right.mas_equalTo(-10);
            make.bottomMargin.mas_equalTo(self.iconIV.mas_bottomMargin).mas_equalTo(-3);
            make.centerY.mas_equalTo(self.numberIV);
        }];
    }
    return _numberLb;
}

- (TRImageView *)numberIV {
    if(_numberIV == nil) {
        _numberIV = [[TRImageView alloc] init];
        _numberIV.imageView.image = [UIImage imageNamed:@"album_tracks"];
        [self.contentView addSubview:_numberIV];
        [self.numberIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.iconIV.mas_right).mas_equalTo(10);
            make.size.mas_equalTo(CGSizeMake(10, 10));
        }];
    }
    return _numberIV;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        //右箭头
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;// ->1

        //添加分割线
        self.separatorInset = UIEdgeInsetsMake(0, 105, 0, 0);
        
    }
    return self;
}


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
