//
//  XJSafeObject.h
//  XJKit
//
//  Created by 曾宪杰 on 2017/7/4.
//  Copyright © 2017年 曾宪杰. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XJSafeObject : NSObject
//设置
- (instancetype) initWithObject:(id) object;
//SEL方法
- (instancetype) initWithObject:(id)object withSelector:(SEL) selector;
//ex
- (void) excute;
@end
