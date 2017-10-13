//
//  UIView+HudCount.m
//  MaLi
//
//  Created by lijinshi on 2017/3/23.
//  Copyright © 2017年 lijinshi. All rights reserved.
//

#import "UIView+HudCount.h"
#import <objc/runtime.h>
#import "MBProgressHUD.h"

@implementation UIView (HudCount)

- (void)setHudCount:(NSInteger)hudCount
{
    objc_setAssociatedObject(self, @selector(hudCount), [NSNumber numberWithInteger:hudCount], OBJC_ASSOCIATION_ASSIGN);
}

- (NSInteger)hudCount
{
    id value = objc_getAssociatedObject(self, @selector(hudCount));
    return [value integerValue];
}

- (void)showBaseHud:(NSString *)text
{
    if (self.hudCount > 0) { // 已经有Hud在显示
        self.hudCount ++;
        return;
    } else { // 需要新的Hud
        MBProgressHUD *baseHud = [MBProgressHUD showHUDAddedTo:self animated:NO];
        baseHud.mode = MBProgressHUDModeIndeterminate;
        baseHud.label.text = text;
        baseHud.backgroundColor = [UIColor clearColor];
        self.hudCount ++;
    }
}

- (void)hideBaseHud
{
    if (self.hudCount <= 0) {
        [self removeBaseHudFromView:self];
    } else {
        self.hudCount --;
        if (self.hudCount <= 0) {
            [self removeBaseHudFromView:self];
        }
    }
}

- (void)removeBaseHudFromView:(UIView *)view
{
    view.hudCount = 0;
    for (UIView *subV in view.subviews) {
        if ([subV isKindOfClass:[MBProgressHUD class]]) {
            MBProgressHUD *hud = (MBProgressHUD *)subV;
            [hud hideAnimated:NO];
        }
    }
}

@end
