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


@end
