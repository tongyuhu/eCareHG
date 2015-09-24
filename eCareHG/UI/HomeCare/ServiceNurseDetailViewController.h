//
//  ServiceNurseDetailViewController.h
//  eCareHG
//
//  Created by JinYanFeng on 15/9/21.
//  Copyright (c) 2015年 JinYanFeng. All rights reserved.
//

#import "BaseNavViewController.h"

@interface ServiceNurseDetailViewController : BaseNavViewController<UIScrollViewDelegate>
@property(nonatomic,weak)IBOutlet UIScrollView *myScrollView;
//headView
@property (weak, nonatomic) IBOutlet UIView *headView;
@property (weak, nonatomic) IBOutlet UILabel *nameLab;
@property (weak, nonatomic) IBOutlet UIButton *levelBtn;
@property (weak, nonatomic) IBOutlet UILabel *priceLab;
@property (weak, nonatomic) IBOutlet UILabel *sumLab;
@property (weak, nonatomic) IBOutlet UILabel *goodLab;
@property (weak, nonatomic) IBOutlet UILabel *recommendLab;
@property (weak, nonatomic) IBOutlet UIImageView *headImaView;

//otherMesView
@property (weak, nonatomic) IBOutlet UIView *otherMesView;
@property (weak, nonatomic) IBOutlet UILabel *oldLab;
@property (weak, nonatomic) IBOutlet UILabel *workYearLab;
@property (weak, nonatomic) IBOutlet UILabel *levelLab;
@property (weak, nonatomic) IBOutlet UILabel *priceOLab;
@property (weak, nonatomic) IBOutlet UILabel *servePreferLab;
//payView
@property (weak, nonatomic) IBOutlet UIView *payView;
- (IBAction)WeixinPayBtnClick:(id)sender;
- (IBAction)aliPayBtnClick:(id)sender;
- (IBAction)bankCardPayBtnClick:(id)sender;
- (IBAction)NOPayBtnClick:(id)sender;

- (IBAction)submitBtnClick:(id)sender;
@end
