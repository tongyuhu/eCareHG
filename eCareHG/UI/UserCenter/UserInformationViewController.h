//
//  UserInformationViewController.h
//  eCareHG
//
//  Created by tongyuhu on 15/9/23.
//  Copyright (c) 2015年 JinYanFeng. All rights reserved.
//

#import "BaseNavViewController.h"

@interface UserInformationViewController : BaseNavViewController
@property (weak, nonatomic) IBOutlet UIImageView *photo;
@property (weak, nonatomic) IBOutlet UITextField *nickName;
@property (weak, nonatomic) IBOutlet UITextField *phoneNum;
@property (weak, nonatomic) IBOutlet UITextField *age;
@property (weak, nonatomic) IBOutlet UITextField *gender;
@property (weak, nonatomic) IBOutlet UITextField *identityCard;

@end
