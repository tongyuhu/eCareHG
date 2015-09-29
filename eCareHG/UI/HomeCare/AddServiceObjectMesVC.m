//
//  AddServiceObjectMesVC.m
//  eCareHG
//
//  Created by JinYanFeng on 15/9/16.
//  Copyright (c) 2015年 JinYanFeng. All rights reserved.
//

#import "AddServiceObjectMesVC.h"
#import "ServiceObjectMessage.h"
@interface AddServiceObjectMesVC ()
{
    NSDictionary *cityDic;
    NSArray * keys;
    NSArray * areaArray;
    NSString *areaStr;
    ServiceObjectMessage *serMesObject;

}
@end

@implementation AddServiceObjectMesVC
- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.view.backgroundColor =BACKGROUNDCOLOR;
    [self initNavBar];
    [self initScrollView];
    
    [self initPickerData];
    self.mesView.layer.borderColor = [UIColor grayColor].CGColor;
    self.mesView.layer.borderWidth =1;
    self.mesView.backgroundColor =[UIColor clearColor];
    self.ladyBtn.selected =YES;
    self.noFullBtn.selected =YES;
    self.mesTextView.placeholder =@"您可输入一些基本信息，方便服务人员了解更多情况";
    
    serMesObject =[[ServiceObjectMessage alloc]init];

    
   

    
}
-(void)initNavBar
{
    self.navTitle.text =@"服务对象信息";
    self.rightBtn.hidden =NO;
    [self.rightBtn setTitle:@"保存" forState:UIControlStateNormal];
    [self.rightBtn addTarget:self action:@selector(NavRightBtnClicked) forControlEvents:UIControlEventTouchUpInside];
    
}
#pragma mark 点击导航条右侧的btn(保存)
-(void)NavRightBtnClicked
{
    serMesObject.areaStr =self.areaLab.text;
    serMesObject.addressStr =self.addressTF.text;
    serMesObject.nameStr =self.nameTF.text;
    serMesObject.oldStr =self.oldTF.text;
//    serMesObject.sexStr =self.s.text;
//    serMesObject.areaStr =self.areaTF.text;
    serMesObject.basicStateStr =self.mesTextView.text;

    
}
- (void)initScrollView
{
    self.myScrollView.frame =CGRectMake(0, 64, ScreenWidth, ScreenHeight-64);
    self.myScrollView.backgroundColor =[UIColor clearColor];
    self.myScrollView.delegate = self;
    self.myScrollView.contentSize = CGSizeMake(ScreenWidth, 568-64);
}
-(void)initPickerData
{
    self.pickerBackView.frame =CGRectMake(0, ScreenHeight, ScreenWidth, 0);
    [self.view addSubview:self.pickerBackView];

    NSArray *ary1 =[NSArray arrayWithObjects:@"浦东新区",@"宝山区",@"闽行区",@"虹口区", nil];
    cityDic =[NSDictionary dictionaryWithObject:ary1 forKey:@"上海"];
    keys =[cityDic allKeys];;
    
    NSInteger selectedProvinceIndex = [self.pickerView selectedRowInComponent:0];
    NSString *seletedProvince = [keys objectAtIndex:selectedProvinceIndex];
    areaArray = [cityDic objectForKey:seletedProvince];
    
    NSInteger selectedCityIndex = [self.pickerView selectedRowInComponent:1];
    NSString *seletedCity = [areaArray objectAtIndex:selectedCityIndex];
    
    
    NSString *msg = [NSString stringWithFormat:@"%@%@", seletedProvince,seletedCity];
    areaStr =msg;


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

#pragma mark 选择自理能力
- (IBAction)fullBtnClick:(UIButton *)sender {
    self.halfFullBtn.selected =NO;
    self.noFullBtn.selected =NO;
    sender.selected =YES;
}
- (IBAction)halfFullBtnClick:(UIButton *)sender {
    self.fullBtn.selected =NO;
    self.noFullBtn.selected =NO;
    sender.selected =YES;
}
- (IBAction)noFullBtnClick:(UIButton *)sender{
    self.halfFullBtn.selected =NO;
    self.fullBtn.selected =NO;
    sender.selected =YES;

}
#pragma mark UIPickerView 的取消和确定按钮
- (IBAction)cancelBtnClick:(id)sender {
    
    [UIView animateWithDuration:0.5 animations:^{
        self.pickerBackView.frame =CGRectMake(0, ScreenHeight, ScreenWidth, 0);
    } completion:^(BOOL finished) {
//        self.pickerBackView.hidden =YES;
        
    }];
    
}

- (IBAction)sureBtnClick:(id)sender {
       [UIView animateWithDuration:0.5 animations:^{
        self.pickerBackView.frame =CGRectMake(0, ScreenHeight, ScreenWidth, 0);
    } completion:^(BOOL finished) {
//        self.pickerBackView.hidden =YES;
        
    }];

    self.areaLab.text =areaStr;
    if (![self.areaLab.text isEqualToString:@"请选择区/县"]) {
        self.areaLab.textColor =BLACK;
        
    }
    else
    {
        self.areaLab.textColor =PLACEHODE;
    }


}
#pragma mark UIPickerView DataSource method
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 2;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if (component ==0)
    {
        return keys.count;
    }
 
    return areaArray.count;
    
}
#pragma mark UIPickerView  Delegate method
//- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
//{
//    if (component ==0)
//    {
//        return [keys objectAtIndex:row];
//    }
//    return [areaArray objectAtIndex:row];
//    
//}
- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row
          forComponent:(NSInteger)component reusingView:(UIView *)view
{
    UILabel *myView = nil;
    if (component == 0) {
        
        myView =[[UILabel alloc] initWithFrame:CGRectMake(100.0, 0.0, 60, 30)];
        myView.text = [keys objectAtIndex:row];
        myView.font = [UIFont systemFontOfSize:14];
        myView.backgroundColor = [UIColor clearColor];
        
    }else {
        
        myView =[[UILabel alloc] initWithFrame:CGRectMake(40.0, 0.0, 100, 30)] ;
        myView.text = [areaArray objectAtIndex:row];
        myView.font = [UIFont systemFontOfSize:14];
        myView.backgroundColor = [UIColor clearColor];
        
    }
    
    return myView;

}
- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component
{
        CGFloat componentWidth = 0.0;
        if (component == 0)
            componentWidth = 180.0; // 第一个组键的宽度
        
        else
            componentWidth = 140.0; // 第2个组键的宽度
        
        return componentWidth;
        
}
- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component{
        return 30.0;
        
}
//监听轮子的移动
- (void)pickerView:(UIPickerView *)pickerView
      didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    if (component == 0) {
        NSString *seletedProvince = [keys objectAtIndex:row];
        areaArray = [cityDic objectForKey:seletedProvince];
        
        //重点！更新第二个轮子的数据
        [self.pickerView reloadComponent:1];
        
        NSInteger selectedCityIndex = [self.pickerView selectedRowInComponent:1];
        NSString *seletedCity = [areaArray objectAtIndex:selectedCityIndex];
        
        NSString *msg = [NSString stringWithFormat:@"%@%@", seletedProvince,seletedCity];
        areaStr =msg;
    }
    else {
        NSInteger selectedProvinceIndex = [self.pickerView selectedRowInComponent:0];
        NSString *seletedProvince = [keys objectAtIndex:selectedProvinceIndex];
        
        NSString *seletedCity = [areaArray objectAtIndex:row];
        NSString *msg = [NSString stringWithFormat:@"%@%@", seletedProvince,seletedCity];
        areaStr =msg;
    }
}
#pragma mark-选择区域btn
- (IBAction)selAreaBtnClick:(id)sender
{
    [UIView animateWithDuration:0.5 animations:^{
        self.pickerBackView.frame =CGRectMake(0, ScreenHeight -179, ScreenWidth, 179);
    } completion:^(BOOL finished) {
        
    }];

}
#pragma mark-textFieldMethod
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    return [textField resignFirstResponder];
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
    
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



@end
