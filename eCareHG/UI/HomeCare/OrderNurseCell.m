//
//  OrderNurseCell.m
//  eCareHG
//
//  Created by JinYanFeng on 15/9/18.
//  Copyright (c) 2015年 JinYanFeng. All rights reserved.
//

#import "OrderNurseCell.h"

@implementation OrderNurseCell

- (void)awakeFromNib {
    
    [ self.autheLab.layer setCornerRadius:3.0f];
    [ self.autheLab.layer setMasksToBounds:YES];
    self.autheLab.layer.borderColor = [UIColor greenColor].CGColor;
    self.autheLab.layer.borderWidth =0.5;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
