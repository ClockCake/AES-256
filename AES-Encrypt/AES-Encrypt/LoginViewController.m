//
//  LoginViewController.m
//  AES-Encrypt
//
//  Created by 黄尧栋 on 03/02/2018.
//  Copyright © 2018 Apple.Inc. All rights reserved.
//

#import "LoginViewController.h"
#import "ViewController.h"
@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.Account.delegate =self;
    self.Password.delegate =self;
    self.PIn.delegate =self;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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


- (IBAction)LoginAction:(id)sender {
    //UIAlertController *AlertView =[UIAlertController alertControllerWithTitle:@"提示" message:@"请输入正确的Pin码" preferredStyle:UIAlertControllerStyleAlert];
   UIAlertController *Wrong =[UIAlertController alertControllerWithTitle:@"提示" message:@"账号密码或者Pin码错误" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *Cancel =[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    UIAlertAction *Default =[UIAlertAction actionWithTitle:@"好的" style:UIAlertActionStyleDefault handler:nil];
    //[AlertView addAction:Cancel];  [AlertView addAction:Default];
    [Wrong addAction:Cancel];     [Wrong addAction:Default];
    UIStoryboard *mainStoryBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    ViewController *VC =[mainStoryBoard instantiateViewControllerWithIdentifier:@"AES-256"];
    if ([_Account.text isEqualToString:@"HYD"] && [_Password.text isEqualToString:@"HYD"] && [_PIn.text isEqualToString:@"HYD"]) {
        [self.navigationController pushViewController:VC animated:YES];
    }
    else if (([_Account.text isEqualToString:@"HYD"] && [_Password.text isEqualToString:@"HYD"] &&[_PIn.text isEqualToString:@"HYD"]) == NO)
    {
        [self presentViewController:Wrong animated:YES completion:nil];
    }
    
   
}
@end
