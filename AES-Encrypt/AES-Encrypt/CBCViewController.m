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
    
    _ClearText.text =[_CipherText.text AES256DecryptWithKey:_key iv:_IV];
   // NSLog(@"解密后的%@",_ClearText.text);
    _ClearText.text =[_ClearText.text stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
   // NSLog(@"解码后的数据%@",_ClearText.text);
    _CipherText.text =@"";
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    return [textField resignFirstResponder];
}
@end
