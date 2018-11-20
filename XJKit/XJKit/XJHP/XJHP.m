//
//  XJHP.m
//  XJKit
//
//  Created by 曾宪杰 on 2018/8/15.
//  Copyright © 2018年 曾宪杰. All rights reserved.
//

#import "XJHP.h"
#import <SystemConfiguration/CaptiveNetwork.h>

@implementation XJHP

+ (NSString *)isHaveProxy {
    CFDictionaryRef dicRef = CFNetworkCopySystemProxySettings();
    const CFStringRef stringRef = (const CFStringRef)CFDictionaryGetValue(dicRef, (const void *)kCFNetworkProxiesHTTPProxy);
    NSString *proxy = (__bridge NSString *)stringRef;
    
    return proxy;
}

@end
