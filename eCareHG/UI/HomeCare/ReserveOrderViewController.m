//
//  ReserveOrderViewController.m
//  eCareHG
//
//  Created by JinYanFeng on 15/9/21.
//  Copyright (c) 2015年 JinYanFeng. All rights reserved.
//

#import "ReserveOrderViewController.h"
#import "OrderNurseCell.h"
#import "ServiceNurseDetailViewController.h"
@interface ReserveOrderViewController ()
{
    UITableView *headTable;
    NSArray *headTableArr;
}
@end

@implementation ReserveOrderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor =BACKGROUNDCOLOR;
    [self initNavBar];
    [self initHeadTableView];
    
    headTableArr =[[NSArray alloc]initWithObjects:@"不限",@"25元－40元/半小时",@"41元－60元/半小时",@"61元－80元/半小时",@"81元－100元/半小时",@"100元以上", nil];
    
    
}
-(void)initNavBar
{
    self.navTitle.text =@"居家专护";
    
}
-(void)initHeadTableView
{
    headTable =[[UITableView alloc]init];
    headTable.frame =CGRectMake(0, 95, ScreenWidth, 0);
    headTable.delegate =self;
    headTable.dataSource =self;
    [self.view addSubview:headTable];

}
#pragma
#pragma mark- 点击头部五个btn
-(IBAction)headBtnClick:(id)sender
{
    [UIView animateWithDuration:0.5 animations:^{
        headTable.frame =CGRectMake(0, 95, ScreenWidth, 200);

    }];

}
#pragma
#pragma mark- UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    //    return listTableArray.count;
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (tableView ==headTable) {
        return headTableArr.count;
    }
    return 2;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UILabel *lab =nil;
    if (tableView ==self.myTableView) {
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
    else
    {
         static NSString *identifier = @"MyCell";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            
            lab  =[[UILabel alloc]init];
            lab.frame =CGRectMake(20, 5, 200, 20);
            lab.font =[UIFont systemFontOfSize:13];
            lab.textColor =TEXTBLACK;
            [cell.contentView addSubview:lab];
        }
        
        lab.text =headTableArr[indexPath.row];
        return cell;

    
    }
   }

#pragma
#pragma mark- UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView ==self.myTableView) {
        return 72.0;
    }
    return 30.0;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.01;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.01;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.myTableView deselectRowAtIndexPath:indexPath animated:YES];
    [self.view endEditing:YES];
    if (tableView ==headTable) {
        [UIView animateWithDuration:0.5 animations:^{
            headTable.frame =CGRectMake(0, 95, ScreenWidth, 0);
            
        }];
    }
    else
    {
        ServiceNurseDetailViewController *serVC =[[ServiceNurseDetailViewController alloc]init];
        [self.navigationController pushViewController:serVC animated:YES];
    
    }
    
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
