//
//  XJGCD_Multithread.h
//  GCD
//
//  Created by 曾宪杰 on 2018/1/15.
//  Copyright © 2018年 曾宪杰. All rights reserved.
//
/*
 分两个异步线程就够了，为啥还要再分组呢。。
 因为：给gcd做暂停需要，在串行时，可以让gB等gA完成后异步执行。比如刷新UI。并且用全局的untilTime限制任务超时。
 一个线程一个组
 
 网上暂停gcd 直接return，但是文档说在已经执行的队列是不能停的。不适用这。
 https://www.zhihu.com/question/23919984
 http://www.cocoachina.com/ios/20180530/23566.html
 */

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger,Thread) {
    Thread_CONCURRENT = 0,//DISPATCH_QUEUE_CONCURRENT
    Thread_SERIAL //DISPATCH_QUEUE_SERIAL
};

typedef enum {
   QUEUE_DEFAULT = 0, //DISPATCH_QUEUE_PRIORITY_DEFAULT 0
    QUEUE_HIGH = 2,//DISPATCH_QUEUE_PRIORITY_HIGH 2
    QUEUE_LOW = -2 //DISPATCH_QUEUE_PRIORITY_LOW (-2)
}QUEUE;

typedef void(^GroupA_Block)(void);
typedef void(^GroupB_Block)(void);

@interface XJGCD_Multithread : NSObject

@property (nonatomic,copy) GroupA_Block xjGCD_A_Block;
@property (nonatomic,copy) GroupB_Block xjGCD_B_Block;

/**
 多线程，gA必须要有。
 注意：队列为SERIAL时，先gA，再gB执行。

 @param mQUE 任务队列并行/串行
 @param gQUE 任务队列优先级
 @param gA 队列A (required)
 @param gB 队列B (optional)
 */
- (void)xjThread:(Thread)mQUE groupQue:(QUEUE)gQUE groupA:(GroupA_Block)gA groupB:(GroupB_Block)gB;
@end
