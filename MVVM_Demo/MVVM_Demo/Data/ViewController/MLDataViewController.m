//
//  MLDataViewController.m
//  MVVM_Demo
//
//  Created by lijinshi on 2017/10/12.
//  Copyright © 2017年 lijinshi. All rights reserved.
//

#import "MLDataViewController.h"
#import "MLDataView.h"
#import "MLDataViewModel.h"
#import "UIView+HudCount.h"
#import "MLDataCell.h"
#import "MJRefresh.h"
#import "MLCustomHud.h"

@interface MLDataViewController ()

// 控制器对应的view，所以view的初始化，布局在里面做好
@property (nonatomic, strong) MLDataView *dataView;
// 负责网络请求及其他计算或事件处理
@property (nonatomic, strong) MLDataViewModel *dataViewModel;

@end

@implementation MLDataViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self initValues];
    
    // 请求数据
    [self.view showBaseHud:@"加载中"];
    WS(weakSelf);
    [self.dataViewModel requestData:^{
        [weakSelf.view hideBaseHud];
        [weakSelf.dataView.tableView reloadData];
        
    } fBlock:^{
        [weakSelf.view hideBaseHud];
        
    }];
    
    // 点击cell跳转
    self.dataViewModel.callBlock = ^(MLDataModel *dataM) {
        MLBaseViewController *vc = [MLBaseViewController new];
        vc.view.backgroundColor = [UIColor whiteColor];
        vc.title = dataM.theme_name;
        [weakSelf.navigationController pushViewController:vc animated:YES];
    };
    
    // 下拉刷新
    self.dataView.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [weakSelf.dataViewModel requestData:^{
            [weakSelf.dataView.tableView.mj_header endRefreshing];
            [[MLCustomHud sharedInstance] showText:@"刷新成功"];
            [weakSelf.dataView.tableView reloadData];
        } fBlock:^{

        }];
    }];
}

- (void)initValues
{
    self.navigationItem.title = @"展示数据";
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.dataView];
}

- (MLDataViewModel *)dataViewModel
{
    if (!_dataViewModel) {
        _dataViewModel = [[MLDataViewModel alloc] init];
    }
    return _dataViewModel;
}

- (MLDataView *)dataView
{
    if (!_dataView) {
        _dataView = [[MLDataView alloc] initWithFrame:kviewRect];
        _dataView.tableView.dataSource = self.dataViewModel;
        _dataView.tableView.delegate = self.dataViewModel;
        [_dataView.tableView registerClass:[MLDataCell class] forCellReuseIdentifier:NSStringFromClass([MLDataCell class])];
    }
    return _dataView;
}

@end
