//
//  RegisterViewController2.m
//  eCareHG
//
//  Created by tongyuhu on 15/10/8.
//  Copyright (c) 2015年 JinYanFeng. All rights reserved.
//

#import "RegisterViewController2.h"

@interface RegisterViewController2 ()
{
    NSInteger _count;
    NSTimer *_timer;
}
@property (weak, nonatomic) IBOutlet UIButton *getIdentityCodeBtn;
@property (weak, nonatomic) IBOutlet UITextField *identityCodeFiled;
@property (weak, nonatomic) IBOutlet UITextField *passwordFiled;

@property (weak, nonatomic) IBOutlet UITextField *recommendedCodeField;

@end

@implementation RegisterViewController2

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
- (void)countDown
{
    _count --;
    [_getIdentityCodeBtn setTitle:[NSString stringWithFormat:@"%ld秒后重发", _count] forState:UIControlStateDisabled];
    if (_count==0) {
        _getIdentityCodeBtn.enabled = YES;
        [_getIdentityCodeBtn setTitle:@"点击重新获取" forState:UIControlStateNormal];
        [_timer invalidate];
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)getIdentityCodeBtn:(id)sender {
    _count = 10;
    [self.getIdentityCodeBtn setTitle:[NSString stringWithFormat:@"%ld秒后重发", _count] forState:UIControlStateDisabled];
    self.getIdentityCodeBtn.enabled = NO;
    _timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(countDown) userInfo:nil repeats:YES];
}
- (IBAction)registerBtn:(id)sender {
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
