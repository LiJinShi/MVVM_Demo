//
//  MLDataCell.h
//  MVVM_Demo
//
//  Created by lijinshi on 2017/10/13.
//  Copyright © 2017年 lijinshi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MLDataModel.h"

@interface MLDataCell : UITableViewCell

// 接受数据
@property (nonatomic, strong) MLDataModel *dataModel;

@end
