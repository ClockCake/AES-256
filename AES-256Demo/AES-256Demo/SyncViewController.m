//
//  SyncViewController.m
//  AES-256Demo
//
//  Created by 黄尧栋 on 23/02/2018.
//  Copyright © 2018 Apple.Inc. All rights reserved.
//

#import "SyncViewController.h"

@interface SyncViewController ()

@end

@implementation SyncViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIAlertController *AC =[UIAlertController alertControllerWithTitle:@"提醒" message:@"同步功能需要登录" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *Cancel =[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    UIAlertAction *Default =[UIAlertAction actionWithTitle:@"好的" style:UIAlertActionStyleDefault handler:nil];
    [AC addAction:Cancel];  [AC addAction:Default];
    [self presentViewController:AC animated:YES completion:nil];
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

@end
