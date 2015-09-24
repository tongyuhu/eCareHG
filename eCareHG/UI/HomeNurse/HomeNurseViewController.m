//
//  HomeNurseViewController.m
//  eCareHG
//
//  Created by JinYanFeng on 15/9/23.
//  Copyright (c) 2015年 JinYanFeng. All rights reserved.
//

#import "HomeNurseViewController.h"
#import "FamilyMemberMesViewController.h"
#import "QuickOrderViewController.h"
#import "ServiceTimeViewController.h"
#import "ReserveOrderViewController.h"
@interface HomeNurseViewController ()
{
    UIButton *sexOldBtn;
    NSInteger sexBtnTag;
    NSInteger oldBtnTag;
    NSInteger priceBtnTag;
    NSInteger titleBtnTag;
    NSInteger workYearBtnTag;

    NSMutableArray *selContentArr;
    NSMutableArray *selArr;
}
@end

@implementation HomeNurseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor =[UIColor whiteColor];
    [self initNavBar];
    [self initScrollView];
    [self initOriginSelectBtn];
    
    self.selectBackView.frame =CGRectMake(0, ScreenHeight, ScreenWidth, 350);
    self.selectBackView.hidden =YES;
    selContentArr =[[NSMutableArray alloc]initWithObjects:@"1",@"1",@"1",@"1",@"1", nil];
    selArr =[[NSMutableArray alloc]initWithCapacity:0];
}
-(void)initNavBar
{
    self.navTitle.text =@"家庭护理顾问";
    self.rightBtn.hidden =NO;
    [self.rightBtn setTitle:@"服务说明" forState:UIControlStateNormal];
    
}
- (void)initScrollView
{
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.myScrollView.frame =CGRectMake(0, 64, ScreenWidth, ScreenHeight+20);
    self.myScrollView.backgroundColor =[UIColor clearColor];
    self.myScrollView.delegate = self;
    self.myScrollView.contentSize = CGSizeMake(ScreenWidth, 568);
    self.bottomView.frame =CGRectMake(0, ScreenHeight -120, ScreenWidth, 60);
    
}
- (void)initOriginSelectBtn
{
    sexBtnTag =10;
    UIButton *originSexBtn =(UIButton *)[self.view viewWithTag:10];
    originSexBtn.backgroundColor =PURPLE;
    
    oldBtnTag =20;
    UIButton *originOldBtn =(UIButton *)[self.view viewWithTag:20];
    originOldBtn.backgroundColor =PURPLE;
    
    titleBtnTag =40;
    UIButton *titleBtn =(UIButton *)[self.view viewWithTag:40];
    titleBtn.backgroundColor =PURPLE;
    
    workYearBtnTag =50;
    UIButton *workYearBtn =(UIButton *)[self.view viewWithTag:50];
    workYearBtn.backgroundColor =PURPLE;
    
    
}
- (IBAction)serviceObjBtnClick:(id)sender
{
    FamilyMemberMesViewController *serVC =[[FamilyMemberMesViewController alloc]init];
    [self.navigationController pushViewController:serVC animated:YES];
    
}
#pragma mark-点击服务时间
- (IBAction)serviceTimeBtnClick:(id)sender
{
    ServiceTimeViewController *serVC =[[ServiceTimeViewController alloc]init];
    [self.navigationController pushViewController:serVC animated:YES];
    
}
#pragma mark-点击segment
- (IBAction)segmentChange:(UISegmentedControl *)sender {
    if (sender.selectedSegmentIndex ==0) {
        QuickOrderViewController *quickVC =[[QuickOrderViewController alloc]init];
        [self.navigationController pushViewController:quickVC animated:YES];
    }
    else
    {
        ReserveOrderViewController *resVC =[[ReserveOrderViewController alloc]init];
        [self.navigationController pushViewController:resVC animated:YES];
        
        
    }
}
#pragma mark-点击专户人员筛选
- (IBAction)selPersonBtnClick:(id)sender
{
    
    [UIView animateWithDuration:0.5 animations:^{
        self.selectBackView.hidden =NO;
        self.selectBackView.frame =CGRectMake(0, ScreenHeight -350-64, ScreenWidth, 350);
    }];
    
    
}
#pragma mark-专户人员筛选 View
#pragma mark-取消
- (IBAction)cancelBtnClick:(id)sender{
    [UIView animateWithDuration:0.5 animations:^{
        self.selectBackView.frame =CGRectMake(0, ScreenHeight, ScreenWidth, 350);
    } completion:^(BOOL finished) {
        self.selectBackView.hidden =YES;
        
    }];
    
}
#pragma mark-确定
- (IBAction)sureBtnClick:(id)sender{
    [UIView animateWithDuration:0.5 animations:^{
        self.selectBackView.frame =CGRectMake(0, ScreenHeight, ScreenWidth, 350);
    } completion:^(BOOL finished) {
        self.selectBackView.hidden =YES;
        
    }];
    
    [selArr removeAllObjects];
    [selContentArr enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        if (![obj isEqualToString:@"1"]) {
            
            [selArr addObject:obj];
            
        }
    }];
    NSString *str =[selArr componentsJoinedByString:@","];
    self.selectNurseLab.text =str;
    
    
}
#pragma mark-性别
- (IBAction)sexBtnClick:(UIButton *)sender
{
    
    if (sexBtnTag !=sender.tag) {
        [selContentArr replaceObjectAtIndex:0 withObject:@"性别"];
        sender.backgroundColor =PURPLE;
        UIButton *oldBtn =(UIButton *)[self.view viewWithTag:sexBtnTag];
        oldBtn.backgroundColor =Color(255, 255, 255);
        sexBtnTag =sender.tag;
    }
    else
        return;
    
    
}
#pragma mark-年龄
- (IBAction)oldBtnClick:(RoundBtn *)sender
{
    if (oldBtnTag !=sender.tag) {
        [selContentArr replaceObjectAtIndex:1 withObject:@"年龄"];
        sender.backgroundColor =PURPLE;
        UIButton *oldBtn =(RoundBtn *)[self.view viewWithTag:oldBtnTag];
        oldBtn.backgroundColor =Color(255, 255, 255);
        oldBtnTag =sender.tag;
    }
    else
        return;
    
    
    
}
- (IBAction)priceBtnClick:(UIButton *)sender{
    [selContentArr replaceObjectAtIndex:2 withObject:@"报价"];
    
    
}
- (IBAction)titleBtnClick:(UIButton *)sender{
    if (titleBtnTag !=sender.tag) {
        [selContentArr replaceObjectAtIndex:3 withObject:@"职称"];
        sender.backgroundColor =PURPLE;
        UIButton *oldBtn =(RoundBtn *)[self.view viewWithTag:titleBtnTag];
        oldBtn.backgroundColor =Color(255, 255, 255);
        oldBtnTag =sender.tag;
    }
    else
        return;
    
}
- (IBAction)workYearBtnClick:(UIButton *)sender{
    if (workYearBtnTag !=sender.tag) {
        [selContentArr replaceObjectAtIndex:4 withObject:@"工作年限"];
        sender.backgroundColor =PURPLE;
        UIButton *oldBtn =(RoundBtn *)[self.view viewWithTag:workYearBtnTag];
        oldBtn.backgroundColor =Color(255, 255, 255);
        oldBtnTag =sender.tag;
    }
    else
        return;
    
    
}
- (void)textFieldDidEndEditing:(UITextField *)textField{
    if (textField == self.phoneTF) {
        if (![MyTools checkTel:self.phoneTF.text]) {
            [[DBNAlertView sharedDBNAlertView]showAlertViewWithString:@"请输入合法的手机号"];
            
        }
        
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
