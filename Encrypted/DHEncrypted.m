//
//  DHEncrypted.m
//  Encrypted
//
//  Created by Damon on 16/7/8.
//  Copyright © 2016年 Damon. All rights reserved.
//

#import "DHEncrypted.h"
#import <CommonCrypto/CommonDigest.h>
#import "NSData+AES256.h"

@implementation DHEncrypted

+ (NSData *)AES256Encrypt:(NSData *)enData withEncryptKey:(NSString *)key{
    NSData * returnData = nil;
    if (enData.length > 0){
        if (key.length == 0 || key == nil) {
            key = @"";
        }
        returnData = [enData AES256EncryptWithKey:key];
    }
    return returnData;
}
+ (NSData *)AES256Decrypt:(NSData *)getData withEncryptKey:(NSString *)key{
    NSData * returnData = nil;
    if (getData.length > 0){
        if (key.length == 0 || key == nil) {
            key = @"";
        }
        returnData = [getData AES256DecryptWithKey:key];
    }
    return returnData;
}
+ (NSData *)AES256Encrypt:(NSData *)enData withEncryptKeyData:(NSData *)key{
    NSData * returnData = nil;
    if (enData.length > 0){
        if (key.length == 0 || key == nil) {
            key = [NSData data];
        }
        returnData = [enData AES256EncryptWithKeyData:key];
    }
    return returnData;
}
+ (NSData *)AES256Decrypt:(NSData *)getData withDecryptKeyData:(NSData *)key{
    NSData * returnData = nil;
    if (getData.length > 0){
        if (key.length == 0 || key == nil) {
            key = [NSData data];
        }
        returnData = [getData AES256DecryptWithKeyData:key];
    }
    return returnData;
}
+ (NSString*)encodeBase64String:(NSString *)input{
    if (input == nil  || input.length== 0){
        return nil;
    }
    NSData* originData = [input dataUsingEncoding:NSUTF8StringEncoding];
    NSString* encodeResult = [originData base64EncodedStringWithOptions:NSDataBase64EncodingEndLineWithLineFeed];
    return encodeResult;
}
+ (NSString*)decodeBase64String:(NSString *)input{
    if (input == nil  || input.length== 0){
        return nil;
    }
    NSData* decodeData = [[NSData alloc] initWithBase64EncodedString:input options:0];
    NSString* decodeStr = [[NSString alloc] initWithData:decodeData encoding:NSUTF8StringEncoding];
    return decodeStr;
}

+ (NSString *) md5:(NSString *)str{
    const char *cStr = [str UTF8String];
    unsigned char result[16];
    CC_MD5( cStr, strlen(cStr), result );
    NSMutableString *retStr = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    for(int i = 0; i < CC_MD5_DIGEST_LENGTH; i++)
        [retStr appendFormat:@"%02x", result[i]];
    return retStr;
}
@end
