//
//  UserCenterView.m
//  eCareHG
//
//  Created by tongyuhu on 15/9/22.
//  Copyright (c) 2015年 JinYanFeng. All rights reserved.
//

#import "UserCenterView.h"
#import "UserInformationViewController.h"
#import "SettingViewController.h"
#import "FamilyMemberMesViewController.h"
@implementation UserCenterView
#pragma mark - 编辑用户信息的小图标按钮(没有用到)
- (IBAction)detailBtn:(id)sender {
//    UserInformationViewController *vc = [[UserInformationViewController alloc] init];
//    [self.responder.navigationController pushViewController:vc animated:YES];
}
#pragma mark - 编辑用户信息
- (IBAction)userInforBtn:(id)sender {
    UserInformationViewController *vc = [[UserInformationViewController alloc] init];
    [self.responder.navigationController pushViewController:vc animated:YES];
}
#pragma mark - 家庭档案
- (IBAction)familyArchivesBtn:(id)sender {
    FamilyMemberMesViewController *vc = [[FamilyMemberMesViewController alloc] init];
    [self.responder.navigationController pushViewController:vc animated:YES];
}
#pragma mark - 订单管理
- (IBAction)orderManagerBtn:(id)sender {
}
#pragma mark - 我的积分
- (IBAction)myPointsBtn:(id)sender {
}
#pragma mark - 投诉建议
- (IBAction)adviseBtn:(id)sender {
}
#pragma mark - 关于我们
- (IBAction)aboutUsBtn:(id)sender {
}
#pragma mark - 设置
- (IBAction)settingBtn:(id)sender {
    SettingViewController *vc = [[SettingViewController alloc] init];
    [self.responder.navigationController pushViewController:vc animated:YES];
}

@end
