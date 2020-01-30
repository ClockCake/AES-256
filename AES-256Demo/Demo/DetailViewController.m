//
//  DetailViewController.m
//  AES-256Demo
//
//  Created by DayDream on 2020/1/30.
//  Copyright © 2020 Apple.Inc. All rights reserved.
//

#import "DetailViewController.h"
#import "NSString+AES_CBC.h"
#import "NSString+AES_ECB.h"
@interface DetailViewController ()
@property (nonatomic,strong) UILabel *appearLabel;
@property (nonatomic,strong) UITextField *inputTextField;

@end

@implementation DetailViewController

static NSString *key = @"DayDream";
static NSString *IV =  @"Aquila";

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    CGFloat w = [UIScreen mainScreen].bounds.size.width;
    CGFloat h = [UIScreen mainScreen].bounds.size.height;
    UITextField *textfield = [[UITextField alloc]initWithFrame:CGRectMake(20, 150, w - 40, 40)];
    textfield.textAlignment = NSTextAlignmentCenter;
    textfield.placeholder = @"在此输入明文/密文";
    [self.view addSubview:textfield];
    self.inputTextField = textfield;
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(self.view.center.x - 60, self.view.center.y - 15, 120, 30);
    [button setTitle:@"加密/解密" forState:UIControlStateNormal];
    button.titleLabel.textAlignment = NSTextAlignmentCenter;
    button.layer.cornerRadius = 5.f;
    button.layer.masksToBounds = YES;
    button.layer.borderWidth = 1.f;
    button.layer.borderColor = [UIColor greenColor].CGColor;
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(20, CGRectGetMaxY(button.frame), w - 40, h /2)];
    label.numberOfLines = 0;
    [self.view addSubview:label];
    self.appearLabel = label;
    
}

///  CBC 加密/解密 需要 密钥Key 和 向量两个变量

///  ECB  只需密钥Key
-(void)buttonClick:(UIButton *)sender
{
    switch (self.style) {
        case AES_CBC_Encrypt:
            self.appearLabel.text = [self.inputTextField.text AES256EncryptWithKey:key iv:IV];
            break;
        case AES_CBC_Decrypt:
            self.appearLabel.text = [self.inputTextField.text AES256DecryptWithKey:key iv:IV];
            break;
        case AES_ECB_Encrypt:
            self.appearLabel.text = [self.inputTextField.text aes256_encrypt:key];
            break;
        case AES_ECB_Decrypt:
            self.appearLabel.text = [self.inputTextField.text aes256_decrypt:key];
            break;
        default:
            break;
    }
    [self.inputTextField resignFirstResponder];
}


@end
