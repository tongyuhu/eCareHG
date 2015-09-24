//
//  AddFamilyMemberMesVC.h
//  eCareHG
//
//  Created by JinYanFeng on 15/9/24.
//  Copyright (c) 2015年 JinYanFeng. All rights reserved.
//

#import "BaseNavViewController.h"
#import "IQTextView.h"
#import "FamilyMemberMesObject.h"
@interface AddFamilyMemberMesVC : BaseNavViewController<UIScrollViewDelegate>
@property(nonatomic,weak)IBOutlet UIScrollView *myScrollView;
@property (weak, nonatomic) IBOutlet UITextField *nameTF;
@property (weak, nonatomic) IBOutlet UITextField *oldTF;
@property (weak, nonatomic) IBOutlet UITextField *heightTF;
@property (weak, nonatomic) IBOutlet UITextField *weightTF;
@property (weak, nonatomic) IBOutlet UITextField *familyTitleTF;
@property (weak, nonatomic) IBOutlet UITextField *allergicHistoryTF;
@property (weak, nonatomic) IBOutlet UITextField *heredityHistoryTF;
@property (weak, nonatomic) IBOutlet UITextField *chronicHistoryTF;

@property (weak, nonatomic) IBOutlet UIButton *manBtn;
- (IBAction)manBtnClick:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *ladyBtn;
- (IBAction)ladyBtnClick:(id)sender;

@property (weak, nonatomic) IBOutlet IQTextView *mesTextView;
@property (weak, nonatomic) IBOutlet UIView *mesView;

@end
