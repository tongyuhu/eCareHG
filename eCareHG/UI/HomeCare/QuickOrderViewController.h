//
//  QuickOrderViewController.h
//  eCareHG
//
//  Created by JinYanFeng on 15/9/18.
//  Copyright (c) 2015年 JinYanFeng. All rights reserved.
//

#import "BaseNavViewController.h"

@interface QuickOrderViewController : BaseNavViewController
@property (weak, nonatomic) IBOutlet UILabel *serveNameLab;
@property (weak, nonatomic) IBOutlet UILabel *serveProjectLab;
@property (weak, nonatomic) IBOutlet UILabel *serveDaysLab;
@property (weak, nonatomic) IBOutlet UILabel *serveDatesLab;
@property (weak, nonatomic) IBOutlet UILabel *serveTimesLab;
@property (weak, nonatomic) IBOutlet UILabel *serveAddressLab;
@property(nonatomic,weak)IBOutlet UITableView *myTableView;
@end
