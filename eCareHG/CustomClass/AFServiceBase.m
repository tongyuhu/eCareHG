//
//  AFServiceBase.m
//  ChuangHe_IOS
//
//  Created by 郑贵明 on 14-11-14.
//  Copyright (c) 2014年 上海创和汽车服务股份有限公司. All rights reserved.

//#define HOST_REQUEST_ADDRESS @"http://192.168.0.210:90/v2/app/carpark/person_v2/"  //测试接口
#define HOST_REQUEST_ADDRESS @"http://app2.1jia2.cn/carpark/person_v2/"   //正式接口
#import "AFServiceBase.h"
#import "AFHTTPRequestOperation.h"
#import "AFHTTPRequestOperationManager.h"

@implementation AFServiceBase

- (id)init
{
    self = [super init];
    if (self)
    {
        
    }
    return self;
}
-(void)RequestDataParameters:(NSDictionary *)parameters URLstr:(NSString *)url Method:(NSString *)postorget  target:(id)target successBlock:(void(^)(NSDictionary * dic))success failure:(void(^)(NSError * error))failure
{
   
   NSString *postUrl = [NSString stringWithFormat:@"%@%@",HOST_REQUEST_ADDRESS,url];
    NSLog(@"url=%@,parameters=%@",postUrl,parameters);
    
    NSMutableURLRequest *request =[[AFHTTPRequestSerializer serializer] requestWithMethod:postorget URLString:postUrl parameters:parameters error:nil];
    request.timeoutInterval = 30;
    AFHTTPRequestOperation*  httpRequestoperation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    httpRequestoperation.shouldUseCredentialStorage = YES;
    httpRequestoperation.securityPolicy  = [AFSecurityPolicy defaultPolicy];
    [httpRequestoperation start];
    
    [httpRequestoperation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"============ %@",operation.responseString);
        if (success) {
            NSDictionary * requestdataDic=[NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
            success(requestdataDic);
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}
- (void)RequestDataParameters:(NSDictionary *)parameters URLstr:(NSString *)url tag:(long)tag Method:(NSString *)postorget  target:(id)target successBlock:(void(^)(NSDictionary * dic))success failure:(void(^)(NSError * error))failure{
    NSString *postUrl = [NSString stringWithFormat:@"%@%@",HOST_REQUEST_ADDRESS,url];
    NSMutableURLRequest *request =[[AFHTTPRequestSerializer serializer] requestWithMethod:postorget URLString:postUrl parameters:parameters error:nil];
    [request setValue:@"1409110378" forHTTPHeaderField:@"key"];
    [request setValue:@"beb78f46b0de7e1c9cc9849294eda43f" forHTTPHeaderField:@"token"];
    request.timeoutInterval = 30;
    AFHTTPRequestOperation*  httpRequestoperation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    httpRequestoperation.shouldUseCredentialStorage = YES;
    httpRequestoperation.securityPolicy  = [AFSecurityPolicy defaultPolicy];
    [httpRequestoperation start];
    
    [httpRequestoperation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (success) {
            NSDictionary * requestdataDic=[NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
            NSMutableDictionary *dic = [[NSMutableDictionary alloc]initWithDictionary:requestdataDic];
            [dic setValue:[NSString stringWithFormat:@"%ld",tag] forKey:@"tag"];
            NSLog(@"============ %@",operation.responseString);
            success(dic);
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (failure) {
            failure(error);
        }
    }];

}
@end
