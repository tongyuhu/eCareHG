//
//  ServiceTimeViewController.h
//  eCareHG
//
//  Created by JinYanFeng on 15/9/21.
//  Copyright (c) 2015年 JinYanFeng. All rights reserved.
//

#import "KalViewController.h"

@interface ServiceTimeViewController : KalViewController<UIPickerViewDataSource,UIPickerViewDelegate>
@property(nonatomic,strong) UIScrollView *myScrollView;
@property(nonatomic,weak)IBOutlet UIButton *sameBtn;
@property (weak, nonatomic) IBOutlet UILabel *startTimeLab;
@property (weak, nonatomic) IBOutlet UILabel *endTimeLab;
-(IBAction)sameBtnClick:(id)sender;
-(IBAction)selectTimeBtnClick:(id)sender;
- (IBAction)submitBtnClick:(id)sender;

#pragma mark- pickerView
@property (weak, nonatomic) IBOutlet UIView *pickerBackView;
- (IBAction)cancelBtnClick:(id)sender;
- (IBAction)sureBtnClick:(id)sender;
@property (weak, nonatomic) IBOutlet UIPickerView *pickerView;
- (IBAction)startTimeBtnClick:(id)sender;
- (IBAction)endTimeBtnClick:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *startLab;
@property (weak, nonatomic) IBOutlet UILabel *endLab;
@property (weak, nonatomic) IBOutlet UILabel *startLineLab;
@property (weak, nonatomic) IBOutlet UILabel *endLineLab;


@end
