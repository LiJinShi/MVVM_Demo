//
//  NSArray+Unicode.m
//  MaLi
//
//  Created by lijinshi on 2017/4/1.
//  Copyright © 2017年 lijinshi. All rights reserved.
//

#import "NSObject+Unicode.h"

@implementation NSArray (Unicode)

+ (void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self swizzleSEL:@selector(description)
                 withSEL:@selector(replaceDescription)];
        
        [self swizzleSEL:@selector(descriptionWithLocale:)
                 withSEL:@selector(replaceDescriptionWithLocale:)];
        
        [self swizzleSEL:@selector(descriptionWithLocale:indent:)
                 withSEL:@selector(replaceDescriptionWithLocale:indent:)];
    });
}

- (NSString *)replaceDescription
{
    return [NSObject stringByReplaceUnicode:[self replaceDescription]];
}

- (NSString *)replaceDescriptionWithLocale:(nullable id)locale
{
    return [NSObject stringByReplaceUnicode:[self replaceDescriptionWithLocale:locale]];
}

- (NSString *)replaceDescriptionWithLocale:(nullable id)locale indent:(NSUInteger)level
{
    return [NSObject stringByReplaceUnicode:[self replaceDescriptionWithLocale:locale indent:level]];
}

@end
