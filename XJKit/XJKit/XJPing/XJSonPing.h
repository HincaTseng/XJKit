//
//  XJSonPing.h
//  XJPing
//
//  Created by 曾宪杰 on 2018/11/26.
//  Copyright © 2018 zengxianjie. All rights reserved.
//
//封装LDSimplePing
#import <Foundation/Foundation.h>
#import "LDSimplePing.h"

NS_ASSUME_NONNULL_BEGIN
@protocol XJSonPingLogDelegate <NSObject>
- (void)appendPingLog:(NSString *)pingStr;
- (void)stopPingLog;

@end

//注意这里遵守的是LDSimplePingDelegate！！！
@protocol LDSimplePingDelegate;
@interface XJSonPing : NSObject <LDSimplePingDelegate>

@property (nonatomic,weak,readwrite) id<XJSonPingLogDelegate>delegate;

- (void)testWithHostName:(NSString *)hostName andPing:(BOOL)yesOrno;
- (void)stopPing;

@end


@interface PingTimer : NSObject
+ (long)getMicroSeconds;
+ (long)computeDurationSince:(long)uTime;

@end
NS_ASSUME_NONNULL_END
