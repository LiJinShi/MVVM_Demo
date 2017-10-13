//
//  MLDataModel.h
//  MVVM_Demo
//
//  Created by lijinshi on 2017/10/13.
//  Copyright © 2017年 lijinshi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MLDataModel : NSObject
// 频道名称
@property (nonatomic, copy) NSString *theme_name;
// 频道图片
@property (nonatomic, copy) NSString *image_list;
// 频道id
@property (nonatomic, assign) long theme_id;
// 订阅人数
@property (nonatomic, assign) long sub_number;

// 处理订阅人数
- (NSString *)dealSubNumber;

/*
 "image_list" = "http://img.spriteapp.cn/ugc/2017/06/c1d053a4565411e78e1f842b2b4c75ab.png";
 "is_default" = 0;
 "is_sub" = 0;
 "sub_number" = 282132;
 "theme_id" = 3096;
 "theme_name" = "红人频道";
 */

@end
