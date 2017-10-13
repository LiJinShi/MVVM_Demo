//
//  MLCustomHud.h
//  MaLi
//
//  Created by lijinshi on 2017/3/23.
//  Copyright © 2017年 lijinshi. All rights reserved.
//

#import "MBProgressHUD.h"

@interface MLCustomHud : MBProgressHUD

+ (instancetype)sharedInstance;

// 显示文字 2秒后自动消失（添加在窗口上）
- (void)showText:(NSString *)text;

// 显示文字 2秒后自动消失 (添加到参数view上)
- (void)showText:(NSString *)text inView:(UIView *)view;

// 显示文字，添加到指定view，指定显示时间
- (void)showText:(NSString *)text
          inView:(UIView *)view
       afterTime:(CGFloat)time;

@end
