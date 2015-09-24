//
//  DBNAlertView.h
//  OAConnect
//
//  Created by 李仁兵 on 14-4-28.
//  Copyright (c) 2014年 李仁兵. All rights reserved.
//

#import <Foundation/Foundation.h>
/**
 用于弹出提示框。
 */

@interface DBNAlertView : NSObject
+ (id)sharedDBNAlertView;

/*!
 @function showAlertViewWithString:
 @abstract 提示文字信息
 @param str 提示内容
 */
- (void)showAlertViewWithString:(NSString *)str;


/*!
 @function showAlertViewWithActivityView:
 @abstract activityView
 @param str 提示内容
 */
- (void)showAlertViewWithActivityView:(NSString *)str;

/*!
 @function hidenAlertViewWithActivityView
 @abstract 隐藏提示框
 */
- (void)hidenAlertViewWithActivityView;
@end
