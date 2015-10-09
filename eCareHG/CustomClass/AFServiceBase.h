//
//  AFServiceBase.h
//  ChuangHe_IOS
//
//  Created by 郑贵明 on 14-11-14.
//  Copyright (c) 2014年 上海创和汽车服务股份有限公司. All rights reserved.
//

//#import <Foundation/Foundation.h>
//#import <UIKit/UIKit.h>

@interface AFServiceBase : NSObject
/**
 *  封装请求
 */

- (void)RequestDataParameters:(NSDictionary *)parameters URLstr:(NSString *)url Method:(NSString *)postorget  target:(id)target successBlock:(void(^)(NSDictionary * dic))success failure:(void(^)(NSError * error))failure;

//删除图片
- (void)RequestDataParameters:(NSDictionary *)parameters URLstr:(NSString *)url tag:(long)tag Method:(NSString *)postorget  target:(id)target successBlock:(void(^)(NSDictionary * dic))success failure:(void(^)(NSError * error))failure;

@end
