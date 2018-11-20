//
//  XJAFSubManager.h
//  XJKit
//
//  Created by 曾宪杰 on 2018/5/31.
//  Copyright © 2018年 曾宪杰. All rights reserved.
//


#import <Foundation/Foundation.h>
@import AFNetworking;

@interface XJAFSubManager : AFHTTPSessionManager

//+ (instancetype)shareClientWithStr:(NSString *)urlStr;

+ (instancetype)shareClient;

@end
