//
//  MLCustomHud.m
//  MaLi
//
//  Created by lijinshi on 2017/3/23.
//  Copyright © 2017年 lijinshi. All rights reserved.
//

#import "MLCustomHud.h"

@implementation MLCustomHud

+ (instancetype)sharedInstance
{
    static MLCustomHud *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

// 显示文字 2秒后自动消失（添加在窗口上）
- (void)showText:(NSString *)text
{
    UIView *view = [UIApplication sharedApplication].keyWindow;
    [self showText:text inView:view afterTime:2];
}

- (void)showText:(NSString *)text inView:(UIView *)view
{
    [self showText:text inView:view afterTime:2];
}

// 显示文字，添加到指定view，指定显示时间
- (void)showText:(NSString *)text inView:(UIView *)view afterTime:(CGFloat)time
{
    self.animationType = MBProgressHUDAnimationZoom;
    self.bezelView.style = MBProgressHUDBackgroundStyleSolidColor;
    self.bezelView.color = [[UIColor blackColor] colorWithAlphaComponent:0.7];
    self.mode = MBProgressHUDModeText;
    self.label.textColor = [UIColor whiteColor];
    self.label.text = text;
    [view addSubview:self];
    [self showAnimated:YES];
    [self hideAnimated:YES afterDelay:time];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(time * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self removeFromSuperview];
    });
}

@end
