//
//  XJGCD_Multithread.m
//  GCD
//
//  Created by 曾宪杰 on 2018/1/15.
//  Copyright © 2018年 曾宪杰. All rights reserved.
//

#import "XJGCD_Multithread.h"

@interface XJGCD_Multithread ()
//dispatch_get_global_queue ququ是创建全局队列
@property (nonatomic,strong)  dispatch_queue_t queue; //线程
@property (nonatomic) dispatch_group_t group;//组

@end;

@implementation XJGCD_Multithread

- (void)xjThread:(Thread)mQUE groupQue:(QUEUE)gQUE groupA:(GroupA_Block)gA groupB:(GroupB_Block)gB {
  
    _xjGCD_A_Block = gA;
    if (mQUE == Thread_CONCURRENT && _xjGCD_A_Block != nil  ) {
       _queue = dispatch_queue_create("XJKit.GCD_Multithread", DISPATCH_QUEUE_CONCURRENT);
    } else if (mQUE == Thread_SERIAL && _xjGCD_A_Block != nil){
         _queue = dispatch_queue_create("XJKit.GCD_Multithread", DISPATCH_QUEUE_SERIAL);
    } else {
        NSAssert(_queue = nil, @"请输入MainthreadQUEUE 并发还是单一 或 groupA 必须有数据");
        return;
    }
    __weak typeof(self) weakSelf = self;
    __strong typeof(weakSelf) strongSelf = weakSelf;
    //全局队列
    dispatch_queue_t ququ = dispatch_get_global_queue(gQUE, 0);
    _group = dispatch_group_create();
    //gA队列
        //组
        dispatch_group_async(_group, ququ, ^{
            
            strongSelf.xjGCD_A_Block();
        });

    //gB队列
    _xjGCD_B_Block = gB;
    if (_xjGCD_B_Block != nil) {
    
        dispatch_group_async(_group, ququ, ^{
            strongSelf.xjGCD_B_Block();
            
        });
        //在任务中如果完成就打印，依赖dispatch_wait
        //        dispatch_group_notify(group, ququ, ^{
        //            NSLog(@"group ---finished");
        //        });
    }

}

- (void)dealloc {
    NSLog(@"delloc %@",[self class]);
}
@end
