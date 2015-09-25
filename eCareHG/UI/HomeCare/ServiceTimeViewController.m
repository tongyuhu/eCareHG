//
//  ServiceTimeViewController.m
//  eCareHG
//
//  Created by JinYanFeng on 15/9/21.
//  Copyright (c) 2015年 JinYanFeng. All rights reserved.
//

#import "ServiceTimeViewController.h"

@interface ServiceTimeViewController ()
{
    BOOL sameBtnClick;
    NSMutableArray *pickArr;
    NSMutableArray *timeArr;
    NSString *timeStr;
    BOOL segmentClick;
    NSString *compareTimeStr;
    NSMutableArray *compareTimeArr;

    
    NSArray *hourArr ;
    NSArray *minuteArr;
    
    NSDateFormatter *dateFormat;
    UIView *tmpCustomView;
}

@end

@implementation ServiceTimeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor =[UIColor whiteColor];
//    self.beginDate = [NSDate dateStartOfDay:[NSDate date]];
//    self.endDate = [NSDate dateStartOfDay:[[NSDate date] offsetDay:1]];
    self.minAvailableDate = [NSDate dateStartOfDay:[[NSDate date] offsetDay:0]];
    self.maxAVailableDate = [self.minAvailableDate offsetDay:30];
    
    self.navTitle.text = @"服务时间";
    [self initScrollView];
    [self initCustomView];
    [self initPickerViewData];
  

}
- (void)loadView
{
    if (!self.title)
        self.title = @"Calendar";
    KalView *kalView = [[KalView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame] delegate:self logic:logic];
    kalView.gridView.selectionMode = *(self.selectionMode);
    self.view = kalView;
    kalView.gridView.delegate =self;
    
    tableView = kalView.tableView;
    tableView.dataSource = dataSource;
    tableView.delegate = delegate;
    [self reloadData];
    self.dateArr =@[@""];
}
//代理  接收被选择的日期数组
- (void)passValue:(NSArray*)dateArr
{
    self.dateArr =[self arrayWithMemberIsOnly:dateArr];
    self.dateArr =[self.dateArr sortedArrayUsingSelector:@selector(compare:)];
    
    [self.pickerView reloadComponent:0];
    NSLog(@"所有的黄标＝＝2222＝＝%@",self.dateArr );
}
//删除数组中相同的日期
-(NSArray *)arrayWithMemberIsOnly:(NSArray *)array
{
    NSMutableArray *categoryArray = [[NSMutableArray alloc] init];
    for (unsigned i = 0; i < [array count]; i++){
        NSDate *date =[array objectAtIndex:i];
        if ([categoryArray containsObject:date] == NO){
            [categoryArray addObject:date];
        }
        
    }
    return categoryArray;

}

