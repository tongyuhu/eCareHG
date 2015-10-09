//
//  CHPassValueDelegate.h
//  ChuangHe_app
//
//  Created by yaofang on 14-9-5.
//  Copyright (c) 2014年 chuanghe. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol CHPassValueDelegate <NSObject>

@optional

//传Car_id  用户是否有车
- (void)passValue:(NSString*)car_id;

//添加车辆信息 返回选择的id  选中的string 和 标示index
- (void)passValue:(NSString *)selectId selectStr:(NSString *)textStr indexId:(int)index;

//用户车辆的图片
- (void)passImage:(UIImage*)car_image;

//传时间
- (void)passDate:(NSString*)getDateStr backDate:(NSString*)backDateStr;

//传获得车年月日格式
- (void)passGetDate:(NSString*)getDateStr;
- (void)passBackDate:(NSString*)BackDateStr;

//传选中门店的id 和 name
- (void)passStoreId:(NSString*)storeId storeName:(NSString*)storeName;
//传选择的城市
- (void)passCityValue:(NSString*)city city_id:(NSString*)city_id;
//传高级筛选选中车辆的出租价格
- (void)passCarPrice:(NSString *)_price_s price_b:(NSString *)_price_b;

//传取车方式
- (void)passValue:(NSString*)typeId typeStr:(NSString *)typeStr;

//传可租可售
- (void)pass_isRent:(NSString*)isRent isSale:(NSString *)isSale isImpawn:(NSString*)isImpawn;

//传高级筛选的结果
- (void)passJsonValue:(NSDictionary*)str_code;


//传值到首页 再次进入我要租车
- (void)passType:(NSString*)type;

//传值到车辆详情 进入租赁订单
- (void)passRentType:(NSString*)type id_card:(NSString*)id_card pic_j:(NSString*)pic_j z_notice:(NSString*)z_notice;

//汽车美容选服务
- (void)passAutoBeauty_type:(long)typeValue;

//汽车美容判断是否登录
- (void)passAutoBeautyMenu:(int)type;

//我要租车 登录之后刷新详情
- (void)passBoolValue:(int)type;



@end
