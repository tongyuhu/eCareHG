//
//  HomeNurseViewController.h
//  eCareHG
//
//  Created by JinYanFeng on 15/9/23.
//  Copyright (c) 2015年 JinYanFeng. All rights reserved.
//

#import "BaseNavViewController.h"

@interface HomeNurseViewController : BaseNavViewController<UIScrollViewDelegate>
@property(nonatomic,weak)IBOutlet UIScrollView *myScrollView;
@property (weak, nonatomic) IBOutlet UIView *selectBackView;
@property (weak, nonatomic) IBOutlet UILabel *namelab;
@property (weak, nonatomic) IBOutlet UILabel *startTimeLab;
@property (weak, nonatomic) IBOutlet UILabel *finishTimeLab;
@property (weak, nonatomic) IBOutlet UITextField *phoneTF;
@property (weak, nonatomic) IBOutlet UILabel *selectNurseLab;
@property (weak, nonatomic) IBOutlet UIView *bottomView;
- (IBAction)segmentChange:(id)sender;
- (IBAction)serviceObjBtnClick:(id)sender;


//专户人员筛选View的btn
- (IBAction)workYearBtnClick:(id)sender;
- (IBAction)serviceTimeBtnClick:(id)sender;
- (IBAction)selPersonBtnClick:(id)sender;
- (IBAction)sexBtnClick:(id)sender;
- (IBAction)oldBtnClick:(id)sender;
- (IBAction)priceBtnClick:(id)sender;
- (IBAction)titleBtnClick:(id)sender;
- (IBAction)cancelBtnClick:(id)sender;
- (IBAction)sureBtnClick:(id)sender;

@end