- (void)initScrollView
{
    self.myScrollView.backgroundColor =[UIColor clearColor];
    self.myScrollView.delegate = self;
    self.myScrollView.contentSize = CGSizeMake(ScreenWidth, 568-365);
}
- (void)initCustomView{
    NSArray *nib = [[NSBundle mainBundle]loadNibNamed:@"ServiceTimeCustomView" owner:self options:nil];
    //得到第一个UIView
    tmpCustomView = [nib objectAtIndex:0];
    //获得屏幕的Frame
    tmpCustomView.frame =CGRectMake(0, ScreenHeight -200, ScreenWidth, 200);
    //添加视图
    [self.view addSubview:tmpCustomView];
}
- (void)initPickerViewData
{
    hourArr =@[@"00",@"01",@"02",@"03",@"04",@"05",@"06",@"07",@"08",@"09",@"10",@"11",@"12",@"13",@"14",@"15",@"16",@"17",@"18",@"19",@"20",@"21",@"22",@"23",@"24"];
    minuteArr =@[@"00",@"30"];
//    pickArr =[NSMutableArray arrayWithObjects:self.dateArr,hourArr,minuteArr, nil];
    NSLog(@"所有的黄标＝＝3333＝＝%@",self.dateArr );
    
    timeArr =[[NSMutableArray alloc]initWithObjects:@"00",@"00", nil];
    compareTimeArr =[[NSMutableArray alloc]initWithObjects:@"00",@"00", nil];
    segmentClick =YES;
    
    NSString *seletedHour = [[pickArr objectAtIndex:1]objectAtIndex:0];
    NSString *seletedMinute = [[pickArr objectAtIndex:2]objectAtIndex:0];
    timeStr =[NSString stringWithFormat:@"  %@:%@",seletedHour,seletedMinute];
    compareTimeStr =[NSString stringWithFormat:@"%@%@",seletedHour,seletedMinute];
    
    self.pickerBackView.frame =CGRectMake(0, tmpCustomView.frame.size.height, ScreenWidth, 0);
    
    
    dateFormat = [[NSDateFormatter alloc] init];
    dateFormat.dateFormat = @"eeee YYYY-MMMM-dd";
    [dateFormat setMonthSymbols:[NSArray arrayWithObjects:@"1",@"2",@"3",@"4",@"5",@"6月",@"7",@"8",@"9",@"10",@"11",@"12", nil]];
    [dateFormat setWeekdaySymbols:[NSArray arrayWithObjects:@"周日",@"周一",@"周二",@"周三",@"周四",@"周五",@"周六", nil]];



}

#pragma mark 点击全部相同
-(IBAction)sameBtnClick:(UIButton *)sender{
    sameBtnClick =!sameBtnClick;
    if (sameBtnClick) {
        sender.selected =YES;
    }
    else{
        sender.selected =NO;

    }
    
}
#pragma mark 选择时间
-(IBAction)selectTimeBtnClick:(id)sender{
   
    [UIView animateWithDuration:0.5 animations:^{
        [self.myScrollView bringSubviewToFront:self.pickerBackView];
        self.pickerBackView.frame =CGRectMake(0, 0, ScreenWidth, 200);

    }];


}
#pragma mark UIPickerView 的取消和确定
- (IBAction)cancelBtnClick:(id)sender{
    [UIView animateWithDuration:0.5 animations:^{
        self.pickerBackView.frame =CGRectMake(0,tmpCustomView.frame.size.height, ScreenWidth, 0);
        
    }];
    

}
- (IBAction)sureBtnClick:(id)sender{
   
        if (segmentClick) {
        [timeArr replaceObjectAtIndex:0 withObject:timeStr];
        [compareTimeArr replaceObjectAtIndex:0 withObject:compareTimeStr];


    }
    else
    {
        [timeArr replaceObjectAtIndex:1 withObject:timeStr];
        [compareTimeArr replaceObjectAtIndex:1 withObject:compareTimeStr];


    }
    if ([[compareTimeArr objectAtIndex:0]intValue]>[[compareTimeArr objectAtIndex:1]intValue]||[[compareTimeArr objectAtIndex:0]intValue]==[[compareTimeArr objectAtIndex:1]intValue]) {
        MESSAGE(nil, @"结束日时间要晚于开始时间");
        return;
    }
    
    [UIView animateWithDuration:0.5 animations:^{
        self.pickerBackView.frame =CGRectMake(0, tmpCustomView.frame.size.height, ScreenWidth, 0);
        
    }];
    self.startTimeLab.text =[timeArr objectAtIndex:0];
    self.endTimeLab.text =[timeArr objectAtIndex:1];

    
}
#pragma mark UIPickerView 的开始和结束时间
- (IBAction)startTimeBtnClick:(id)sender{
    self.startLab.textColor =PURPLE;
    self.startLineLab.backgroundColor =PURPLE;
    self.endLab.textColor =TEXTGRAY;
    self.endLineLab.backgroundColor =SPLINELIGHTGRAY;
    segmentClick =YES;
    [timeArr replaceObjectAtIndex:1 withObject:timeStr];
    [compareTimeArr replaceObjectAtIndex:1 withObject:compareTimeStr];



}
- (IBAction)endTimeBtnClick:(id)sender{
    self.startLab.textColor =TEXTGRAY;
    self.startLineLab.backgroundColor =SPLINELIGHTGRAY;
    self.endLab.textColor =PURPLE;
    self.endLineLab.backgroundColor =PURPLE;
    segmentClick =NO;
    [timeArr replaceObjectAtIndex:0 withObject:timeStr];
    [compareTimeArr replaceObjectAtIndex:0 withObject:compareTimeStr];


}
#pragma mark 点击确定
- (IBAction)submitBtnClick:(id)sender{

}
#pragma mark UIPickerView DataSource method
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 3;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if (component ==0)
    {
        return self.dateArr.count;
    }
    else if  (component ==1)
    {
        return hourArr.count;
    }
    
    return minuteArr.count;

