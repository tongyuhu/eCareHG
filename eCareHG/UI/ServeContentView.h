//
//  ServeContentView.h
//  eCareHG
//
//  Created by JinYanFeng on 15/9/29.
//  Copyright (c) 2015年 JinYanFeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ServeContentView : UIView
@property (weak, nonatomic) IBOutlet UITextView *serContentText;
- (IBAction)dismissBtnClick:(id)sender;
@end
