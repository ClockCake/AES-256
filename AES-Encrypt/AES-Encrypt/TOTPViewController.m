//
//  TOTPViewController.m
//  AES-Encrypt
//
//  Created by 黄尧栋 on 04/02/2018.
//  Copyright © 2018 Apple.Inc. All rights reserved.
//

#import "TOTPViewController.h"
#import "TOTPGenerator.h"
#import "MF_Base32Additions.h"
@interface TOTPViewController ()

@end

@implementation TOTPViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.KeyChain.delegate =self;
    [self UpdateUI];
    [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(UpdateUI) userInfo:nil repeats:YES];
    // Do any additional setup after loading the view.
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    
    return YES;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)UpdateUI
{
    NSDate *now =[NSDate date];
    NSDateFormatter *dateFormat =[[NSDateFormatter alloc]init];
    [dateFormat setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSTimeZone *TimeZone =[NSTimeZone timeZoneWithAbbreviation:@"GMT+8"];
    [dateFormat setTimeZone:TimeZone];
    _Date.text =[dateFormat stringFromDate:now];
    
    long timestamp = (long)[now timeIntervalSince1970];
    if(timestamp % [self.Expired.text integerValue] != 0){
        timestamp -= timestamp % [self.Expired.text integerValue];
    }
    self.DateStamp.text = [NSString stringWithFormat:@"%ld",timestamp];
    
    NSData *KeyData =[NSData dataWithBase32String:_KeyChain.text];
    long Max =[_InterceptingDigital.text longLongValue];
    long expired =[_Expired.text longLongValue];
    
    TOTPGenerator *Generator = [[TOTPGenerator alloc]initWithSecret:KeyData algorithm:kOTPGeneratorSHA1Algorithm digits:Max period:expired];
    
    _PinResult.text =[Generator generateOTPForDate:[NSDate dateWithTimeIntervalSince1970:timestamp]];
   
    
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
