//
//  ECBViewController.m
//  AES-Encrypt
//
//  Created by 黄尧栋 on 25/01/2018.
//  Copyright © 2018 Apple.Inc. All rights reserved.
//

#import "ECBViewController.h"

@interface ECBViewController ()

@end

@implementation ECBViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.ClearText.delegate =self;
    self.CipherText.delegate =self;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    
    return YES;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)EnercyAction:(id)sender {
    _ClearText.text =[_ClearText.text stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    _CipherText.text = [_ClearText.text aes256_encrypt:@"ucf-Gx4-dsn-oyH"];
    _ClearText.text =@"";
}

- (IBAction)DecryptAction:(id)sender {
    NSError *error;
    _Context = [[LAContext new]init];
    _Context.localizedFallbackTitle =@"输入密码";
    _Context.localizedCancelTitle =@"取消";
    _Context.localizedReason =@"通过Home键验证已有指纹";
    if ([_Context canEvaluatePolicy:LAPolicyDeviceOwnerAuthentication error:&error]) {
        
        [_Context evaluatePolicy:LAPolicyDeviceOwnerAuthentication localizedReason:_Context.localizedReason reply:^(BOOL success, NSError * _Nullable error) {
            if (success) {
                dispatch_async(dispatch_get_main_queue(),^{
                    _ClearText.text = [_CipherText.text aes256_decrypt:@"ucf-Gx4-dsn-oyH"];
                    _ClearText.text =[_ClearText.text stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
                    _CipherText.text =@"";
                    
                });
            }
            else{
                switch (error.code) {
                    case LAErrorUserFallback:
                    {
                        NSLog(@"使用者请求输入手动输入密码");
                        break;
                        
                    }
                    case LAErrorAppCancel:
                    {
                        NSLog(@"应用中断");
                        break;
                    }
                    case LAErrorPasscodeNotSet:
                    {
                        NSLog(@"密码未设置");
                        break;
                    }
                    case LAErrorSystemCancel:
                    {
                        NSLog(@"TouchID对话框被系统取消，例如按下Home或者电源键");
                        break;
                    }
                        
                    default:
                        break;
                }
            }
            
        }];
        
   }
   
}
@end
