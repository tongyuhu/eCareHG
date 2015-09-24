//
//  SettingViewController.m
//  eCareHG
//
//  Created by tongyuhu on 15/9/24.
//  Copyright (c) 2015年 JinYanFeng. All rights reserved.
//

#import "SettingViewController.h"

@interface SettingViewController ()

@end

@implementation SettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
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
- (IBAction)updateBtn:(id)sender {
    [[DBNAlertView sharedDBNAlertView] showAlertViewWithString:@"恭喜您,现在是最新的版本!"];

}

@end
