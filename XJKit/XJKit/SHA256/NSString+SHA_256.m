//
//  NSString+SHA_256.m
//  XJKit
//
//  Created by 曾宪杰 on 2019/11/23.
//  Copyright © 2019 曾宪杰. All rights reserved.
//

#import "NSString+SHA_256.h"

@implementation NSString (SHA_256)

//static NSString* SHA256(NSString *a) {
//    NSData *data = [NSData dataWithContentsOfFile:self];
//           unsigned char digest[CC_SHA256_DIGEST_LENGTH];
//
//
//           CC_SHA256( data.bytes, (CC_LONG)data.length, digest );
//           NSMutableString* output = [NSMutableString stringWithCapacity:CC_SHA256_DIGEST_LENGTH * 2];
//
//           for(int i = 0; i < CC_SHA256_DIGEST_LENGTH; i++)
//               [output appendFormat:@"%02x", digest[i]];
//    //    f9c5234be9f62d089911394aebd3b06325a5717e9ff52dfd6ca4138052eb8e06
//    return output;
//}

@end
