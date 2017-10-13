//
//  MLDataViewModel.m
//  MVVM_Demo
//
//  Created by lijinshi on 2017/10/13.
//  Copyright © 2017年 lijinshi. All rights reserved.
//

#import "MLDataViewModel.h"
#import "MLDataModel.h"
#import "MJExtension.h"
#import "MLDataCell.h"

@interface MLDataViewModel()

@end

@implementation MLDataViewModel

- (void)requestData:(void (^)(void))sBlock fBlock:(void (^)(void))fBlock
{
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict[@"a"] = @"tag_recommend";
    dict[@"c"] = @"topic";
    dict[@"action"] = @"sub";
    WS(weakSelf);
    [MLNetService requestType:RequestTypeGet URL:kBaseUrl dict:dict sBlock:^(id result) {
        weakSelf.dataModelArray = [MLDataModel mj_objectArrayWithKeyValuesArray:result];
        
        if (sBlock) {
            sBlock();
        }
    } fBlcok:^(NSError *error) {
        if (fBlock) {
            fBlock();
        }
    }];
}

#pragma makr UITableViewDelegate, UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataModelArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MLDataCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([MLDataCell class])];
    MLDataModel *dataModel = self.dataModelArray[indexPath.row];
    cell.dataModel = dataModel;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (self.callBlock) {
        MLDataModel *dataM = self.dataModelArray[indexPath.row];
        self.callBlock(dataM);
    }
}

@end
