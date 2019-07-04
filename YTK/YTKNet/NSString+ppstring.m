//
//  NSString+ppstring.m
//  YTK
//
//  Created by wang on 2019/7/4.
//  Copyright © 2019 wang. All rights reserved.
//

#import "NSString+ppstring.h"
#import <CommonCrypto/CommonDigest.h>
//引入IOS自带密码库
#import <CommonCrypto/CommonCryptor.h>

@implementation NSString (ppstring)
-(NSString *)md5 {
    //要进行UTF8的转码
    const char* input = [self UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(input, (CC_LONG)strlen(input), result);
    
    NSMutableString *digest = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    for (NSInteger i = 0; i < CC_MD5_DIGEST_LENGTH; i++) {
        [digest appendFormat:@"%02x", result[i]];
    }
    
    return digest;
}
@end
