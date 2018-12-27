

#import "SocketManager.h"

@implementation SocketManager

//连接到服务器
- (BOOL)connectServer:(NSString *)host Port:(int)port {
    BOOL success;
    self.socket = [[GCDAsyncSocket alloc] initWithDelegate:self delegateQueue:dispatch_get_main_queue()];
    //没有连接
//    if ( ![SocketManager shareSocketManager].socket.isConnected ) {
        NSError *error;
        success = [self.socket connectToHost:host onPort:port error:&error];
        if (error != nil) {
            NSLog(@"socket connectToHost error%@\n",error.localizedDescription);
        
            NSAssert(error, error.localizedDescription);
//        }
    }
  
    return success;
}

//连接成功
- (void)socket:(GCDAsyncSocket *)sock didConnectToHost:(NSString *)host port:(uint16_t)port {

    [self.socket readDataWithTimeout:-1 tag:0];
    NSString *obj = [NSString stringWithFormat:@">>>连接成功 回调\n Host:%@\n Port:%d",host,port];
    [self delegateMsg:obj];
}

//断开连接
/*
    [asyncSocket setDelegate:nil];
 * [asyncSocket disconnect];
 * [asyncSocket setDelegate:self];
 * [asyncSocket connect...];
 */
- (void)disConnectServer {
    [self.delegate XJSocketBackMessage:@">>>断开连接\n"];
    [self.socket setDelegate:nil];
    [self.socket disconnect];
    [self setDelegate:nil];
}

//断开的回调
- (void)socketDidDisconnect:(GCDAsyncSocket *)sock withError:(NSError *)err {
    NSString *er = [NSString stringWithFormat:@">>>断开连接的回调 error %@",err.localizedDescription];
    [self.delegate XJSocketBackMessage:er];
}

//接收信息
- (void)socket:(GCDAsyncSocket *)sock didReadData:(NSData *)data withTag:(long)tag {
    NSString *msg = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    [self delegateMsg:msg];
    [self.socket readDataWithTimeout:-1 tag:tag];
}

//发送信息
- (void)sendMessageType:(int)type Str:(NSString *)str {
    NSString *obj = [[NSString alloc] initWithString:str];
    NSData *data = [obj dataUsingEncoding:NSUTF8StringEncoding];
 
    [self.socket writeData:data withTimeout:-1 tag:type];
}

- (void)delegateMsg:(NSString *)msg {
    if (self.delegate && [self.delegate respondsToSelector: @selector(XJSocketBackMessage:)]) {
        [self.delegate XJSocketBackMessage:msg];
    } else {
        NSAssert(self.delegate, @"XJSocketBackMessage error\n");
        return;
    }
}

- (void)dealloc {
    NSLog(@"%s dealloc \n",__func__);
}




@end
