//
//  NSString+AES_CBC.h
//  AES-Encrypt
//
//  Created by 黄尧栋 on 25/01/2018.
//  Copyright © 2018 Apple.Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonCryptor.h>
#import "NSData+AES_CBC.h"
@interface NSString (AES_CBC)
//加密
- (NSString *)AES256EncryptWithKey:(NSString *)key iv:(NSString *)iv;

//解密
- (NSString *)AES256DecryptWithKey:(NSString *)key iv:(NSString *)iv;
@end
