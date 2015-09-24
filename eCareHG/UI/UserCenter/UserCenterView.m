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
@implementation UserCenterView

- (IBAction)detailBtn:(id)sender {
//    UserInformationViewController *vc = [[UserInformationViewController alloc] init];
//    [self.responder.navigationController pushViewController:vc animated:YES];
}
- (IBAction)userInforBtn:(id)sender {
    UserInformationViewController *vc = [[UserInformationViewController alloc] init];
    [self.responder.navigationController pushViewController:vc animated:YES];
}

- (IBAction)familyArchivesBtn:(id)sender {
}

- (IBAction)orderManagerBtn:(id)sender {
}

- (IBAction)myPointsBtn:(id)sender {
}

- (IBAction)adviseBtn:(id)sender {
}

- (IBAction)aboutUsBtn:(id)sender {
}

- (IBAction)settingBtn:(id)sender {
    SettingViewController *vc = [[SettingViewController alloc] init];
    [self.responder.navigationController pushViewController:vc animated:YES];
}

@end
