//
//  XJMD5File.m
//  XJKit
//
//  Created by 曾宪杰 on 2019/1/21.
//  Copyright © 2019 曾宪杰. All rights reserved.
//

#import "XJMD5File.h"
#import <CommonCrypto/CommonDigest.h>

@implementation XJMD5File

- (void)calculateFileMd5WithFilePath:(NSString *)filePath completion:(void (^)(NSString *fileMD5))completion
{
    //生成文件的MD5   校验的是压缩包的MD5  判断下载是否正确
    NSFileHandle *handle = [NSFileHandle fileHandleForReadingAtPath:filePath];
    if( handle == nil ) {
        NSLog(@"文件出错");
    }
    
    CC_MD5_CTX md5;
    CC_MD5_Init(&md5);
    BOOL done = NO;
    while(!done)
    {
        NSData* fileData = [handle readDataOfLength: 256 ];
        CC_MD5_Update(&md5, [fileData bytes], (CC_LONG)[fileData length]);
        if( [fileData length] == 0 ) done = YES;
    }
    unsigned char digest[CC_MD5_DIGEST_LENGTH];
    CC_MD5_Final(digest, &md5);
    NSString *fileMD5 = [NSString stringWithFormat: @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
                         digest[0], digest[1],
                         digest[2], digest[3],
                         digest[4], digest[5],
                         digest[6], digest[7],
                         digest[8], digest[9],
                         digest[10], digest[11],
                         digest[12], digest[13],
                         digest[14], digest[15]];
    NSLog(@"生成的文件MD5为:%@",fileMD5);
    completion(fileMD5);
}


@end
