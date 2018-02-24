//
//  NSData+AES_CBC.h
//  AES-Encrypt
//
//  Created by 黄尧栋 on 25/01/2018.
//  Copyright © 2018 Apple.Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonCryptor.h>
@interface NSData (AES_CBC)
//加密
- (NSData *)AES256EncryptWithKey:(NSString *)key iv:(NSString *)iv;

//解密
- (NSData *)AES256DecryptWithKey:(NSString *)key iv:(NSString *)iv;




@end
