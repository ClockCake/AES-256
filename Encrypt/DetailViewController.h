//
//  DetailViewController.h
//  AES-256Demo
//
//  Created by DayDream on 2020/1/30.
//  Copyright © 2020 Apple.Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef NS_ENUM(NSUInteger, AEStyle) {
    AES_CBC_Encrypt,
    AES_CBC_Decrypt,
    AES_ECB_Encrypt,
    AES_ECB_Decrypt,
};
@interface DetailViewController : UIViewController
@property (nonatomic,assign) AEStyle style;

@end

NS_ASSUME_NONNULL_END
