//
//  QuickOrderViewController.m
//  eCareHG
//
//  Created by JinYanFeng on 15/9/18.
//  Copyright (c) 2015年 JinYanFeng. All rights reserved.
//

#import "QuickOrderViewController.h"
#import "OrderNurseCell.h"
#import "ServiceNurseDetailViewController.h"
@interface QuickOrderViewController ()

@end

@implementation QuickOrderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor =BACKGROUNDCOLOR;
    [self initNavBar];
}
-(void)initNavBar
{
    self.navTitle.text =@"服务对象信息";
    self.rightBtn.hidden =NO;
    [self.rightBtn.imageView setContentMode:UIViewContentModeScaleAspectFit];
    [self.rightBtn setImage:[UIImage imageNamed:@"other_icon"] forState:0];
    [self.rightBtn setTitle:@"" forState:0];
    [self.rightBtn setImageEdgeInsets:UIEdgeInsetsMake(4, 78, 4, 0)];
//    [self.rightBtn addTarget:self action:@selector(NavRightBtnClicked) forControlEvents:UIControlEventTouchUpInside];
    
}
#pragma
#pragma mark- UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//    return listTableArray.count;
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellId = @"OrderNurseCell";
    OrderNurseCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell == nil) {
        NSArray *nib = [[NSBundle mainBundle]loadNibNamed:cellId owner:self options:nil];
        cell = [nib objectAtIndex:0];
//        CGRect rect =cell.spline.frame;
//        rect.size.height =0.1;
//        cell.spline.frame =rect;
    }
    if (indexPath.row ==1) {
        cell.spline.hidden =YES;
    }
       return cell;
}

#pragma
#pragma mark- UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 72.0;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 40.01;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.01;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *headView =[[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 30)];
    headView.backgroundColor =[UIColor whiteColor];
    UILabel *lab1 =[[UILabel alloc]initWithFrame:CGRectMake(10, 10,100, 20)];
    lab1.font =[UIFont systemFontOfSize:13];
    lab1.textColor =TEXTBLACK;
    lab1.text =@"接单的服务人员";
    lab1.textAlignment =NSTextAlignmentLeft;
    [headView addSubview:lab1];
    
    UILabel *lab2 =[[UILabel alloc]initWithFrame:CGRectMake(ScreenWidth -90, 10, 80, 20)];
    lab2.font =[UIFont systemFontOfSize:12];
    lab2.textColor =[UIColor redColor];
    lab2.text =@"等待接单中";
    lab2.textAlignment =NSTextAlignmentRight;
    [headView addSubview:lab2];
    
    UILabel *line =[[UILabel alloc]initWithFrame:CGRectMake(0, 38, ScreenWidth, 0.5)];
    line.backgroundColor =SPLINEGRAY;
    [headView addSubview:line];
    return headView;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.myTableView deselectRowAtIndexPath:indexPath animated:YES];
    [self.view endEditing:YES];
    ServiceNurseDetailViewController *serVC =[[ServiceNurseDetailViewController alloc]init];
    [self.navigationController pushViewController:serVC animated:YES];
    
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
