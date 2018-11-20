//
//  ShowPropertyFunc.h
//  XJKit
//
//  Created by 曾宪杰 on 2018/7/26.
//  Copyright © 2018年 曾宪杰. All rights reserved.
//

#import <Foundation/Foundation.h>
//https://www.jianshu.com/p/f4129b5194c0

@interface ShowPropertyFunc : NSObject

//打印类的所有属性
- (void)showAllProperty:(Class)allClass;
//打印类的所以方法
- (void)showAllFunction:(Class)allClass;

/*
 //    从showAllFunction中获取
 //    FunctionName：setCenterPlaceholder:  Type：v20@0:8B16
 //    FunctionName：centerPlaceholder Type： B16@0:8
 //    [searchBar setValue:@0 forKey:@"centerPlaceholder"];
 SEL selector = NSSelectorFromString(@"setCenterPlaceholder:");
 //是这个类
 if ([searchBar respondsToSelector:selector]) {
 NSMethodSignature *signature = [[UISearchBar class] instanceMethodSignatureForSelector:selector];
 NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:signature];
 [invocation setTarget:self];
 [invocation setSelector:selector];
 BOOL isCenter = NO;
 [invocation setArgument:&isCenter atIndex:2];
 [invocation invoke];
 }
*/
@end
