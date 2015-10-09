//
//  CareCategaryViewController.m
//  eCareHG
//
//  Created by tongyuhu on 15/10/9.
//  Copyright (c) 2015年 JinYanFeng. All rights reserved.
//

#import "CareCategaryViewController.h"

@interface CareCategaryViewController ()

@end

@implementation CareCategaryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


- (void)initUI
{
    UIScrollView *sv = [[UIScrollView alloc] initWithFrame:CGRectMake(0, NavHeight, ScreenWidth, ScreenHeight-64)];
    [self.view addSubview:sv];
    NSArray *typeArray = @[@"产科助理",@"男科助理",@"妇科助理",@"儿科助理",@"老年助理",@"糖尿病助理",@"肿瘤助理",@"肥胖人群",@"亚健康人群",@"专家咨询"];
    for (int i = 0; i<typeArray.count; i++) {
        
        UIView *contentView = [[UIView alloc] initWithFrame:CGRectMake(0, 10+i*40, ScreenWidth, 40)];
        if (i==typeArray.count-1) {
            contentView.frame = CGRectMake(0, 10+i*40+10, ScreenWidth, 40);
        }
        contentView.tag = 100+i;
        [sv addSubview:contentView];
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(10, 0, 200, 40)];
        label.textAlignment = NSTextAlignmentLeft;
        label.font = [UIFont systemFontOfSize:14];
        label.textColor = [UIColor blackColor];
        [contentView addSubview:label];
        UIImageView *imageview = [[UIImageView alloc] initWithFrame:CGRectMake(ScreenWidth-30, 10, 20, 20)];
        imageview.image = [UIImage imageNamed:@"righticon"];
        
        [contentView addSubview:imageview];
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapView:)];
        [contentView addGestureRecognizer:tap];
        
        
    }
}

- (void)tapView:(UITapGestureRecognizer *)tap
{
    UIView *tapView = tap.view;
    
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
