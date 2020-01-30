//
//  NSData+AES_CBC.m
//  AES-Encrypt
//
//  Created by 黄尧栋 on 25/01/2018.
//  Copyright © 2018 Apple.Inc. All rights reserved.
//

#import "NSData+AES_CBC.h"

@implementation NSData (AES_CBC)
//加密
- (NSData *)AES256EncryptWithKey:(NSString *)key iv:(NSString *)iv
{
    return [self AES256operation:kCCEncrypt key:key iv:iv];
}

//解密
- (NSData *)AES256DecryptWithKey:(NSString *)key iv:(NSString *)iv
{
    return [self AES256operation:kCCDecrypt key:key iv:iv];
}

- (NSData *)AES256operation:(CCOperation)operation key:(NSString *)key iv:(NSString *)iv
{
    char keyPtr[kCCKeySizeAES256 + 1];
    bzero(keyPtr, sizeof(keyPtr));
    [key getCString:keyPtr maxLength:sizeof(keyPtr) encoding:NSUTF8StringEncoding];
    
    // IV
    char ivPtr[kCCBlockSizeAES128 + 1];
    bzero(ivPtr, sizeof(ivPtr));
    [iv getCString:ivPtr maxLength:sizeof(ivPtr) encoding:NSUTF8StringEncoding];
    
    size_t bufferSize = [self length] + kCCBlockSizeAES128;
    void *buffer = malloc(bufferSize);
    size_t numBytesEncrypted = 0;
    
    
    CCCryptorStatus cryptorStatus = CCCrypt(operation, kCCAlgorithmAES128, kCCOptionPKCS7Padding,
                                            keyPtr, kCCKeySizeAES256,
                                            ivPtr,
                                            [self bytes], [self length],
                                            buffer, bufferSize,
                                            &numBytesEncrypted);
    
    if(cryptorStatus == kCCSuccess){
        NSLog(@"Success");
        return [NSData dataWithBytesNoCopy:buffer length:numBytesEncrypted];
    }else{
        NSLog(@"Error");
    }
    
    free(buffer);
    return nil;
}




@end
