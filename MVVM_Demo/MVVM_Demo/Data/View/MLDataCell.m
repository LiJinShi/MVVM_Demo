//
//  MLDataCell.m
//  MVVM_Demo
//
//  Created by lijinshi on 2017/10/13.
//  Copyright © 2017年 lijinshi. All rights reserved.
//

#import "MLDataCell.h"
#import "UIImageView+WebCache.h"

@interface MLDataCell()

// 图片
@property (nonatomic, strong) UIImageView *themeImageView;
// 频道名称
@property (nonatomic, strong) UILabel *themeNameLabel;
// 订阅人数
@property (nonatomic, strong) UILabel *subThemeLabel;


@end

@implementation MLDataCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self layout];
    }
    return self;
}

- (void)layout
{
    WS(weakSelf);
    [self.themeImageView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(12);
        make.centerY.mas_equalTo(weakSelf.contentView);
        make.size.mas_equalTo(CGSizeMake(60, 60));
    }];
    
    [self.themeNameLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(weakSelf.themeImageView.mas_right).offset(10);
        make.top.mas_equalTo(weakSelf.themeImageView).offset(5);
    }];
    
    [self.subThemeLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(weakSelf.themeNameLabel);
        make.bottom.mas_equalTo(weakSelf.themeImageView).offset(-5);
    }];
}

// 设置数据
- (void)setDataModel:(MLDataModel *)dataModel
{
    _dataModel = dataModel;
    [self.themeImageView sd_setImageWithURL:[NSURL URLWithString:dataModel.image_list]];
    self.themeNameLabel.text = dataModel.theme_name;
    self.subThemeLabel.text = [dataModel dealSubNumber];
}


- (UIImageView *)themeImageView
{
    if (!_themeImageView) {
        _themeImageView = [[UIImageView alloc] init];
        _themeImageView.layer.cornerRadius = 30;
        _themeImageView.clipsToBounds = YES;
        [self.contentView addSubview:_themeImageView];
    }
    return _themeImageView;
}

- (UILabel *)themeNameLabel
{
    if (!_themeNameLabel) {
        _themeNameLabel = [[UILabel alloc] init];
        _themeNameLabel.font = [UIFont systemFontOfSize:14];
        [self.contentView addSubview:_themeNameLabel];
    }
    return _themeNameLabel;
}

- (UILabel *)subThemeLabel
{
    if (!_subThemeLabel) {
        _subThemeLabel = [[UILabel alloc] init];
        _subThemeLabel.font = [UIFont systemFontOfSize:12];
        [self.contentView addSubview:_subThemeLabel];
    }
    return _subThemeLabel;
}

@end
