//
//  UserCenterView.h
//  eCareHG
//
//  Created by tongyuhu on 15/9/22.
//  Copyright (c) 2015年 JinYanFeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UserCenterView : UIView
@property (assign, nonatomic)UIViewController *responder;
@property (weak, nonatomic) IBOutlet UIScrollView *contentScrollView;
@property (weak, nonatomic) IBOutlet UIImageView *photoImageView;
@property (weak, nonatomic) IBOutlet UILabel *nickName;
@property (weak, nonatomic) IBOutlet UILabel *photoNum;


@end
