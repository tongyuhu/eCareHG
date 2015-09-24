//
//  ServiceObjectMessage.h
//  eCareHG
//
//  Created by JinYanFeng on 15/9/17.
//  Copyright (c) 2015年 JinYanFeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ServiceObjectMessage : NSObject
@property(nonatomic,copy)NSString *areaStr;
@property(nonatomic,copy)NSString *addressStr;
@property(nonatomic,copy)NSString *nameStr;
@property(nonatomic,copy)NSString *oldStr;
@property(nonatomic,copy)NSString *sexStr;
@property(nonatomic,copy)NSString *fullStr;
@property(nonatomic,copy)NSString *basicStateStr;
@end
