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
    
    _ClearText.text = [_CipherText.text aes256_decrypt:@"ucf-Gx4-dsn-oyH"];
    _ClearText.text =[_ClearText.text stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    _CipherText.text =@"";
}
@end
