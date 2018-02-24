//
//  DecryptTableViewController.h
//  AES-256Demo
//
//  Created by 黄尧栋 on 24/02/2018.
//  Copyright © 2018 Apple.Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <LocalAuthentication/LocalAuthentication.h>
@interface DecryptTableViewController : UITableViewController
@property (weak, nonatomic) IBOutlet UITextField *TextField;
- (IBAction)DecryptAction:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *Label;
@property (strong,nonatomic) NSString * Key;
@property (strong,nonatomic) NSString *IV;
@property (strong,nonatomic) LAContext *Context;
@end
