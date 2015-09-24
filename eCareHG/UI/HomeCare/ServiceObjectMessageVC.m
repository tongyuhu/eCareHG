//
//  ServiceObjectMessageVC.m
//  eCareHG
//
//  Created by JinYanFeng on 15/9/16.
//  Copyright (c) 2015年 JinYanFeng. All rights reserved.
//

#import "ServiceObjectMessageVC.h"
#import "ServiceObjectMesCell.h"
#import "AddServiceObjectMesVC.h"
@interface ServiceObjectMessageVC ()

@end

@implementation ServiceObjectMessageVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor =BACKGROUNDCOLOR;
    [self initNavBar];
    [self initTableView];

}
-(void)initNavBar
{
    self.navTitle.text =@"服务对象信息";
    self.rightBtn.hidden =NO;
    [self.rightBtn setTitle:@"新增" forState:UIControlStateNormal];
    [self.rightBtn addTarget:self action:@selector(NavRightBtnClicked) forControlEvents:UIControlEventTouchUpInside];

}
#pragma mark 点击导航条右侧的btn（新增）
-(void)NavRightBtnClicked
{
    AddServiceObjectMesVC *addVC =[[AddServiceObjectMesVC alloc]init];
    [self.navigationController pushViewController:addVC animated:YES];
    
}

#pragma
#pragma mark - 初始化
- (void)initTableView {
    self.myTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, ScreenWidth, ScreenHeight-64) style:UITableViewStyleGrouped];
    self.myTableView.delegate = self;
    self.myTableView.dataSource = self;
    [self.view addSubview:self.myTableView];
    self.myTableView.backgroundColor =[UIColor clearColor];
    self.myTableView.separatorStyle =UITableViewCellSeparatorStyleNone;
}
#pragma mark - TableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 10.01f;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 65;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.01f;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//    return listTableArray.count;
//    ;
    return 1;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *indentifier = @"ServiceObjectMesCell";
    ServiceObjectMesCell *cell = [tableView dequeueReusableCellWithIdentifier:indentifier];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"ServiceObjectMesCell" owner:nil options:nil] objectAtIndex:0];
    }
//    NSDictionary *messageDic = listTableArray[indexPath.row];
//    cell.messageLabel.text = messageDic[@"title"];
//    cell.dateLaebl.text = [messageDic[@"insert_time"] substringToIndex:10];
//    int statue = [messageDic[@"read_status"] intValue];
//    
//    if (statue == 1) {
//        cell.messageImage.image = [UIImage imageNamed:@"message_box_01"];
//    }else{
//        cell.messageImage.image = [UIImage imageNamed:@"message_box_02"];
//    }
//    cell.spline.hidden = NO;
//    if (indexPath.row == listTableArray.count -1) {
//        cell.spline.hidden = YES;
//    }
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.view endEditing:YES];
    [self.myTableView deselectRowAtIndexPath:indexPath animated:YES];
    
    AddServiceObjectMesVC *addVC =[[AddServiceObjectMesVC alloc]init];
    [self.navigationController pushViewController:addVC animated:YES];
    
}

#pragma mark-textFieldMethod
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    return [textField resignFirstResponder];
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
    
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
