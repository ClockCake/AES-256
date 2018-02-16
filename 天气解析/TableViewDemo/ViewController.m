//
//  ViewController.m
//  TableViewDemo
//
//  Created by 黄尧栋 on 07/02/2018.
//  Copyright © 2018 Apple.Inc. All rights reserved.
//

#import "ViewController.h"
#import <AFNetworking.h>
#import "TableViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.TextField.delegate =self;
    UIAlertController *alert =[UIAlertController alertControllerWithTitle:@"警告" message:@"请输入正确的城市名称" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *Cancel =[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    UIAlertAction *Default =[UIAlertAction actionWithTitle:@"好的" style:UIAlertActionStyleDefault handler:nil];
    [alert addAction:Cancel]; [alert addAction:Default];
    [self presentViewController:alert animated:YES completion:nil];
 
    // Do any additional setup after loading the view, typically from a nib.
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)Analysis:(id)sender {
    TableViewController *TVC =[[TableViewController alloc]init];

    _city =[NSString stringWithFormat:@"http://v.juhe.cn/weather/index?cityname=%@&dtype=&format=&key=0c83ada2bef0911d6def678f5b0816e2",[_TextField.text stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    NSError *error;
    AFHTTPSessionManager *Manager =[AFHTTPSessionManager manager];
    [Manager GET:_city parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        CFRunLoopStop(CFRunLoopGetMain());
        _RootDic = [responseObject objectForKey:@"result"];
        TVC.dic =self.RootDic;
        [self.navigationController pushViewController:TVC animated:YES];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        //NSLog(@"%d",error.code);
    }];
    CFRunLoopRun();
    
    
}
@end
