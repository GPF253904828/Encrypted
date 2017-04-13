//
//  DHEncrypted.h
//  Encrypted
//
//  Created by Damon on 16/7/8.
//  Copyright © 2016年 Damon. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DHEncrypted : NSObject

#pragma  mark -AES256
+ (NSData *)AES256Encrypt:(NSData *)enData withEncryptKey:(NSString *)key;
+ (NSData *)AES256Decrypt:(NSData *)getData withEncryptKey:(NSString *)key;

+ (NSData *)AES256Encrypt:(NSData *)enData withEncryptKeyData:(NSData *)key;
+ (NSData *)AES256Decrypt:(NSData *)getData withDecryptKeyData:(NSData *)key;

#pragma  mark -Base64
+ (NSString*)encodeBase64String:(NSString *)input;
+ (NSString*)decodeBase64String:(NSString *)input;

#pragma mark - MD5
+ (NSString *) md5:(NSString *)str;
@end
