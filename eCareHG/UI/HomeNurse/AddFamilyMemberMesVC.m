//
//  AddFamilyMemberMesVC.m
//  eCareHG
//
//  Created by JinYanFeng on 15/9/24.
//  Copyright (c) 2015年 JinYanFeng. All rights reserved.
//

#import "AddFamilyMemberMesVC.h"

@interface AddFamilyMemberMesVC ()
{
//    NSDictionary *cityDic;
//    NSArray * keys;
//    NSArray * areaArray;
//    NSString *areaStr;
    FamilyMemberMesObject *serMesObject;
    
}

@end

@implementation AddFamilyMemberMesVC

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.view.backgroundColor =BACKGROUNDCOLOR;
    [self initNavBar];
    [self initScrollView];
    
    self.mesView.layer.borderColor = [UIColor grayColor].CGColor;
    self.mesView.layer.borderWidth =1;
    self.mesView.backgroundColor =[UIColor clearColor];
    self.ladyBtn.selected =YES;
    self.mesTextView.placeholder =@"您可输入一些基本信息，方便服务人员了解更多情况";
    
    serMesObject =[[FamilyMemberMesObject alloc]init];
    
    
    
}
-(void)initNavBar
{
    self.navTitle.text =@"家庭成员信息";
    self.rightBtn.hidden =NO;
    [self.rightBtn setTitle:@"保存" forState:UIControlStateNormal];
    [self.rightBtn addTarget:self action:@selector(NavRightBtnClicked) forControlEvents:UIControlEventTouchUpInside];
    
}
#pragma mark 点击导航条右侧的btn(保存)
-(void)NavRightBtnClicked
{
    
    serMesObject.nameStr =self.nameTF.text;
    serMesObject.oldStr =self.oldTF.text;
    serMesObject.heightStr =self.heightTF.text;
    serMesObject.weightStr =self.weightTF.text;
    serMesObject.familyTitleStr =self.familyTitleTF.text;
    serMesObject.allergicHistoryStr =self.allergicHistoryTF.text;
    serMesObject.heredityHistoryStr =self.heredityHistoryTF.text;
    serMesObject.chronicHistoryStr =self.chronicHistoryTF.text;
    
    serMesObject.textViewStr =self.mesTextView.text;
    
    
}
- (void)initScrollView
{
    self.myScrollView.frame =CGRectMake(0, 64, ScreenWidth, ScreenHeight-64);
    self.myScrollView.backgroundColor =[UIColor clearColor];
    self.myScrollView.delegate = self;
    self.myScrollView.contentSize = CGSizeMake(ScreenWidth, 568-64);
}
#pragma mark 选择性别
- (IBAction)manBtnClick:(UIButton *)sender {
    self.ladyBtn.selected =NO;
    sender.selected =YES;
}
- (IBAction)ladyBtnClick:(UIButton *)sender {
    self.manBtn.selected =NO;
    sender.selected =YES;
    
    
}
#pragma mark-textFieldMethod
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    return [textField resignFirstResponder];
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
    
}
- (void)textFieldDidBeginEditing:(UITextField *)textField{
}
#pragma mark-textViewMethod
- (BOOL)textViewShouldBeginEditing:(UITextView *)textView{
    
    self.mesView.layer.borderColor = [UIColor orangeColor].CGColor;
    self.mesView.layer.borderWidth =1;
    return YES;
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
