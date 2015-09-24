//
//  AddServiceObjectMesVC.h
//  eCareHG
//
//  Created by JinYanFeng on 15/9/16.
//  Copyright (c) 2015年 JinYanFeng. All rights reserved.
//

#import "BaseNavViewController.h"
#import "IQTextView.h"
@interface AddServiceObjectMesVC : BaseNavViewController<UIScrollViewDelegate>
@property(nonatomic,weak)IBOutlet UIScrollView *myScrollView;
@property (weak, nonatomic) IBOutlet UITextField *areaTF;

@property (weak, nonatomic) IBOutlet UITextField *addressTF;
@property (weak, nonatomic) IBOutlet UITextField *nameTF;
@property (weak, nonatomic) IBOutlet UITextField *oldTF;

@property (weak, nonatomic) IBOutlet UIButton *manBtn;
- (IBAction)manBtnClick:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *ladyBtn;
- (IBAction)ladyBtnClick:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *fullBtn;
- (IBAction)fullBtnClick:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *halfFullBtn;
- (IBAction)halfFullBtnClick:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *noFullBtn;
- (IBAction)noFullBtnClick:(id)sender;

@property (weak, nonatomic) IBOutlet UIView *mesView;
@property (weak, nonatomic) IBOutlet IQTextView *mesTextView;

#pragma mark- pickerView
@property (weak, nonatomic) IBOutlet UIView *pickerBackView;
- (IBAction)cancelBtnClick:(id)sender;
- (IBAction)sureBtnClick:(id)sender;
@property (weak, nonatomic) IBOutlet UIPickerView *pickerView;

@end
