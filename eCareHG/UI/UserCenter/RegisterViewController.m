//
//  RegisterViewController.m
//  eCareHG
//
//  Created by tongyuhu on 15/10/8.
//  Copyright (c) 2015年 JinYanFeng. All rights reserved.
//

#import "RegisterViewController.h"
#import "RegisterViewController2.h"
@interface RegisterViewController ()

@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self initNav];
}

- (void)initNav
{
    self.navTitle.text = @"注册";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)nextStepBtn:(id)sender {
    RegisterViewController2 *r2 = [[RegisterViewController2 alloc] init];
    [self.navigationController pushViewController:r2 animated:YES];
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
