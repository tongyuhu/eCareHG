//
//  OrderNurseCell.h
//  eCareHG
//
//  Created by JinYanFeng on 15/9/18.
//  Copyright (c) 2015年 JinYanFeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OrderNurseCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *headImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLab;
@property (weak, nonatomic) IBOutlet UILabel *sexLab;
@property (weak, nonatomic) IBOutlet UIButton *titleLab;
@property (weak, nonatomic) IBOutlet UIButton *autheLab;
@property (weak, nonatomic) IBOutlet UILabel *levelLab;
@property (weak, nonatomic) IBOutlet UILabel *goodCountLab;
@property (weak, nonatomic) IBOutlet UILabel *priceLab;
@property (weak, nonatomic) IBOutlet UIButton *dateLab;
@property (weak, nonatomic) IBOutlet UILabel *spline;

@end
