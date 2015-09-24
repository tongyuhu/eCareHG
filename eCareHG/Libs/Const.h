//
//  Const.h
//  eCareHG
//
//  Created by JinYanFeng on 15/9/16.
//  Copyright (c) 2015年 JinYanFeng. All rights reserved.
//

#ifndef eCareHG_Const_h
#define eCareHG_Const_h
#pragma mark - 晋艳峰的宏 -

//屏幕高度和宽度
#define ScreenHeight [UIScreen mainScreen].bounds.size.height
#define ScreenWidth  [UIScreen mainScreen].bounds.size.width
//是否是ios7系统

#define iPhone6plus ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? (CGSizeEqualToSize(CGSizeMake(1125, 2001), [[UIScreen mainScreen] currentMode].size) || CGSizeEqualToSize(CGSizeMake(1242, 2208), [[UIScreen mainScreen] currentMode].size)) : NO)
#define IOS7  [[[UIDevice currentDevice]systemVersion] intValue]<7?NO:YES
#define IOSX  [[[UIDevice currentDevice]systemVersion] intValue]
//自定义navigationbar的高度值
#define NavHeight  ([[[UIDevice currentDevice]systemVersion] intValue]<7?44.0:64.0)
////屏幕开始的Y值
//#define ScreenY  [[[UIDevice currentDevice]systemVersion] intValue]<7?44:64
//除去navigationbar和tabbar之外的屏幕高度,ios6减去头44和20的状态栏
#define MiddleHeight [[[UIDevice currentDevice]systemVersion] intValue]<7?([UIScreen mainScreen].bounds.size.height - 64.0):([UIScreen mainScreen].bounds.size.height-44.0)

#pragma mark - 颜色处理 -
#define Color(r,g,b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1.0]
//导航条的颜色
//#define NAVIGATIONCOLOR [UIColor colorWithRed:250.0/255.0 green:0.0/255.0 blue:9.0/255.0 alpha:1.0]
#define PURPLE [UIColor colorWithRed:141.0/255.0 green:102.0/255.0 blue:216.0/255.0 alpha:1.0]
#define BACKGROUNDCOLOR [UIColor colorWithRed:235.0/255.0 green:236.0/255.0 blue:240.0/255.0 alpha:1.0]
#define BLACK [UIColor colorWithRed:51.0/255.0 green:51.0/255.0 blue:51.0/255.0 alpha:1.0]
#define TEXTBLACK [UIColor colorWithHexString:@"333333"]
#define TEXTGRAY [UIColor colorWithHexString:@"999999"]
#define SPLINEGRAY [UIColor colorWithHexString:@"8b8b8b"]
#define SPLINELIGHTGRAY [UIColor colorWithHexString:@"eaeaea"]


#define RGBCOLOR(R,G,B) [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:1]
#define RGBACOLOR(R,G,B,A) [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:A]

#define kDarkGrayColor       RGBCOLOR(51, 51, 51)
#define kGrayColor           RGBCOLOR(153, 153, 153)
#define kLightGrayColor      RGBCOLOR(185, 185, 185)

//图片处理
#define NORMALIMG(UITabBarItem) [UITabBarItem imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]
#define IMG_NAME(img_name) [UIImage imageNamed:img_name]
#define UITabBarItemType(UITabBarItem) [UITabBarItem setImageInsets:UIEdgeInsetsMake(6.0, 0.0, -6.0, 0.0)]
#pragma mark - 本地文件存储路径 -
#define DOCUMENT_CACHE [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) objectAtIndex:0]

#define MESSAGE(title,msg) [[[UIAlertView alloc] initWithTitle:title message:msg delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil] show]

#pragma mark - 判断数值类型 -
#define isDictionary(x) [(x) isKindOfClass:[NSDictionary class]]
#define isArray(x) [(x) isKindOfClass:[NSArray class]]
#define STRING(str)   [NSString stringWithFormat:@"%@",str];
#define ListString(str)   [NSString stringWithFormat:@"（%@）",str];

#pragma mark - 新 -
#define NULL_STR(str) (str == nil || (NSNull *)str == [NSNull null] || str.length == 0)

#define USERNAME  [[NSUserDefaults standardUserDefaults] objectForKey:@"userName"];
#define MID [[NSUserDefaults standardUserDefaults] objectForKey:@"mid"]
#define UID [[NSUserDefaults standardUserDefaults] objectForKey:@"uid"]

//测试接口
#define MAINURL @"http://www.yuandunkeji.com/"


#endif
