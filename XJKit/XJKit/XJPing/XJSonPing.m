//
//  XJSonPing.m
//  XJPing
//
//  Created by 曾宪杰 on 2018/11/26.
//  Copyright © 2018 zengxianjie. All rights reserved.
//
#include <sys/socket.h>
#include <netdb.h>
#import "XJSonPing.h"

//PingTimer
#import <sys/time.h>

#define MAX_PING 4
@interface XJSonPing ()
{
    BOOL _isStartSuccess;//第一次是否ping成功
    BOOL _isLargePing;
    int _sendCount;//当前执行次数
    long _startTime;//每次执行的开始时间
    NSString *_hostAddress;//IP地址
    NSTimer *timer;
}
@property (nonatomic,strong,readwrite) LDSimplePing *pinger;

@end

@implementation XJSonPing
@synthesize pinger = _pinger;

- (void)testWithHostName:(NSString *)hostName andPing:(BOOL)yesOrno {
    assert(self.pinger == nil);
    self.pinger = [[LDSimplePing alloc] initWithHostName:hostName];
    assert(self.pinger != nil);
    
    _isLargePing = !yesOrno;
    self.pinger.delegate = self;
    [self.pinger start];
    
    //当前线程中执行
    _sendCount = 1;
    do {
        [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:[NSDate distantFuture]];
    } while (self.pinger != nil || _sendCount <= MAX_PING);
}

-(void)stopPing {
    [self->_pinger stop];//self ->_pinger stop
    self.pinger = nil;
    _sendCount = MAX_PING + 1;
}

- (void)sendPing {
    if (timer) {
        [timer invalidate];
    }
    
    if (_sendCount > MAX_PING) {
        _sendCount++;
        self.pinger = nil;
        
        if (self.delegate && [self.delegate respondsToSelector:@selector(stopPingLog)]) {
            [self.delegate stopPingLog];
        }
    }
    else {
        assert(self.pinger != nil);
        _sendCount++;
        _startTime = [PingTimer getMicroSeconds];
        if (_isLargePing) {
            NSString *testStr = @"";
            for (int i = 0; i<408; i++) {
                testStr = [testStr stringByAppendingString:@"abcdefghi "];
            }
            testStr = [testStr stringByAppendingString:@"abcdefgh"];
            NSData *data = [testStr dataUsingEncoding:NSASCIIStringEncoding];
            [self.pinger sendPingWithData:data];
        }
        else {
            [self.pinger sendPingWithData:nil];
        }
        //不重复
        timer = [NSTimer scheduledTimerWithTimeInterval:3.0 target:self selector:@selector(pingTimeOut:) userInfo:[NSNumber numberWithInt:_sendCount] repeats:NO];
    }
}

- (void)pingTimeOut:(NSTimer *)sender {
    if ([[sender userInfo] intValue] == _sendCount && _sendCount <= MAX_PING + 1 && _sendCount > 1) {
        NSString *tiemOut = [NSString stringWithFormat:@"ping: cannot resolve %@: TImeout\n",_hostAddress ];
        if (self.delegate && [self.delegate respondsToSelector:@selector(appendPingLog:)]) {
            [self.delegate appendPingLog:tiemOut];
        }
        [self sendPing];
    }
}

#pragma mark - LDSimplePing delegate

- (void)simplePing:(LDSimplePing *)pinger didStartWithAddress:(NSData *)address {
#pragma unused(pinger)
    assert(pinger == self.pinger);
    assert(address != nil);
    _hostAddress = [self displayAddressForData:address];
    NSLog(@"ping %@",_hostAddress);
    
    _isStartSuccess = YES;
    [self sendPing];
}

- (void)simplePing:(LDSimplePing *)pinger didFailWithError:(NSError *)error {
#pragma unused(pinger)
    assert(pinger == self.pinger);
#pragma unused(error)
    NSString *failCreateLog = [NSString stringWithFormat:@"#%u try create failed: %@",_sendCount,[self shortErrorFromError:error]];
    //失败的原因。。。
    if (self.delegate && [self.delegate respondsToSelector:@selector(appendPingLog:)]) {
        [self.delegate appendPingLog:failCreateLog];
    }
    
    if (_isStartSuccess) {
        [self sendPing];
    } else {
        [self stopPing];
    }
}

- (void)simplePing:(LDSimplePing *)pinger didSendPacket:(NSData *)packet sequenceNumber:(uint16_t)sequenceNumber {
#pragma unused(pinger)
    assert(pinger == self.pinger);
#pragma unused(packet)
    NSLog(@"#%u send success",sequenceNumber);
}

