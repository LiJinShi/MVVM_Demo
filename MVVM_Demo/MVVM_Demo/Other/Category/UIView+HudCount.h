//
//  UIView+HudCount.h
//  MaLi
//
//  Created by lijinshi on 2017/3/23.
//  Copyright © 2017年 lijinshi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (HudCount)

// 网络请求加载框 计数
@property (nonatomic, assign) NSInteger hudCount;

- (void)showBaseHud:(NSString *)text;
- (void)hideBaseHud;

@end
