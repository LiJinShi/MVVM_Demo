//
//  NSObject+Unicode.h
//  MaLi
//
//  Created by lijinshi on 2017/4/1.
//  Copyright © 2017年 lijinshi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Unicode)

+ (NSString *)stringByReplaceUnicode:(NSString *)string;

+ (void)swizzleSEL:(SEL)originalSEL withSEL:(SEL)swizzledSEL;

@end
