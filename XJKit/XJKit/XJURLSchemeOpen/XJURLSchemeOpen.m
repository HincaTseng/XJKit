//
//  XJURLSchemeOpen.m
//  XJKit
//
//  Created by 曾宪杰 on 2018/6/26.
//  Copyright © 2018年 曾宪杰. All rights reserved.
//

#import "XJURLSchemeOpen.h"
#import <UIKit/UIKit.h>

@implementation XJURLSchemeOpen

+ (void)openScheme:(NSString *)scheme {
    
    UIApplication *app = [UIApplication sharedApplication];
    NSURL *url = [NSURL URLWithString:
                  [scheme stringByAddingPercentEncodingWithAllowedCharacters:
                                       [NSCharacterSet URLQueryAllowedCharacterSet]]];
    if ([app respondsToSelector:@selector(openURL:options:completionHandler:)]) {
        //ios 10 >
        if (@available(iOS 10.0, *)) {
            [app openURL:url options:@{} completionHandler:^(BOOL success) {
                NSLog(@"open   %@",scheme);
            }];
        } else {
            // Fallback on earlier versions
        }
    } else {
        if ([app canOpenURL:url]) {
            BOOL success = [app openURL:url];
            if (success) {
                NSLog(@"open   %@",scheme);
            } else {
                NSLog(@"open error");
            }
            
        }
    }
}

+ (BOOL)checkApp_Have:(NSString *)scheme {
    NSURL *url = [NSURL URLWithString:scheme];
    BOOL isOpen = [[UIApplication sharedApplication] canOpenURL:url];
    if (isOpen) {
        return YES;
    } else {
        return NO;
    }
}
@end

