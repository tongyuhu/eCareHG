//
//  ServiceNurseDetailViewController.m
//  eCareHG
//
//  Created by JinYanFeng on 15/9/21.
//  Copyright (c) 2015年 JinYanFeng. All rights reserved.
//

#import "ServiceNurseDetailViewController.h"

@interface ServiceNurseDetailViewController ()

@end

@implementation ServiceNurseDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initNavBar];
    [self initScrollView];
    [self.myScrollView bringSubviewToFront:self.headImaView];
    [self.headView.layer setMasksToBounds:YES];
    [self.headView.layer setCornerRadius:5.0];
    [self.otherMesView.layer setMasksToBounds:YES];
    [self.otherMesView.layer setCornerRadius:5.0];
    self.payView.frame =CGRectMake(0, ScreenHeight, ScreenWidth, 0);
    self.payView.backgroundColor =[UIColor whiteColor];
    self.payView.clipsToBounds =YES;
    [self.myScrollView addSubview:self.payView];
}
-(void)initNavBar
{
    self.navTitle.text =@"服务人员详情";
    
}
- (void)initScrollView
{
    self.myScrollView.frame =CGRectMake(0, 64, ScreenWidth, ScreenHeight-64);
    self.myScrollView.backgroundColor =[UIColor clearColor];
    self.myScrollView.delegate = self;
    self.myScrollView.contentSize = CGSizeMake(ScreenWidth, 568-64);
}
#pragma
#pragma mark- 点击微信支付
- (IBAction)WeixinPayBtnClick:(id)sender{
    [UIView animateWithDuration:0.5 animations:^{
        self.payView.backgroundColor =[UIColor whiteColor];
        self.payView.frame =CGRectMake(0, ScreenHeight, ScreenWidth, 0);

        
    }];
}
#pragma
#pragma mark- 点击支付宝支付
- (IBAction)aliPayBtnClick:(id)sender{
    [UIView animateWithDuration:0.5 animations:^{
        self.payView.backgroundColor =[UIColor whiteColor];
        self.payView.frame =CGRectMake(0, ScreenHeight, ScreenWidth, 0);

    }];
}
#pragma
#pragma mark- 点击银行卡支付
- (IBAction)bankCardPayBtnClick:(id)sender{

    [UIView animateWithDuration:0.5 animations:^{
        self.payView.backgroundColor =[UIColor whiteColor];
        self.payView.frame =CGRectMake(0, ScreenHeight, ScreenWidth, 0);

    }];
}
- (IBAction)NOPayBtnClick:(id)sender{
    [UIView animateWithDuration:0.5 animations:^{
        self.payView.backgroundColor =[UIColor whiteColor];
        self.payView.frame =CGRectMake(0, ScreenHeight, ScreenWidth, 0);

    }];

}
#pragma
#pragma mark- 点击确认下单
- (IBAction)submitBtnClick:(id)sender {
    [UIView animateWithDuration:0.5 animations:^{
        self.payView.frame =CGRectMake(0, ScreenHeight -153-64, ScreenWidth, 153);
        self.payView.backgroundColor =[UIColor whiteColor];

    }];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


@end
