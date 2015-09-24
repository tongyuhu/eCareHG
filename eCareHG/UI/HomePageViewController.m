//
//  HomeViewController.m
//  eCareHG
//
//  Created by JinYanFeng on 15/9/16.
//  Copyright (c) 2015年 JinYanFeng. All rights reserved.
//

#import "HomePageViewController.h"
#import "HomeCareViewController.h"
#import "HomeNurseViewController.h"
#import "SignViewController.h"
//#import "UserCenterView.h"
#import "UserCenterController.h"
@interface HomePageViewController ()

@end

@implementation HomePageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor =BACKGROUNDCOLOR;
    [self initNavBar];
    [self initScrollView];

}
-(void)initNavBar
{
    self.navTitle.text =@"e护通";
    [self.LeftBtn setImage:[UIImage imageNamed:@"touxiang"] forState:0];
    [self.LeftBtn addTarget:self action:@selector(userCenterBtn) forControlEvents:UIControlEventTouchUpInside];
    self.rightBtn.hidden =NO;
    [self.rightBtn setTitle:@"上海" forState:UIControlStateNormal];
}

- (void)initScrollView
{
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.myScrollView.frame =CGRectMake(0, 64, ScreenWidth, ScreenHeight);
    self.myScrollView.delegate = self;
    self.myScrollView.contentSize = CGSizeMake(ScreenWidth, 568);
    [self.view addSubview:self.myScrollView];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma
#pragma mark - 点击护理咨询室
- (IBAction)chatRoomBtnClick:(id)sender {

}
#pragma
#pragma mark - 点击居家专户
- (IBAction)homeCareBtnClick:(id)sender {
    HomeCareViewController *homeCareVC =[[HomeCareViewController alloc]initWithNibName:@"HomeCareViewController" bundle:nil];
    [self.navigationController pushViewController:homeCareVC animated:YES];
    
}
#pragma
#pragma mark - 点击家庭护理顾问
- (IBAction)homeNurseBtnClick:(id)sender {

    HomeNurseViewController *homeCareVC =[[HomeNurseViewController alloc]init];
    [self.navigationController pushViewController:homeCareVC animated:YES];

}

#pragma mark - 点击用户中心
- (void)userCenterBtn
{
    BOOL isLogin = YES;
    if (isLogin) {
        //左侧视图模式
        //        CGRect frame = _userView.frame;
        //        [UIView animateWithDuration:0.5 animations:^{
        //            _userView.frame = CGRectMake(0, 0, frame.size.width, frame.size.height);
        //        }];
        
        
        UserCenterController  *userCVC = [[UserCenterController alloc] init];
        [self.navigationController pushViewController:userCVC animated:YES];
        
        
    }
    else
    {
        SignViewController *signInView = [[SignViewController alloc] init];
        [self.navigationController pushViewController:signInView animated:YES];
        
        
    }
}

@end
