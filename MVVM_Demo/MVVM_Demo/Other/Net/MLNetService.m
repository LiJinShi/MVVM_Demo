//
//  MLNetService.m
//  MVVM_Demo
//
//  Created by lijinshi on 2017/10/12.
//  Copyright © 2017年 lijinshi. All rights reserved.
//

#import "MLNetService.h"
#import "MLHTTPSessionManager.h"

@implementation MLNetService

+ (void)requestType:(RequestType)type
                URL:(NSString *)url
               dict:(NSDictionary *)dict
             sBlock:(SuccessBlock)sBlcok
             fBlcok:(FailureBlock)fBlock
{
    MLHTTPSessionManager *manager = [MLHTTPSessionManager manager];
    if (type == RequestTypeGet) {
        [manager GET:url parameters:dict progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            SLog(@"responseObject = %@", responseObject);
            if (sBlcok) {
                sBlcok(responseObject);
            }
            
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            SLog(@"%@", error);
            if (fBlock) {
                fBlock(error);
            }
        }];
        
    } else if (type == RequestTypePost) {
        [manager POST:url parameters:dict progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            
            if (sBlcok) {
                sBlcok(responseObject);
            }
            
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            
            if (fBlock) {
                fBlock(error);
            }
        }];
        
    }
}

@end
