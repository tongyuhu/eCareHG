//
//  IdentityCardViewController.h
//  eCareHG
//
//  Created by tongyuhu on 15/9/23.
//  Copyright (c) 2015年 JinYanFeng. All rights reserved.
//

#import "BaseNavViewController.h"

@interface IdentityCardViewController : BaseNavViewController
@property (weak, nonatomic) IBOutlet UITextField *realName;
@property (weak, nonatomic) IBOutlet UITextField *identityNum;
@property (weak, nonatomic) IBOutlet UIImageView *identityCardImage;
@property (weak, nonatomic) IBOutlet UIView *adjustView;

@end
