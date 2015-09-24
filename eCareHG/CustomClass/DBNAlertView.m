//
//  DBNAlertView.m
//  OAConnect
//
//  Created by 李仁兵 on 14-4-28.
//  Copyright (c) 2014年 李仁兵. All rights reserved.
//

#import "DBNAlertView.h"
#import "MBProgressHUD.h"

static DBNAlertView * dbnAlertView;
static dispatch_once_t onceToken;
UIWindow * window;

@interface DBNAlertView ()
{
    MBProgressHUD * _dbnAlertHud;
}

@end


@implementation DBNAlertView
+ (id)sharedDBNAlertView
{
    dispatch_once(&onceToken,^{
        dbnAlertView = [[DBNAlertView alloc] init];
    });
    return dbnAlertView;
}

- (id)init
{
    if (self = [super init]) {
        window = [[UIApplication sharedApplication] keyWindow];
        _dbnAlertHud = [[MBProgressHUD alloc] init];
        [window addSubview:_dbnAlertHud];
    }
    return self;
}

- (void)show
{
    [_dbnAlertHud show:YES];
    [_dbnAlertHud hide:YES afterDelay:0.5f];
}

-(void)showAlertViewWithString:(NSString *)str
{
    [[[UIApplication sharedApplication] keyWindow] addSubview:_dbnAlertHud];
    _dbnAlertHud.mode = MBProgressHUDModeText;
    _dbnAlertHud.labelText = str;
    [self show];
}

- (void)showAlertViewWithActivityView:(NSString *)str
{
    [[[UIApplication sharedApplication] keyWindow] addSubview:_dbnAlertHud];
    _dbnAlertHud.mode = MBProgressHUDModeIndeterminate;
    _dbnAlertHud.labelText = str;
    [_dbnAlertHud show:YES];
}
- (void)hidenAlertViewWithActivityView
{
    [_dbnAlertHud hide:YES];
    [_dbnAlertHud removeFromSuperview];
}
@end