- (void)simplePing:(LDSimplePing *)pinger didFailToSendPacket:(nonnull NSData *)packet sequenceNumber:(uint16_t)sequenceNumber error:(nonnull NSError *)error {
    
#pragma unused(pinger)
    assert(pinger == self.pinger);
#pragma usused(packet)
#pragma usused (error)
    NSString *sendFailLog = [NSString stringWithFormat:@"#%u send failed %@\n",sequenceNumber,[self shortErrorFromError:error]];
    if (self.delegate && [self.delegate respondsToSelector:@selector(appendPingLog:)]) {
        [self.delegate appendPingLog:sendFailLog];
    }
    
    [self sendPing];
}

- (void)simplePing:(LDSimplePing *)pinger didReceivePingResponsePacket:(NSData *)packet sequenceNumber:(uint16_t)sequenceNumber {
#pragma unused(pinger)
    assert(pinger == self.pinger);
#pragma unused(packet)
    //ipv6的header中没有TTL
    NSString *icmp = [NSString stringWithFormat:@"%@",[LDSimplePing icmpInPacket:packet]->type == 129 ?@"ICMPv6TypeEchoReply" : @"ICMPv4TypeEchoReply"];
    NSString *successLog = [NSString stringWithFormat:@"%lu bytes from %@ icmp_seq=#%u type=%@ time= %ldms",(unsigned long)[packet length],_hostAddress,sequenceNumber,icmp,[PingTimer computeDurationSince:_startTime] / 100];
    //
    if (self.delegate && [self.delegate respondsToSelector:@selector(appendPingLog:)]) {
        [self.delegate appendPingLog:successLog];
    }
    
    [self sendPing];
}

- (void)simplePing:(LDSimplePing *)pinger didReceiveUnexpectedPacket:(NSData *)packet {
    const ICMPHeader *icmper;
    if (self.pinger && pinger == self.pinger) {
        icmper = [LDSimplePing icmpInPacket:packet];
        NSString *errorLog = @"";
        if (icmper != NULL) {
            errorLog = [NSString stringWithFormat:@"#%u unexpected ICMP type=%u,code=%u,identifier=%u",
                        (unsigned int)OSSwapBigToHostInt16(icmper->sequenceNumber),
                        (unsigned int)icmper->type,
                        (unsigned int)icmper->code,
                        (unsigned int)OSSwapBigToHostInt16(icmper->identifier)
                        ];
        } else {
            errorLog = [NSString stringWithFormat:@"#%u try unexpected packet size=%zu",_sendCount,(size_t)[packet length]];
        }
        
        if (self.delegate && [self.delegate respondsToSelector:@selector(appendPingLog:)]) {
            [self.delegate appendPingLog:errorLog];
        }
    }
    
    [self sendPing];
}

- (NSString *)displayAddressForData:(NSData *)address {
    int err;
    NSString *result = nil;
    char hostStr[NI_MAXHOST];
    
    if (address != nil) {
        err = getnameinfo([address bytes], (socklen_t)[address length], hostStr, sizeof(hostStr), NULL, 0, NI_NUMERICHOST);
        if (err == 0) {
            result = [NSString stringWithCString:hostStr encoding:NSASCIIStringEncoding];
            assert(result != nil);
        }
    }
    return result;
}

- (NSString *)shortErrorFromError:(NSError *)error {
  
    NSString *result = nil;
    NSNumber *failureNum;
    int failure;
    const char *failureStr;
    
    assert(error != nil);
    
    result = nil;
    
    if ([[error domain] isEqual:(NSString *)kCFErrorDomainCFNetwork] && ([error code] == kCFHostErrorUnknown)) {
        failureNum = [[error userInfo] objectForKey:(id)kCFGetAddrInfoFailureKey];
        if ([failureNum isKindOfClass:[NSNumber class]]) {
            failure = [failureNum intValue];
            if (failure != 0) {
                failureStr = gai_strerror(failure);
                if (failureStr != NULL) {
                    result = [NSString stringWithUTF8String:failureStr];
                    assert(result != nil);
                }
            }
        }
        
    }
    
    if (result == nil) {
        result = [error localizedFailureReason];
    }
    if (result == nil) {
        result = [error localizedDescription];
    }
    if (result == nil) {
        result = [error description];
    }
    
    assert(result != nil);
    return result;
}

- (void)dealloc {
    NSLog(@"%s\n",__func__);
}

@end


@implementation PingTimer

+ (long)getMicroSeconds {
    struct timeval time;
    gettimeofday(&time, NULL);
    return time.tv_usec;
}

+ (long)computeDurationSince:(long)uTime {
    long now = [PingTimer getMicroSeconds];
    if (now < uTime) {
        return 1000000 - uTime + now;
    }
    return now - uTime;
}


@end


