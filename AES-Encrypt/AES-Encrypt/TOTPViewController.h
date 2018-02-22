//
//  TOTPViewController.h
//  AES-Encrypt
//
//  Created by 黄尧栋 on 04/02/2018.
//  Copyright © 2018 Apple.Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TOTPViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *Date;
@property (weak, nonatomic) IBOutlet UILabel *DateStamp;
@property (weak, nonatomic) IBOutlet UILabel *Expired;
@property (weak, nonatomic) IBOutlet UILabel *InterceptingDigital;
@property (weak, nonatomic) IBOutlet UITextField *KeyChain;
@property (weak, nonatomic) IBOutlet UILabel *PinResult;

@end
