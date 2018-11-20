//
//  ShowPropertyFunc.m
//  XJKit
//
//  Created by 曾宪杰 on 2018/7/26.
//  Copyright © 2018年 曾宪杰. All rights reserved.
//

#import "ShowPropertyFunc.h"
#import <objc/runtime.h>

@implementation ShowPropertyFunc

- (void)showAllProperty:(Class)allClass {
    unsigned int count;
    objc_property_t *properties = class_copyPropertyList(allClass, &count);
    for (int i = 0; i < count; i++) {
        objc_property_t property = properties[i];
        //        1.2425 *804.02 = 998.99485
        const char *cName = property_getName(property);
        NSString *name = [NSString stringWithCString:cName encoding:NSUTF8StringEncoding];
        NSLog(@"showAllProperty %@",name);
    }
}

- (void)showAllFunction:(Class)allClass {
    unsigned int count;
    Method *methods = class_copyMethodList(allClass, &count);
    for (int i = 0; i < count; i++) {
        Method method = methods[i];
        SEL selector = method_getName(method);
        NSString *name = NSStringFromSelector(selector);
        const char *type = method_getTypeEncoding(method);
        NSLog(@"showAllFunction name: %@ type: %s",name,type);
    }
}

@end
