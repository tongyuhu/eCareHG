//
//  MyTools.m
//  FarShield
//
//  Created by He Mingshuai on 15-7-6.
//  Copyright (c) 2015年 He Mingshuai. All rights reserved.
//

#import "MyTools.h"

@implementation MyTools


+ (void)fuwenbenLabel:(UILabel *)labell FontNumber:(id)font AndRange:(NSRange)range AndColor:(UIColor *)vaColor
{
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:labell.text];
    //设置字号
    [str addAttribute:NSFontAttributeName value:font range:range];
    //设置文字颜色
    [str addAttribute:NSForegroundColorAttributeName value:vaColor range:range];
    
    labell.attributedText = str;
}

//判断手机号码
+ (BOOL)checkTel:(NSString *)str
{
    //^((13[0-9])|(147)|(15[0-9])|(18[0-9]))\\d{8}$
    NSString *regex = @"^((13[0-9])|(15[^4,\\D])|(18[0,0-9]))\\d{8}$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    BOOL isMatch = [pred evaluateWithObject:str];
    return isMatch;
}

//+ (AttributedLabel *)lable:(AttributedLabel *)alable getBiddingPointWithString:(NSString *)smpStr length:(int)length
//{
//    [alable setText:smpStr];
//    [alable setFont:[UIFont systemFontOfSize:14]];
//    alable.textAlignment =NSTextAlignmentLeft;
//    alable.numberOfLines = 0;
//    [alable setFont:[UIFont systemFontOfSize:15] fromIndex:0 length:length];
//    [alable setColor: Color(0, 138, 211) fromIndex:0 length:length];
//    [alable setColor:Color(153, 153, 153) fromIndex:length length:smpStr.length-length];
//    return alable;
//}
//+ (AttributedLabel *)lable:(AttributedLabel *)alable getBiddingWithString:(NSString *)smpStr length:(int)length
//{
//    alable.text = smpStr;
//    [alable setFont:[UIFont systemFontOfSize:14]];
//    alable.textAlignment =NSTextAlignmentLeft;
//    [alable setColor:Color(153, 153, 153) fromIndex:0 length:4];
//    [alable setColor:NAVIGATIONCOLOR fromIndex:4 length:length];
//    return alable;
//}
//
//+ (AttributedLabel *)lable:(AttributedLabel *)alable getAttributedLabelWithString:(NSString *)smpStr length:(int)length
//{
//    alable.text = smpStr;
//    [alable setFont:[UIFont systemFontOfSize:14]];
//    alable.textAlignment =NSTextAlignmentLeft;
//    [alable setColor:Color(153, 153, 153) fromIndex:0 length:5];
//    [alable setColor:NAVIGATIONCOLOR fromIndex:5 length:length];
//    [alable setColor:Color(153, 153, 153) fromIndex:smpStr.length-3 length:3];
//    return alable;
//}

//  时间戳转时间的方法
+ (NSString *)theDateBecomeTimeStrWithStr:(NSString *)smpStr {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init] ;
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"YYYY-MM-dd HH:mm"]; // ----------设置你想要的格式,hh与HH的区别:分别表示12小时制,24小时制
    
    NSDate* date = [formatter dateFromString:smpStr]; //------------将字符串按formatter转成nsdate
    NSString *timeSp = [NSString stringWithFormat:@"%ld", (long)[date timeIntervalSince1970]];
    NSLog(@"timeSp:%@",timeSp); //时间戳的值
    return timeSp;
}

+ (void)showAlert:(NSString*)alertString
{
    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:alertString delegate:nil cancelButtonTitle:@"确定" otherButtonTitles: nil];
    [alert show];
}
+ (float)checTheStringWithLnteractionContentHeight:(NSString *)theStr font:(float)font
{
    
    CGRect textRect = [theStr boundingRectWithSize:CGSizeMake(ScreenWidth-70, CGFLOAT_MAX)
                                           options:(NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading)
                                        attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:font]}
                                           context:NULL];
    return CGRectGetMaxY(textRect);
    
}

