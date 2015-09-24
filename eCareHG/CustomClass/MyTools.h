//
//  MyTools.h
//  FarShield
//
//  Created by He Mingshuai on 15-7-6.
//  Copyright (c) 2015年 He Mingshuai. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface MyTools : NSObject

+ (void)fuwenbenLabel:(UILabel *)labell FontNumber:(id)font AndRange:(NSRange)range AndColor:(UIColor *)vaColor;
//缩小为图片的一半
+ (UIImage *)setImgSizeMethod:(UIImage *)image;
+ (UIImage *)scaleImage:(UIImage *)image toScale:(CGSize)scaleSize;
+ (void)hideTabBar:(UITabBarController *) tabbarcontroller;
+ (void)showTabBar:(UITabBarController *) tabbarcontroller;
+ (float)checTheStringWithWidth:(NSString *)theStr font:(float)font;
+ (float)checTheStringWithHeight:(NSString *)theStr font:(float)font;
+ (float)checTheStringWithLnteractionContentHeight:(NSString *)theStr font:(float)font;
+ (float)checTheStringWithMessageContentHeight:(NSString *)theStr font:(float)font;
+ (void)showAlert:(NSString*)alertString;
+ (BOOL)checkTel:(NSString *)str;

+ (NSString *)theDateBecomeTimeStrWithStr:(NSString *)smpStr;
+ (UIImage *) getImageFromURL:(NSString *)fileURL;
+(void)setRoundBtn:(UIButton *)btn;

//设置btn的边框
+(void)setRimBtn:(UIButton *)btn;

//+ (AttributedLabel *)lable:(AttributedLabel *)alable getBiddingPointWithString:(NSString *)smpStr length:(int)length;
@end
