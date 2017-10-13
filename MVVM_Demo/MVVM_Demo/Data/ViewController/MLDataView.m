//
//  MLDataView.m
//  MVVM_Demo
//
//  Created by lijinshi on 2017/10/12.
//  Copyright © 2017年 lijinshi. All rights reserved.
//

#import "MLDataView.h"

@implementation MLDataView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self layout];
    }
    return self;
}

- (void)layout
{
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self);
    }];
}

- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] init];
        _tableView.rowHeight = 80;
        [self addSubview:_tableView];
    }
    return _tableView;
}

@end
