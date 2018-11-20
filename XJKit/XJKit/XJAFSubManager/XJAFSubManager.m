//
//  XJAFSubManager.m
//  XJKit
//
//  Created by 曾宪杰 on 2018/5/31.
//  Copyright © 2018年 曾宪杰. All rights reserved.
//

#import "XJAFSubManager.h"

@implementation XJAFSubManager

//+ (instancetype)shareClientWithStr:(NSString *)urlStr {
//    static XJAFSubManager *_shareClient = nil;
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        _shareClient = [[XJAFSubManager alloc] initWithBaseURL:[NSURL URLWithString:urlStr]];
//        _shareClient.securityPolicy.allowInvalidCertificates = YES;
//        //    sessionManager.responseSerializer = [AFHTTPResponseSerializer serializer];
//        _shareClient.responseSerializer = [AFJSONResponseSerializer serializer];
//        //    [sessionManager.requestSerializer setValue:@"application/json;text/html;charset=utf-8;application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
//        _shareClient.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/x-www-form-urlencoded",@"application/json",@"text/json", @"text/plain", @"multipart/form-data",@"form-data",@"text/html",@"text/javascript", nil];
//
//        AFSecurityPolicy *securityPolicy = [AFSecurityPolicy defaultPolicy];
//        securityPolicy.allowInvalidCertificates = YES;
//        securityPolicy.validatesDomainName =  NO;
//        _shareClient.securityPolicy = securityPolicy;
//    });
//    return _shareClient;
//}


+ (instancetype)shareClient {
    static XJAFSubManager *_shareClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _shareClient = [[XJAFSubManager alloc] initWithBaseURL:[NSURL URLWithString:@""]];
        _shareClient.securityPolicy.allowInvalidCertificates = YES;
        //    sessionManager.responseSerializer = [AFHTTPResponseSerializer serializer];
        _shareClient.responseSerializer = [AFJSONResponseSerializer serializer];
        //    [sessionManager.requestSerializer setValue:@"application/json;text/html;charset=utf-8;application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
        _shareClient.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/x-www-form-urlencoded",@"application/json",@"text/json", @"text/plain", @"multipart/form-data",@"form-data",@"text/html",@"text/javascript", nil];
        
        AFSecurityPolicy *securityPolicy = [AFSecurityPolicy defaultPolicy];
        securityPolicy.allowInvalidCertificates = YES;
        securityPolicy.validatesDomainName =  NO;
        _shareClient.securityPolicy = securityPolicy;
    });
    return _shareClient;
}


@end
