//
//  MLDataViewModel.h
//  MVVM_Demo
//
//  Created by lijinshi on 2017/10/13.
//  Copyright © 2017年 lijinshi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MLDataModel.h"

@interface MLDataViewModel : NSObject<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSArray *dataModelArray;
// 点击cell回调
@property (nonatomic, strong) void(^callBlock)(MLDataModel *dataM);


// 请求数据
- (void)requestData:(void(^)(void))sBlock fBlock:(void(^)(void))fBlock;

@end
