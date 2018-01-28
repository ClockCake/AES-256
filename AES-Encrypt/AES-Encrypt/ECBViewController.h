//
//  ECBViewController.h
//  AES-Encrypt
//
//  Created by 黄尧栋 on 25/01/2018.
//  Copyright © 2018 Apple.Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NSString+AES_ECB.h"
@interface ECBViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *ClearText;
- (IBAction)EnercyAction:(id)sender;
- (IBAction)DecryptAction:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *CipherText;

@end
