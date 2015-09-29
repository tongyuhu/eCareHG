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
    
    int lowerPrice;
    int highPrice;
    
    NSDictionary *cityDic;
    NSArray * keys;
    NSArray * areaArray;
    NSString *areaStr;
    
   ServeContentView *tmpCustomView;
//    ServiceObjectMessage *serMesObject;
}
@end

@implementation HomeNurseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor =[UIColor whiteColor];
    [self initNavBar];
    [self initScrollView];
    [self initOriginSelectBtn];
    [self initPickerData];
    
    self.selectBackView.frame =CGRectMake(0, ScreenHeight, ScreenWidth, 350);
    self.selectBackView.hidden =YES;
    selContentArr =[[NSMutableArray alloc]initWithObjects:@"1",@"1",@"1",@"1",@"1", nil];
    selArr =[[NSMutableArray alloc]initWithCapacity:0];
    
    self.lowerPriceLab.text =@"不限";
    self.highPriceLab.text =@"不限";
    lowerPrice =25;
    highPrice =40;
    
    [self initCustomView];
    

}
-(void)initNavBar
{
    self.navTitle.text =@"家庭护理顾问";
    self.rightBtn.hidden =NO;
    [self.rightBtn setTitle:@"服务说明" forState:UIControlStateNormal];
    [self.rightBtn addTarget:self action:@selector(navRightBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
}
#pragma mark-点击nav右侧的btn服务说明
-(void)navRightBtnClick
{
    
    [UIView animateWithDuration:0.5 animations:^{
        tmpCustomView.center =self.view.center;
        tmpCustomView.bounds =CGRectMake(0,0, 270, 300);
    } completion:^(BOOL finished) {
        
    }];

}
- (void)initCustomView{
    tmpCustomView = [[[NSBundle mainBundle] loadNibNamed:@"ServeContentView" owner:self options:nil]lastObject];
    tmpCustomView.center =self.view.center;
    tmpCustomView.bounds =CGRectMake(0,0, 0, 0);
    tmpCustomView.layer.borderColor = PURPLE.CGColor;
    tmpCustomView.layer.borderWidth =1;

    [self.view addSubview:tmpCustomView];

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
-(void)initPickerData
{
    self.pickerBackView.frame =CGRectMake(0, ScreenHeight, ScreenWidth, 0);
//    self.pickerBackView.hidden =YES;
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
#pragma mark-点击服务区域
- (IBAction)serviceAreaBtnClick:(id)sender
{


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
   self.selectNurseLab.text =str.length>1?str:@"未筛选";    
    
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
#pragma mark-报价
- (IBAction)priceBtnClick:(UIButton *)sender{
    [selContentArr replaceObjectAtIndex:2 withObject:@"报价"];
    
    if (sender.tag ==30) {
        if (lowerPrice ==25 ||[self.lowerPriceLab.text isEqualToString:@"不限"]) {
            self.lowerPriceLab.text =@"不限";
            self.highPriceLab.text =@"不限";
            return;
        }
        
        lowerPrice -=20;
        highPrice -=20;
        self.lowerPriceLab.text =[NSString stringWithFormat:@"%d",lowerPrice];
        self.highPriceLab.text =[NSString stringWithFormat:@"%d",highPrice];
    }
    else if (sender.tag ==31)
    {
        if ([self.lowerPriceLab.text isEqualToString:@"不限"]) {
            self.lowerPriceLab.text =@"25";
            self.highPriceLab.text =@"40";
            
            return;
        }
        if (highPrice ==100) {
            self.lowerPriceLab.text =@"100";
            self.highPriceLab.text =@"不限";
            return;
            
        }
        
        lowerPrice +=20;
        highPrice +=20;
        self.lowerPriceLab.text =[NSString stringWithFormat:@"%d",lowerPrice];
        self.highPriceLab.text =[NSString stringWithFormat:@"%d",highPrice];
    }

    
}
- (IBAction)titleBtnClick:(UIButton *)sender{
    if (titleBtnTag !=sender.tag) {
        [selContentArr replaceObjectAtIndex:3 withObject:@"职称"];
        sender.backgroundColor =PURPLE;
        UIButton *oldBtn =(RoundBtn *)[self.view viewWithTag:titleBtnTag];
        oldBtn.backgroundColor =Color(255, 255, 255);
        titleBtnTag =sender.tag;
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
        workYearBtnTag =sender.tag;
    }
    else
        return;
    
    
}
#pragma mark UIPickerView 的取消和确定按钮
- (IBAction)pickerCancelBtnClick:(id)sender {
    
    [UIView animateWithDuration:0.5 animations:^{
        self.pickerBackView.frame =CGRectMake(0, ScreenHeight, ScreenWidth, 0);
    } completion:^(BOOL finished) {
//              self.pickerBackView.hidden =YES;
        
    }];
    
}

- (IBAction)pickerSureBtnClick:(id)sender {
    [UIView animateWithDuration:0.5 animations:^{
        self.pickerBackView.frame =CGRectMake(0, ScreenHeight, ScreenWidth, 0);
    } completion:^(BOOL finished) {
//             self.pickerBackView.hidden =YES;
        
    }];
    
    self.areaTF.text =areaStr;
    
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
#pragma mark-点击服务说明view消失
- (void)dismissBtnClick:(id)sender {
    [UIView animateWithDuration:0.5 animations:^{
        tmpCustomView.center =self.view.center;
        tmpCustomView.bounds =CGRectMake(0,0, 0, 0);
    } completion:^(BOOL finished) {
        
    }];
    
    
}

#pragma mark-textFieldMethod
- (void)textFieldDidEndEditing:(UITextField *)textField{
    if (textField == self.phoneTF) {
        if (![MyTools checkTel:self.phoneTF.text]) {
            [[DBNAlertView sharedDBNAlertView]showAlertViewWithString:@"请输入合法的手机号"];
            
        }
        
    }
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    return [textField resignFirstResponder];
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
    
}
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    if (textField ==self.areaTF) {
        [self.areaTF resignFirstResponder];
        
        [UIView animateWithDuration:0.5 animations:^{
            self.pickerBackView.frame =CGRectMake(0, ScreenHeight -179-64, ScreenWidth, 179);
        } completion:^(BOOL finished) {
//                     self.pickerBackView.hidden =NO;
            
        }];
        
    }
    //    else
    //    {
    //        self.pickerBackView.hidden =YES;
    //    }
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
