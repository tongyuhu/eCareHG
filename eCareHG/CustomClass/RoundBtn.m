//
//  RoundBtn.m
//  eCareHG
//
//  Created by JinYanFeng on 15/9/17.
//  Copyright (c) 2015年 JinYanFeng. All rights reserved.
//

#import "RoundBtn.h"

@implementation RoundBtn

-(void) drawRect:(CGRect)rect {
    
    [ self.layer setCornerRadius:3.0f];
    [ self.layer setMasksToBounds:YES];
    self.backgroundColor= [UIColor whiteColor];
    self.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.layer.borderWidth =0.5;

//    if (self.selected) {
//        self.backgroundColor =PURPLE;
//    }
//    else{
//           }
}
@end
