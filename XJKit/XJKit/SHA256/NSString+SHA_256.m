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

/*
 
  NSString *filePatch = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)objectAtIndex:0]stringByAppendingPathComponent:@"xiaoxi.plist"];
      NSLog(@"------filepath---%@",filePatch);

  NSMutableDictionary *dic = [NSMutableDictionary dictionary];
  [dic setValue:@"1" forKey:@"break"];
  [dic setValue:@"2019-11-23" forKey:@"day"];
  
  [dic writeToFile:filePatch atomically:YES];
  //查看
  NSMutableDictionary *dataDictionary = [[NSMutableDictionary alloc] initWithContentsOfFile:filePatch];
  NSString *obj = SHA256(filePatch);
  NSLog(@"---plist一开始保存时候的内容---%@ sha 256 %@\n",dataDictionary,obj);

 
  //修改
  NSMutableDictionary *editDic = [[NSMutableDictionary alloc] initWithContentsOfFile:filePatch];;
  [editDic setObject:@"2" forKey:@"break"];
  [editDic writeToFile:filePatch atomically:YES];
  
  NSString *objj = SHA256(filePatch);
  NSLog(@"---plist做过操作之后的字典里面内容---%@sha 256 %@\n",editDic,objj);
  

 
 */

@end
