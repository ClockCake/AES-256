//
//  LoginViewController.h
//  AES-Encrypt
//
//  Created by 黄尧栋 on 03/02/2018.
//  Copyright © 2018 Apple.Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *Account;
@property (weak, nonatomic) IBOutlet UITextField *Password;
@property (weak, nonatomic) IBOutlet UITextField *PIn;
- (IBAction)LoginAction:(id)sender;

@end
