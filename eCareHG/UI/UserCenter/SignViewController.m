//
//  SignViewController.m
//  eCareHG
//
//  Created by tongyuhu on 15/9/22.
//  Copyright (c) 2015年 JinYanFeng. All rights reserved.
//

#import "SignViewController.h"

@interface SignViewController ()

@end

@implementation SignViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initNavBar];
}

- (void)initNavBar
{
    self.navTitle.text = @"登陆";
    self.rightBtn.hidden = NO;
    [self.rightBtn setTitle:@"注册" forState:UIControlStateNormal];
    [self.rightBtn addTarget:self action:@selector(signUp) forControlEvents:UIControlEventTouchUpInside];
    
}
#pragma mark - 忘记密码
- (IBAction)forgetPassword:(id)sender {
}
#pragma mark - 登陆
- (IBAction)signInBtn:(id)sender {
    if (![MyTools checkTel:self.phoneNum.text]) {
        [[DBNAlertView sharedDBNAlertView] showAlertViewWithString:@"手机号码格式不正确"];
        return;
    }
}

#pragma mark - 注册跳转
- (void)signUp
{
    
}

@end
