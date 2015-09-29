//
//  ServeContentView.m
//  eCareHG
//
//  Created by JinYanFeng on 15/9/29.
//  Copyright (c) 2015年 JinYanFeng. All rights reserved.
//

#import "ServeContentView.h"

@implementation ServeContentView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(void)loadView
{
    self.layer.borderColor = [UIColor orangeColor].CGColor;
    self.layer.borderWidth =0.5;

}
- (IBAction)dismissBtnClick:(id)sender {
//    [UIView animateWithDuration:0.5 animations:^{
//        self.center =self.center;
//        self.bounds =CGRectMake(0,0, 0, 0);
//    } completion:^(BOOL finished) {
//        
//    }];
//
    
}
@end
