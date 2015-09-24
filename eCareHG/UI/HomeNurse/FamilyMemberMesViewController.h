//
//  FamilyMemberMesViewController.h
//  eCareHG
//
//  Created by JinYanFeng on 15/9/24.
//  Copyright (c) 2015年 JinYanFeng. All rights reserved.
//

#import "BaseNavViewController.h"

@interface FamilyMemberMesViewController : BaseNavViewController<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic ,strong)UITableView *myTableView;


@end
