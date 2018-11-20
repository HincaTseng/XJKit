//
//  XJURLSchemeOpen.h
//  XJKit
//
//  Created by 曾宪杰 on 2018/6/26.
//  Copyright © 2018年 曾宪杰. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XJURLSchemeOpen : NSObject

/**
  [XJURLSchemeOpen openScheme:@"supertech://?appName=应用名称&random=随机值"];

 @param scheme 要打开的URL Scheme
 */
+ (void)openScheme:(NSString *)scheme;


/**
 判断是否安装了该APP

 @param scheme URL Scheme
 @return 返回1 有，0没有。
 */
+ (BOOL)checkApp_Have:(NSString *)scheme;




@end