+ (float)checTheStringWithWidth:(NSString *)theStr font:(float)font
{
    
    CGRect textRect = [theStr boundingRectWithSize:CGSizeMake(120, 30)
                                            options:(NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading)
                                         attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:font]}
                                            context:NULL];
    return CGRectGetMaxX(textRect)+15;

}
+ (float)checTheStringWithMessageContentHeight:(NSString *)theStr font:(float)font
{
    
    CGRect textRect = [theStr boundingRectWithSize:CGSizeMake(ScreenWidth-40, CGFLOAT_MAX)
                                           options:(NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading)
                                        attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:font]}
                                           context:NULL];
    return CGRectGetMaxY(textRect);
    
}

+ (float)checTheStringWithHeight:(NSString *)theStr font:(float)font
{
    
    CGRect textRect = [theStr boundingRectWithSize:CGSizeMake(ScreenWidth-20, CGFLOAT_MAX)
                                           options:(NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading)
                                        attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:font]}
                                           context:NULL];
    return CGRectGetMaxY(textRect);
    
}

+ (UIImage *)setImgSizeMethod:(UIImage *)image
{
    CGSize newSize=CGSizeMake(80, 49);
    UIGraphicsBeginImageContext(newSize);
    [image drawInRect:CGRectMake(0,0,newSize.width,newSize.height)];
    UIImage* newImagedown = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImagedown;
}

//等比率缩放
+ (UIImage *)scaleImage:(UIImage *)image toScale:(CGSize)scaleSize
{
    //    UIGraphicsBeginImageContext(CGSizeMake(image.size.width * scaleSize, image.size.height * scaleSize));
    //    [image drawInRect:CGRectMake(0, 0, image.size.width * scaleSize, image.size.height * scaleSize)];
    //    UIImage *scaledImage = UIGraphicsGetImageFromCurrentImageContext(); UIGraphicsEndImageContext();
    UIGraphicsBeginImageContext(scaleSize);
    [image drawInRect:CGRectMake(0, 0, scaleSize.width, scaleSize.height)];
    UIImage *scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return scaledImage;
}
+ (void)hideTabBar:(UITabBarController *) tabbarcontroller
{
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.5];
    
    for(UIView *view in tabbarcontroller.view.subviews)
    {
        if([view isKindOfClass:[UITabBar class]])
        {
            [view setFrame:CGRectMake(view.frame.origin.x, ScreenHeight, view.frame.size.width, view.frame.size.height)];
        }
        else
        {
            [view setFrame:CGRectMake(view.frame.origin.x, view.frame.origin.y, view.frame.size.width, ScreenHeight)];
        }
    }
    
    [UIView commitAnimations];
}

+ (void)showTabBar:(UITabBarController *) tabbarcontroller
{
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.5];
    for(UIView *view in tabbarcontroller.view.subviews)
    {
        NSLog(@"%@", view);
        
        if([view isKindOfClass:[UITabBar class]])
        {
            [view setFrame:CGRectMake(view.frame.origin.x, ScreenHeight-49, view.frame.size.width, view.frame.size.height)];
            
        }
        else
        {
            [view setFrame:CGRectMake(view.frame.origin.x, view.frame.origin.y, view.frame.size.width, ScreenHeight-49)];
        }
    }
    
    [UIView commitAnimations];
}
+ (UIImage *) getImageFromURL:(NSString *)fileURL {
    NSLog(@"执行图片下载函数");
    
    UIImage * result;
    
    NSData * data = [NSData dataWithContentsOfURL:[NSURL URLWithString:fileURL]];
    
    result = [UIImage imageWithData:data];
    return result;
    
}
//剪圆角
+(void)setRoundBtn:(UIButton *)btn
{
        [btn.layer setMasksToBounds:YES];
        [btn.layer setCornerRadius:3.0]; //设置矩圆角半径
}
//设置btn的边框
+(void)setRimBtn:(UIView *)view
{
    view.layer.borderColor = [UIColor orangeColor].CGColor;
    view.layer.borderWidth =0.5;
}
@end
