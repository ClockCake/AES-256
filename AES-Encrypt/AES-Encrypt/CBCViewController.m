//
//  CBCViewController.m
//  AES-Encrypt
//
//  Created by 黄尧栋 on 25/01/2018.
//  Copyright © 2018 Apple.Inc. All rights reserved.
//

#import "CBCViewController.h"
#import "NSString+AES_CBC.h"
@interface CBCViewController ()

@end

@implementation CBCViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _key = @"ucf-Gx4-dsn-oyH";
    _IV =@"BdA-&@D-mNC";
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}
- (IBAction)EncryptAction:(id)sender {
    _CipherText.text = [_ClearText.text stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    //NSLog(@"转码后的数据%@",_CipherText.text);
    _CipherText.text = [_CipherText.text AES256EncryptWithKey:_key iv:_IV];
    //NSLog(@"加密后的数据%@",_CipherText.text);
    _ClearText.text =@"";
    
}

- (IBAction)DecryptAction:(id)sender {
    //增加Touch ID 解锁
    _Context = [[LAContext new]init];
    _Context.localizedReason =@"通过Home键验证已有指纹";
    _Context.localizedCancelTitle =@"取消";
    _Context.localizedFallbackTitle =@"输入密码";
    NSError *error;
    if ([_Context canEvaluatePolicy:LAPolicyDeviceOwnerAuthentication error:&error]) {
        [_Context evaluatePolicy:LAPolicyDeviceOwnerAuthentication localizedReason:_Context.localizedReason reply:^(BOOL success, NSError * _Nullable error) {
            if (success) {
                dispatch_async(dispatch_get_main_queue(),^{
                    _ClearText.text =[_CipherText.text AES256DecryptWithKey:_key iv:_IV];
                    // NSLog(@"解密后的%@",_ClearText.text);
                    _ClearText.text =[_ClearText.text stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
                    // NSLog(@"解码后的数据%@",_ClearText.text);
                    _CipherText.text =@"";
                    
                });
            }
            else{
                switch (error.code) {
                    case LAErrorUserFallback:
                    {switch (error.code) {
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
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    return [textField resignFirstResponder];
}
@end
