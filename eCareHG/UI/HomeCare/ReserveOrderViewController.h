//
//  ReserveOrderViewController.h
//  eCareHG
//
//  Created by JinYanFeng on 15/9/21.
//  Copyright (c) 2015年 JinYanFeng. All rights reserved.
//

#import "BaseNavViewController.h"

@interface ReserveOrderViewController : BaseNavViewController<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,weak)IBOutlet UITableView *myTableView;
-(IBAction)headBtnClick:(id)sender;
@end
