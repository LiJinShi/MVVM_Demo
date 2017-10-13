//
//  MLHTTPSessionManager.m
//  MaLi
//
//  Created by lijinshi on 2017/3/22.
//  Copyright © 2017年 lijinshi. All rights reserved.
//

#import "MLHTTPSessionManager.h"

@implementation MLHTTPSessionManager

+ (instancetype)manager
{
    return [[self alloc] initWithBaseURL:nil];
}

- (instancetype)init
{
    return [self initWithBaseURL:nil];
}

- (instancetype)initWithBaseURL:(NSURL *)url
{
    self = [super initWithBaseURL:url];
    if (self) {
        [self setupHttpHeader];
        [self setupResponse];
    }
    return self;
}

// 设置响应信息
- (void)setupResponse
{
    self.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/html",nil];
}

// 设置一些请求头信息
- (void)setupHttpHeader
{
    self.requestSerializer = [AFHTTPRequestSerializer serializer];
    self.requestSerializer.timeoutInterval = 20;
    
}

@end
