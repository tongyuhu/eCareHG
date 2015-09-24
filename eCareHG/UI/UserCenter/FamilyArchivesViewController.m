//
//  FamilyArchivesViewController.m
//  eCareHG
//
//  Created by tongyuhu on 15/9/24.
//  Copyright (c) 2015年 JinYanFeng. All rights reserved.
//

#import "FamilyArchivesViewController.h"

@interface FamilyArchivesViewController ()

@end

@implementation FamilyArchivesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (void)initNavBar
{
    self.navTitle.text = @"家庭成员信息";
    [self.rightBtn setTitle:@"新增" forState:UIControlStateNormal];
    self.rightBtn.hidden = NO;
    [self.rightBtn addTarget:self action:@selector(addMember) forControlEvents:UIControlEventTouchUpInside];
}

#pragma mark - 增加成员
- (void)addMember
{
    
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
