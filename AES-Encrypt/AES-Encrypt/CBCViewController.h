//
//  CBCViewController.h
//  AES-Encrypt
//
//  Created by 黄尧栋 on 25/01/2018.
//  Copyright © 2018 Apple.Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CBCViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *ClearText;
@property (weak, nonatomic) IBOutlet UITextField *CipherText;

- (IBAction)EncryptAction:(id)sender;
- (IBAction)DecryptAction:(id)sender;
@property (strong,nonatomic) NSString *key;
@property (strong,nonatomic) NSString *IV;

@end
