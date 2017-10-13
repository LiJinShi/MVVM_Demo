//
//  MLNetService.h
//  MVVM_Demo
//
//  Created by lijinshi on 2017/10/12.
//  Copyright © 2017年 lijinshi. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, RequestType) {
    RequestTypeGet = 1,
    RequestTypePost = 2
};

typedef void(^SuccessBlock)(id result);
typedef void(^FailureBlock)(NSError *error);

@interface MLNetService : NSObject

+ (void)requestType:(RequestType)type URL:(NSString *)url
               dict:(NSDictionary *)dict
             sBlock:(SuccessBlock)sBlcok
             fBlcok:(FailureBlock)fBlock;

@end
