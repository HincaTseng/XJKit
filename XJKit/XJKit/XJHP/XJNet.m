//
//  XJNet.m
//  XJKit
//
//  Created by 曾宪杰 on 2018/7/9.
//  Copyright © 2018年 曾宪杰. All rights reserved.
//

#import "XJNet.h"
#import "XJAFSubManager.h"
#import "XJHP.h"

@implementation XJNet
/**
 * 默认POST请求 timeout = 10.0s
 */
+ (void)requestAFURL:(NSString *)URLString
          parameters:(id)parameters
             succeed:(void (^) (id result))succeed
             failure:(void (^) (NSError *error)) failure
{
    BOOL isHaveProx = [XJHP isHaveProxy];
    if (!isHaveProx) {
   
        [self requestAFURL:URLString httpMethod:METHOD_POST parameters:parameters timeOut:10.0 succeed:^(id result) {
            if (result == nil || [result isEqual:[NSNull null]]) {
            	NSLog(@"XJNet NO result %s\n",__func__);
                return ;
            }

            succeed(result);
        } failure:^(NSError *error) {
            failure(error);
        }];
        
    }
    else {
//        [SVProgressHUD showErrorWithStatus:@"请关闭代理"];
    }
}

/**
 * AF数据请求
 */
+ (void)requestAFURL:(NSString *)URLString
          httpMethod:(NSInteger) method
          parameters:(id)parameters
             timeOut:(NSTimeInterval) timeOut
             succeed:(void (^) (id))succeed
             failure:(void (^) (NSError *)) failure
{
  
    
    NSString *finalURL = [@"HOSTIP" stringByAppendingString:URLString];
    //    AFHTTPSessionManager *manager = [self createHTTPSessionManager];
    XJAFSubManager * manager = [XJAFSubManager shareClient];
    NSLog(@"AFHTTPSessionManager URL :%@",finalURL);
    //设置超时时间
    manager.requestSerializer.timeoutInterval = timeOut;
    
    //网络请求
    if (method == METHOD_GET) {
//        [manager GET:finalURL
//          parameters:parameters
//            progress:^(NSProgress * _Nonnull downloadProgress) {
//
//            }
//             success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject)
//         {
//
//         }
//             failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//
//             }];
        [manager GET:finalURL
          parameters:parameters
            progress:^(NSProgress * _Nonnull downloadProgress) {
                
            }
             success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject)
         {
             
         }
             failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                 
             }];
    }else if (method == METHOD_POST)
    {
        
//        [manager POST:finalURL parameters:parameters headers:@{} progress:^(NSProgress * _Nonnull uploadProgress) {
//
//        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//            succeed(responseObject);
//        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//            failure(error);
//        }];
        [manager POST:finalURL parameters:parameters headers:@{} progress:^(NSProgress * _Nonnull uploadProgress) {
            
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            succeed(responseObject);
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            failure(error);
        }];

    }
}

//检测更新
//+ (void)loadUPDataNeed:(void (^)(NSString *, NSString *))success {
//    //=================根据appid检测====================
//    [HSUpdateApp hs_updateWithAPPID:CheckAPPID withBundleId:nil block:^(NSString *currentVersion, NSString *storeVersion, NSString *openUrl, BOOL isUpdate) {
//        if (isUpdate) {
//            success(storeVersion,openUrl);
//        }else{
//            NSLog(@"当前版本%@,商店版本%@，不需要更新",currentVersion,storeVersion);
//        }
//    }];
//}

/*
 AFNetworkReachabilityStatusUnknown          = -1,
 AFNetworkReachabilityStatusNotReachable     = 0,
 AFNetworkReachabilityStatusReachableViaWWAN = 1,
 AFNetworkReachabilityStatusReachableViaWiFi = 2,
 managerForDomain:@"5678"
 */

+ (void)checkNetworkingStatus:(void (^)(XJState))result {
    AFNetworkReachabilityManager *reachabilityManager = [AFNetworkReachabilityManager sharedManager];
    [reachabilityManager startMonitoring];
    [reachabilityManager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        
        if (status == AFNetworkReachabilityStatusUnknown) {
            
            if (result) result(XJStateUnknow);
            
        }else if (status == AFNetworkReachabilityStatusNotReachable){
            
            if (result) result(XJStateNoReachable);
            
        }else if (status == AFNetworkReachabilityStatusReachableViaWWAN){
            
            if (result) result(XJStateReachableViaWWAN);
            
        }else if (status == AFNetworkReachabilityStatusReachableViaWiFi){
            
            if (result) result(XJStateReachableViaWiFi);
            
        }
    }];
}


@end
