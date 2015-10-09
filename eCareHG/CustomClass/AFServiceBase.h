//
//  AFServiceBase.h
//  ChuangHe_IOS
//
//  Created by jinyanfeng on 14-11-15.
//  Copyright (c) 2015年 上海创和汽车服务股份有限公司. All rights reserved.
//

//#import <Foundation/Foundation.h>
//#import <UIKit/UIKit.h>

@interface AFServiceBase : NSObject
/**
 *  封装请求
 */

- (void)RequestDataParameters:(NSDictionary *)parameters URLstr:(NSString *)url Method:(NSString *)postorget  target:(id)target successBlock:(void(^)(NSDictionary * dic))success failure:(void(^)(NSError * error))failure;

////删除图片
//- (void)RequestDataParameters:(NSDictionary *)parameters URLstr:(NSString *)url tag:(long)tag Method:(NSString *)postorget  target:(id)target successBlock:(void(^)(NSDictionary * dic))success failure:(void(^)(NSError * error))failure;

@end
