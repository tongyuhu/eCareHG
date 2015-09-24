//
//  UserCenterController.m
//  eCareHG
//
//  Created by tongyuhu on 15/9/23.
//  Copyright (c) 2015年 JinYanFeng. All rights reserved.
//

#import "UserCenterController.h"
#import "UserCenterView.h"
@interface UserCenterController ()

@end

@implementation UserCenterController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initNavBar];
    [self initUserCenterView];

}

- (void)initUserCenterView
{
    UserCenterView *centerView = [[[NSBundle mainBundle] loadNibNamed:@"UserCenterView" owner:nil options:nil]lastObject];
    centerView.responder = self;
    centerView.frame  = CGRectMake(0, NavHeight, ScreenWidth, ScreenHeight);
    centerView.contentScrollView.contentSize = CGSizeMake(ScreenWidth, 667);
    [self.view addSubview:centerView];
}

- (void)initNavBar
{
    self.navTitle.text = @"个人中心";
    
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
