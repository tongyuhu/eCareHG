//
//  CHCarInfo.h
//  ChuangHe_app
//
//  Created by yaofang on 14-9-20.
//  Copyright (c) 2014年 chuanghe. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CHCarInfo : NSObject

@property (nonatomic ,copy)NSString *_id;
@property (nonatomic ,copy)NSString *sid;
@property (nonatomic ,copy)NSString *img_url;
@property (nonatomic ,copy)NSString *bid;
@property (nonatomic ,copy)NSString *car_id;
@property (nonatomic ,copy)NSString *transmission;
@property (nonatomic ,copy)NSString *displacement;
@property (nonatomic ,copy)NSString *audit_arerent;
@property (nonatomic ,copy)NSString *start_date;
@property (nonatomic ,copy)NSString *end_date;
@property (nonatomic ,copy)NSString *status;
@property (nonatomic ,copy)NSString *day_rent;
@property (nonatomic ,copy)NSString *gear_case;
@property (nonatomic ,copy)NSString *brand;
@property (nonatomic ,copy)NSString *car_modles;
@property (nonatomic ,copy)NSString *pailiang;
@property (nonatomic ,copy)NSString *is_hire;

@property (nonatomic ,assign)int is_rent;

@end
