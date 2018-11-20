//
//  XJSemaphore.m
//  XJKit
//
//  Created by 曾宪杰 on 2018/7/21.
//  Copyright © 2018年 曾宪杰. All rights reserved.
//

#import "XJSemaphore.h"

@implementation XJSemaphore

- (void)testGCD {
    NSInteger totallcoutn  = 2;
    __block NSInteger curentcount = 0;
    dispatch_semaphore_t semp = dispatch_semaphore_create(0);
    dispatch_queue_t ququ = dispatch_get_global_queue(0, 0);
    dispatch_async(ququ, ^{
        //method...
        if (++curentcount == totallcoutn) {
            dispatch_semaphore_signal(semp);
        }
        //.....
        //method ...
        if (++ curentcount == totallcoutn) {
            dispatch_semaphore_signal(semp);
        }
        //...
        dispatch_semaphore_wait(semp, DISPATCH_TIME_FOREVER);
        dispatch_async(dispatch_get_main_queue(), ^{
            //...back data
        });
    });
}

//- (void)ququ {
//    dispatch_queue_t glob = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
//
//
//    dispatch_group_t group = dispatch_group_create();
//    dispatch_group_async(group, glob, ^{
//
//    });
//    dispatch_group_async(group, dispatch_get_main_queue(), ^{
//
//    });
//}


@end
