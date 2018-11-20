//
//  XJNet.h
//  XJKit
//
//  Created by 曾宪杰 on 2018/7/9.
//  Copyright © 2018年 曾宪杰. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>

enum HTTPMETHOD{
    METHOD_GET = 0, //GET请求
    METHOD_POST = 1,  //POST请求
};

typedef  NS_ENUM(NSInteger,XJState) {
    XJStateUnknow = -1,
    XJStateNoReachable = 0,
    XJStateReachableViaWWAN = 1,
    XJStateReachableViaWiFi = 2
};

@interface XJNet : NSObject

@property (nonatomic,copy) NSString *hostIP;

/**
 * 默认POST请求 timeout = 10.0s
 */
+ (void)requestAFURL:(NSString *)URLString
          parameters:(id)parameters
             succeed:(void (^) (id result))succeed
             failure:(void (^) (NSError *error)) failure;


/**
 check up
 
 @param success yes
 */
+ (void)loadUPDataNeed:(void(^)(NSString *version,NSString *urlStr))success;

/**
 根据端口号检测网络状态 自己在.m中填写端口号
 
 @param result 状态
 */
+ (void)checkNetworkingStatus:(void(^)(XJState state))result;

@end
