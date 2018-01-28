//
//  NSString+AES_ECB.h
//  AES-Encrypt
//
//  Created by 黄尧栋 on 25/01/2018.
//  Copyright © 2018 Apple.Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSData+AES_ECB.h"
@interface NSString (AES_ECB)
-(NSString *) aes256_encrypt:(NSString *)key;
-(NSString *) aes256_decrypt:(NSString *)key;
@end
