

#import <Foundation/Foundation.h>
#import <CocoaAsyncSocket/CocoaAsyncSocket.h>
//固定的头部长度
//起始符(1Byte) + 目标地址(2byte) + 源地址(2byte) + 应用层数据长度(2byte) = 7Byte

@protocol XJSocketBackDelegate <NSObject>
- (void)XJSocketBackMessage:(NSString *)msg;
@end

@interface SocketManager : NSObject <GCDAsyncSocketDelegate>
@property (nonatomic,strong) GCDAsyncSocket *socket;
@property (nonatomic,weak) id <XJSocketBackDelegate> delegate;


/**
 连接
 @param host 地址
 @param port 端口
 */
-  (BOOL)connectServer:(NSString *)host Port:(int)port;

/**
 断开连接
 */
- (void)disConnectServer;

/**
 发送数据
 @param type tag值
 @param str 字符串
 */
- (void)sendMessageType:(int)type Str:(NSString *)str;



@end