//    return [[pickArr objectAtIndex:component]count];
    
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
    myView =[[UILabel alloc] init];
    myView.font = [UIFont systemFontOfSize:13];

    if (component == 0) {
        
        myView.frame =CGRectMake(20.0, 0.0, 140, 30);
        myView.text = [dateFormat stringFromDate:[self.dateArr objectAtIndex:row]];
    }else if (component == 1){
        myView.frame =CGRectMake(10.0, 0.0, 60, 30);
        myView.text = [hourArr objectAtIndex:row];


    }
    else if (component == 2){
        myView.frame =CGRectMake(10.0, 0.0, 60, 30);
        myView.text = [minuteArr objectAtIndex:row];
        
        
    }

//    myView.text = [[pickArr objectAtIndex:component]objectAtIndex:row];
//    NSLog(@"-----pickArr--%@",[[pickArr objectAtIndex:0]objectAtIndex:0]);
    return myView;
    
}
- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component
{
    CGFloat componentWidth = 0.0;
    if (component == 0)
        componentWidth = 160.0; // 第一个组键的宽度
    
    else if(component == 1)
        componentWidth = 80.0; // 第2个组键的宽度
    else
         componentWidth = 80.0;
    return componentWidth;
    
}
- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component{
    return 30.0;
    
}
//监听轮子的移动
- (void)pickerView:(UIPickerView *)pickerView
      didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    if (component == 0) {
//        NSString *seletedProvince = [keys objectAtIndex:row];
//        areaArray = [cityDic objectForKey:seletedProvince];
//        
//        //重点！更新第二个轮子的数据
//        [self.pickerView reloadComponent:1];
//        
//        NSInteger selectedCityIndex = [self.pickerView selectedRowInComponent:1];
//        NSString *seletedCity = [areaArray objectAtIndex:selectedCityIndex];
//        
//        NSString *msg = [NSString stringWithFormat:@"%@%@", seletedProvince,seletedCity];
//        areaStr =msg;
    }
//    else {
//        NSInteger selectedProvinceIndex = [self.pickerView selectedRowInComponent:0];
//        NSString *seletedProvince = [keys objectAtIndex:selectedProvinceIndex];
//        
//        NSString *seletedCity = [areaArray objectAtIndex:row];
//        NSString *msg = [NSString stringWithFormat:@"%@%@", seletedProvince,seletedCity];
//        areaStr =msg;
//    }
//    NSInteger selectedDateIndex = [self.pickerView selectedRowInComponent:0];
//    NSString *seletedDate = [[pickArr objectAtIndex:0]objectAtIndex:selectedDateIndex];
    
    NSInteger selectedHourIndex = [self.pickerView selectedRowInComponent:1];
    NSString *seletedHour = [hourArr  objectAtIndex:selectedHourIndex];
    
    NSInteger selectedMinuteIndex = [self.pickerView selectedRowInComponent:2];
    NSString *seletedMinute = [minuteArr objectAtIndex:selectedMinuteIndex];
    
    timeStr =[NSString stringWithFormat:@"  %@:%@",seletedHour,seletedMinute];
    compareTimeStr =[NSString stringWithFormat:@"%@%@",seletedHour,seletedMinute];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
