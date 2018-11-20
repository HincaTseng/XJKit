//
//  XJSafeObject.m
//  XJKit
//
//  Created by 曾宪杰 on 2017/7/4.
//  Copyright © 2017年 曾宪杰. All rights reserved.
//

#import "XJSafeObject.h"
@interface XJSafeObject()
{
    __weak id _object;
    SEL _sel;
}

@end

@implementation XJSafeObject
- (instancetype)initWithObject:(id)object {
    if (self = [super init]) {
        _object = object;
        _sel = nil;
    }
    return self;
}

- (instancetype)initWithObject:(id)object withSelector:(SEL)selector {
    if (self = [super init]) {
        _object = object;
        _sel = nil;
    }
    return self;
}

-(void)excute {
    if (_object && _sel &&[_object respondsToSelector:_sel]) {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
        [_object performSelector:_sel withObject:nil];
#pragma clang diagnostic pop
    }
}
@end
