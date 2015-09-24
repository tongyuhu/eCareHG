//
//  BaseNavViewController.m
//  eCareHG
//
//  Created by JinYanFeng on 15/9/16.
//  Copyright (c) 2015年 JinYanFeng. All rights reserved.
//

#import "BaseNavViewController.h"

@interface BaseNavViewController ()

@end

@implementation BaseNavViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets =NO;
    self.view.backgroundColor = BACKGROUNDCOLOR;
    self.navView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 64)];
    self.navView.backgroundColor =PURPLE;
    [self.view addSubview:self.navView];
    
    
    self.LeftBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    [self.LeftBtn setImage:[UIImage imageNamed:@"biaotijiantou"] forState:UIControlStateNormal];
    [self.LeftBtn addTarget:self action:@selector(popClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.LeftBtn setFrame:CGRectMake(15, 30, 24, 24)];
    [self.navView addSubview:self.LeftBtn];
    
    self.rightBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    [self.rightBtn setTitle:@"上海" forState:UIControlStateNormal];
    self.rightBtn.titleLabel.font = [UIFont systemFontOfSize:13];
//    [self.rightBtn addTarget:self action:@selector(homeClicked:) forControlEvents:UIControlEventTouchUpInside];
    self.rightBtn.hidden = YES;
    self.rightBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    [self.rightBtn setFrame:CGRectMake(ScreenWidth - 115, 23, 100, 40)];
    [self.navView addSubview:self.rightBtn];
    
    self.navTitle=[[UILabel alloc]initWithFrame:CGRectMake(44, 20, ScreenWidth-88, 44)];
    self.navTitle.textColor = [UIColor whiteColor];
    self.navTitle.backgroundColor=[UIColor clearColor];
    self.navTitle.textAlignment=NSTextAlignmentCenter;
    self.navTitle.font=[UIFont boldSystemFontOfSize:16];
    [self.navView addSubview:self.navTitle];
    
}
#pragma
#pragma mark - 返回上级目录
- (void)popClicked:(UIButton*)btn{
    [self.navigationController popViewControllerAnimated:YES];
}
#pragma
#pragma mark - 回到主页
- (void)homeClicked:(UIButton*)btn{
    [self.navigationController popToRootViewControllerAnimated:YES];
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
