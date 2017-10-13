//
//  MLDataModel.m
//  MVVM_Demo
//
//  Created by lijinshi on 2017/10/13.
//  Copyright © 2017年 lijinshi. All rights reserved.
//

#import "MLDataModel.h"

@implementation MLDataModel

// 人数少于万直接显示，上万的用万计数
- (NSString *)dealSubNumber
{
    NSString *temp = @"";
    if (self.sub_number > 10000) {
        double number = self.sub_number / 10000.0;
        temp = [NSString stringWithFormat:@"%.1f万人订阅", number];
    } else {
        temp = [NSString stringWithFormat:@"%ld人订阅", self.sub_number];
    }
    return temp;
}

@end
