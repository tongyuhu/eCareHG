//
//  HomeCareViewController.m
//  eCareHG
//
//  Created by JinYanFeng on 15/9/16.
//  Copyright (c) 2015年 JinYanFeng. All rights reserved.
//

#import "HomeCareViewController.h"
#import "ServiceObjectMessageVC.h"
#import "RoundBtn.h"
#import "QuickOrderViewController.h"
#import "ServiceTimeViewController.h"
#import "ReserveOrderViewController.h"

@interface HomeCareViewController ()
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
    UIView *tmpCustomView;

}
@end

@implementation HomeCareViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor =[UIColor whiteColor];
    [self initNavBar];
    [self initScrollView];
    [self initOriginSelectBtn];
    
    self.selectBackView.frame =CGRectMake(0, ScreenHeight, ScreenWidth, 335);
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
    self.navTitle.text =@"居家专护";
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
- (void)initCustomView{
    tmpCustomView = [[[NSBundle mainBundle] loadNibNamed:@"ServeContentView" owner:self options:nil]lastObject];
    tmpCustomView.center =self.view.center;
    tmpCustomView.bounds =CGRectMake(0,0, 0, 0);
    tmpCustomView.layer.borderColor =PURPLE.CGColor;
    tmpCustomView.layer.borderWidth =1;
    [self.view addSubview:tmpCustomView];
    
}
- (IBAction)serviceObjBtnClick:(id)sender
{
    ServiceObjectMessageVC *famVC =[[ServiceObjectMessageVC alloc]init];
    [self.navigationController pushViewController:famVC animated:YES];

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
        self.selectBackView.frame =CGRectMake(0, ScreenHeight -335-64, ScreenWidth, 335);
    }];

    
}
#pragma mark-专户人员筛选 View
#pragma mark-取消
- (IBAction)cancelBtnClick:(id)sender{
    [UIView animateWithDuration:0.5 animations:^{
        self.selectBackView.frame =CGRectMake(0, ScreenHeight, ScreenWidth, 335);
    } completion:^(BOOL finished) {
        self.selectBackView.hidden =YES;
        
    }];

}
#pragma mark-确定
- (IBAction)sureBtnClick:(id)sender{
    [UIView animateWithDuration:0.5 animations:^{
        self.selectBackView.frame =CGRectMake(0, ScreenHeight, ScreenWidth, 335);
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
#pragma mark-点击服务说明view消失
- (void)dismissBtnClick:(id)sender {
    [UIView animateWithDuration:0.5 animations:^{
        tmpCustomView.center =self.view.center;
        tmpCustomView.bounds =CGRectMake(0,0, 0, 0);
    } completion:^(BOOL finished) {
        
    }];
    
    
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
