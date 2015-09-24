
//  eCareHG
//
//  Created by JinYanFeng on 15/9/16.
//  Copyright (c) 2015年 JinYanFeng. All rights reserved.
//

#import "BaseNavViewController.h"

@interface HomePageViewController : BaseNavViewController<UIScrollViewDelegate>
@property(nonatomic,weak)IBOutlet UIScrollView *myScrollView;
- (IBAction)chatRoomBtnClick:(id)sender;
- (IBAction)homeCareBtnClick:(id)sender;
- (IBAction)homeNurseBtnClick:(id)sender;
@end
