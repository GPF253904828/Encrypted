//
//  ViewController.m
//  Encrypted
//
//  Created by Damon on 16/2/15.
//  Copyright © 2016年 Damon. All rights reserved.
//

#import "ViewController.h"
#import <UIKit/UIKit.h>

#import "NSData+AES256.h"

#import "HashValue.h"

#import "NSData+Base64.h"
#import "Base64.h"
#import "GTMBase64.h"
#import "DHEncrypted.h"

@interface ViewController ()

@end

@implementation ViewController

static NSString * encryptKey = @"123456789";

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIView * v = [[UIView alloc] init];
    [self.view addSubview:v];
    
    NSDictionary * sendDictionary = @{@"0name":@"Damon",
                                      @"n9ame":@"Damon",
                                      @"na8me":@"Damon",
                                      @"nam7e":@"Damon",
                                      @"name6":@"Damon",
                                      @"name5":@"Damon",
                                      @"nam4e":@"Damon",
                                      @"na3me":@"Damon",
                                      @"agoe21":@"20"
                                      };
    NSError * vError = nil;
    NSData * sendData = [NSJSONSerialization dataWithJSONObject:sendDictionary options:NSJSONWritingPrettyPrinted error:&vError];
    NSData* key = [encryptKey dataUsingEncoding:NSUTF8StringEncoding];
    
    //加密
    NSData *encryptData = [DHEncrypted AES256Encrypt:sendData withEncryptKey:encryptKey];
    //解密
    NSData *decryptData = [DHEncrypted AES256Decrypt:encryptData withEncryptKey:encryptKey];
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:decryptData options:NSJSONReadingAllowFragments error:nil];
    NSLog(@"dic :%@",dic);
    
    //加密
    NSData *encryptDataD = [DHEncrypted AES256Encrypt:sendData withEncryptKeyData:key];
    //解密
    NSData *decryptDataD = [DHEncrypted AES256Decrypt:encryptDataD withDecryptKeyData:key];
    NSDictionary *dic2 = [NSJSONSerialization JSONObjectWithData:decryptDataD options:NSJSONReadingAllowFragments error:nil];
    NSLog(@"dic Data %@",dic2);
    
    
    
    
///**************************** AES256  ******************************/
//    //AES256加密
//    NSDictionary * sendDictionary = @{@"0name":@"Damon",
//                                      @"n9ame":@"Damon",
//                                      @"na8me":@"Damon",
//                                      @"nam7e":@"Damon",
//                                      @"name6":@"Damon",
//                                      @"name5":@"Damon",
//                                      @"nam4e":@"Damon",
//                                      @"na3me":@"Damon",
//                                      @"agoe21":@"20"
//                                      };
//    NSData * AES256Data = [self AES256Encrypt:sendDictionary];
//    NSLog(@"%ld",sendDictionary.count);
//
//    //AES256解密
//    NSDictionary * DecryptDict = [self AES256Decrypt:AES256Data];
//    NSLog(@"decrypt:%@ %ld",DecryptDict,DecryptDict.count);
///**************************** AES256  ******************************/
//    
//    
//    
//    
///**************************** Baes64  ******************************/
////    NSString * encodedString = @"this is string";
////    NSString * encodedString = @"这 个 是    字   符    saVVV?><?>>!@#$%^&*()#@#$串";
////    NSString * encodedString = @"82374soiuf23098";
//    NSString * encodedString = @"12345678";
//
//
//    //base64加密    AIA  自动截取长度 去空格
//    NSData* base64Data =  [NSData dataWithBase64EncodedString:encodedString];
//    NSLog(@"AIA base64 encode :%@",encodedString);
//    
//    //base64解密    AIA
//    NSString * encodingString = [base64Data base64Encoding];
//    NSLog(@"AIA base64 decode :%@",encodingString);
//    //aia的base64是自己修改过的加密解密
//    
//    
//    //网上通用 base64 加密
//    NSString * bef = [Base64 base64StringFromText:encodedString];
//    NSLog(@"common base64 bef :%@",bef);
//    
//    //网上通用 base64 解密
//    NSString * aft = [Base64 textFromBase64String:bef];
//    NSLog(@"common base64 aft :%@",aft);
//    
//    
//    //系统自带 base64 加密
////    NSData* originData = [encodedString dataUsingEncoding:NSASCIIStringEncoding];
//    NSData* originData = [encodedString dataUsingEncoding:NSUTF8StringEncoding];
//    NSString* encodeResult = [originData base64EncodedStringWithOptions:NSDataBase64EncodingEndLineWithLineFeed];
//    NSLog(@"system func base64 bef:%@",encodeResult);
//
//    //系统自带 base64 解密
//    NSData* decodeData = [[NSData alloc] initWithBase64EncodedString:encodeResult options:0];
////    NSString* decodeStr = [[NSString alloc] initWithData:decodeData encoding:NSASCIIStringEncoding];
//    NSString* decodeStr = [[NSString alloc] initWithData:decodeData encoding:NSUTF8StringEncoding];
//    NSLog(@"system func base64 aft:%@",decodeStr);
//    
//    
//    //Google base64 加密
//    NSString * bef3 = [GTMBase64 encodeBase64String:encodedString];
//    NSLog(@"Google base64 bef:%@",bef3);
//    //Google base64 加密
//    NSString * aft3 = [GTMBase64 decodeBase64String:bef3];
//    NSLog(@"Google base64 aft:%@",aft3);
//    
///**************************** Baes64  ******************************/
//    
//    
//    
//    
///**************************** sha256  ******************************/
//    NSString * password = @"111111";
//    NSData * hashPassword = [HashValue sha256HashWithString:password];
//    
///**************************** sha256  ******************************/
    
    
    
    
}

- (NSData *)AES256Encrypt:(NSDictionary *)sendDictionary{
    NSError * vError = nil;
    NSData * sendData = [NSJSONSerialization dataWithJSONObject:sendDictionary options:NSJSONWritingPrettyPrinted error:&vError];
    sendData = [sendData AES256EncryptWithKey:encryptKey];
    return sendData;
}
- (NSDictionary *)AES256Decrypt:(NSData *)getData{
    getData = [getData AES256DecryptWithKey:encryptKey];
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:getData options:NSJSONReadingAllowFragments error:nil];
    return dic;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
