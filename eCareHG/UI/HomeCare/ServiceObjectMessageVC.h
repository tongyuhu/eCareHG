//
//  ServiceObjectMessageVC.h
//  eCareHG
//
//  Created by JinYanFeng on 15/9/16.
//  Copyright (c) 2015年 JinYanFeng. All rights reserved.
//

#import "BaseNavViewController.h"

@interface ServiceObjectMessageVC : BaseNavViewController<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic ,strong)UITableView *myTableView;

@end
